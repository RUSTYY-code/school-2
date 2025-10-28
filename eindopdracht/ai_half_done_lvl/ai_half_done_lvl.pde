import java.util.ArrayList;

Player player;
ArrayList<Platform> platforms;

ArrayList<GravityZone> zones;

boolean[] keys = new boolean[128];

void setup() {
  fullScreen();

  player = new Player(100, 400, 50, 50);

  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(0, 550, 300, height));          // Start platform (left wall)
  platforms.add(new Platform(300, 100, 100, 20));
  platforms.add(new Platform(600, 150, 100, 20));
  platforms.add(new Platform(800, 200, 100, 20));
  platforms.add(new Platform(900, 100, 200, 20));
  platforms.add(new Platform(1275, 100, 70, 20));
  platforms.add(new Platform(1400, 200, 50, 20));
  platforms.add(new Platform(1300, 300, 50, 20));
  platforms.add(new Platform(width-286, 550, 300, height));  // Finish platform (right wall)

  zones = new ArrayList<GravityZone>();
  zones.add(new GravityZone(
    320, 520, 45,
    GravityZone.MODE_TOGGLE, 
    0.5
    ));


  zones.add(new GravityZone(
    width - 180, 520, 50,
    GravityZone.MODE_SET, 
    0.5                                   
    ));
}

void keyPressed() {
  if (key < 128) keys[key] = true;
}

void keyReleased() {
  if (key < 128) keys[key] = false;
}

void update() {
  if (keys['a'] || keys['A']) {
    player.xVelocity = -5;
  } else if (keys['d'] || keys['D']) {
    player.xVelocity = 5;
  } else {
    player.xVelocity = 0;
  }

 
  float gSign = player.gravity > 0 ? 1 : -1;
  if ((keys['w'] || keys['W'] || keys[' ']) && player.onGround) {
    player.yVelocity = -10 * gSign;  // against gravity direction
    player.onGround = false;
  }

  // --- Integrate motion ---
  player.x += player.xVelocity;
  player.y += player.yVelocity;
  player.yVelocity += player.gravity;
  player.onGround = false;

  if (player.y > height + 150 || player.y < -150) player.respawn();

  // --- Gravity zones: apply when overlapping (cooldown prevents rapid re-trigger) ---
  for (GravityZone z : zones) {
    if (z.overlaps(player) && player.flipCooldown <= 0) {
      z.apply(player);
      player.flipCooldown = 40; // ~2/3s at 60fps
      break; // avoid applying multiple zones on the same frame
    }
  }
  player.flipCooldown = max(0, player.flipCooldown - 1);

  // --- Platform collisions ---
  for (Platform p : platforms) {
    if (player.intersects(p)) {
      resolveCollision(player, p);
    }
  }

  // --- Optional horizontal clamp ---
  player.x = constrain(player.x, -200, width + 200);
}

void draw() {
  background(135, 206, 235);

  update();

  // World
  for (Platform p : platforms) p.display();

  // Zones
  for (GravityZone z : zones) z.display(player);

  // Player
  player.display();

  // HUD
  fill(0, 100);
  noStroke();
  rect(20, 20, 240, 54, 8);
  fill(255);
  textSize(18);
  textAlign(LEFT, CENTER);
  String gTxt = player.gravity > 0 ? "Gravity: DOWN (normal)" : "Gravity: UP (flipped)";
  text(gTxt, 30, 47);
}

// ------------ Collision Resolution ------------
// Works for both gravity directions.
// If moving with gravity (down if g>0, up if g<0), we land against that face and zero y-velocity.
// If moving against gravity, treat as head bump and push away slightly.
void resolveCollision(Player pl, Platform pf) {
  float overlapLeft   = (pl.x + pl.w) - pf.x;
  float overlapRight  = (pf.x + pf.w) - pl.x;
  float overlapTop    = (pl.y + pl.h) - pf.y;
  float overlapBottom = (pf.y + pf.h) - pl.y;

  float minHoriz = min(overlapLeft, overlapRight);
  float minVert  = min(overlapTop, overlapBottom);

  boolean resolveVert = (abs(pl.yVelocity) >= abs(pl.xVelocity)) || (minVert <= minHoriz);

  float dir = pl.gravity > 0 ? 1 : -1; // +1 falling down, -1 falling up

  if (resolveVert) {
    if (pl.yVelocity * dir > 0) {
      // moving with gravity -> land on surface facing gravity
      if (dir > 0) {
        pl.y = pf.y - pl.h; // top face
      } else {
        pl.y = pf.y + pf.h; // bottom face (stick to underside)
      }
      pl.yVelocity = 0;
      pl.onGround = true;
    } else {
      // head/ceiling bump (against gravity)
      if (dir > 0) {
        pl.y = pf.y + pf.h;
      } else {
        pl.y = pf.y - pl.h;
      }
      pl.yVelocity = 4 * dir; // small nudge away
    }
  } else {
    // Horizontal push-out
    if (overlapLeft < overlapRight) {
      pl.x = pf.x - pl.w;
    } else {
      pl.x = pf.x + pf.w;
    }
    pl.xVelocity = 0;
  }
}


class Player {
  float x, y, w, h;
  float yVelocity = 0;
  float xVelocity = 0;
  float gravity = 0.5;   // positive = pull down, negative = pull up
  boolean onGround = false;
  float spawnX, spawnY;

  int flipCooldown = 0;  // frames until next zone can trigger

  Player(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    spawnX = x;
    spawnY = y;
  }

  void setGravity(float g) {
    // Gentle stabilize when changing gravity abruptly
    if (sign(gravity) != sign(g)) {
      yVelocity *= -0.25;
    }
    gravity = g;
  }

  // Utility for sign
  int sign(float v) {
    return v >= 0 ? 1 : -1;
  }

  void respawn() {
    x = spawnX;
    y = spawnY;
    xVelocity = 0;
    yVelocity = 0;
    gravity = 0.5; // reset to normal on respawn
    onGround = false;
    flipCooldown = 0;
  }

  boolean intersects(Platform p) {
    return (x + w > p.x && x < p.x + p.w && y + h > p.y && y < p.y + p.h);
  }

 
}

class Platform {
  float x, y, w, h;

  Platform(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(0, 200, 0);
    noStroke();
    rect(x, y, w, h);
  }
}
// Two modes:
//  - MODE_TOGGLE : multiplies player's gravity by -1 (flip up/down)
//  - MODE_SET    : sets player's gravity to targetGravity (e.g., 0.5 for normal/down)
class GravityZone {
  static final int MODE_TOGGLE = 0;
  static final int MODE_SET    = 1;

  float x, y, r;
  int mode;
  float targetGravity;

  GravityZone(float x, float y, float r, int mode, float targetGravity) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.mode = mode;
    this.targetGravity = targetGravity;
  }

  boolean overlaps(Player pl) {
    float cx = pl.x + pl.w/2.0;
    float cy = pl.y + pl.h/2.0;
    // Treat player like a circle with radius ~min(w,h)*0.45 to make overlap feel natural
    return dist(cx, cy, x, y) <= (r + min(pl.w, pl.h)*0.45);
  }

  void apply(Player pl) {
    if (mode == MODE_TOGGLE) {
      pl.setGravity(pl.gravity * -1);
    } else if (mode == MODE_SET) {
      pl.setGravity(targetGravity);
    }
  }

  void display(Player pl) {
    // Visual styling:
    //  - Toggle zone: blue/orange depending on what it would flip you to
    //  - Set zone   : green to indicate "normalize"
    noStroke();
    strokeWeight(3);

    if (mode == MODE_TOGGLE) {
      // If currently down, this zone would flip you up -> blue
      // If currently up, this zone would flip you down -> orange
      if (pl.gravity > 0) {
        stroke(40, 120, 255);
        fill(40, 120, 255, 60);
      } else {
        stroke(255, 140, 0);
        fill(255, 140, 0, 60);
      }
    } else {
      // Normalize zone always green
      stroke(0, 180, 100);
      fill(0, 180, 100, 60);
    }

    ellipse(x, y, r*2, r*2);
  }
}
