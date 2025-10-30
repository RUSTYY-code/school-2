Player player;
ArrayList<Platform> platforms;

ArrayList<GravityZone> zones;

boolean[] keys = new boolean[128];

void setup() {
  fullScreen();

  player = new Player(100, 400, 50, 50);

  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(0, 550, 300, height)); // Start platform (left wall)
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
    player.yVelocity = -10 * gSign;
    player.onGround = false;
  }

  player.x += player.xVelocity;
  player.y += player.yVelocity;
  player.yVelocity += player.gravity;
  player.onGround = false;

  if (player.y > height + 150 || player.y < -150) player.respawn();

  for (GravityZone z : zones) {
    if (z.overlaps(player) && player.flipCooldown <= 0) {
      z.apply(player);
      player.flipCooldown = 40;
      break;
    }
  }
  player.flipCooldown = max(0, player.flipCooldown - 1);

  for (Platform p : platforms) {
    if (player.intersects(p)) {
      resolveCollision(player, p);
    }
  }


  player.x = constrain(player.x, -200, width + 200);
}

void draw() {
  background(135, 206, 235);

  update();


  for (Platform p : platforms) p.display();

  for (GravityZone z : zones) z.display(player);

  player.display();

}


void resolveCollision(Player pl, Platform pf) {
  float overlapLeft   = (pl.x + pl.w) - pf.x;
  float overlapRight  = (pf.x + pf.w) - pl.x;
  float overlapTop    = (pl.y + pl.h) - pf.y;
  float overlapBottom = (pf.y + pf.h) - pl.y;

  float minHoriz = min(overlapLeft, overlapRight);
  float minVert  = min(overlapTop, overlapBottom);

  boolean resolveVert = (abs(pl.yVelocity) >= abs(pl.xVelocity)) || (minVert <= minHoriz);

  float dir = pl.gravity > 0 ? 1 : -1;

  if (resolveVert) {
    if (pl.yVelocity * dir > 0) {
      if (dir > 0) {
        pl.y = pf.y - pl.h;
      } else {
        pl.y = pf.y + pf.h;
      }
      pl.yVelocity = 0;
      pl.onGround = true;
    } else {
      if (dir > 0) {
        pl.y = pf.y + pf.h;
      } else {
        pl.y = pf.y - pl.h;
      }
      pl.yVelocity = 4 * dir;
    }
  } else {
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
  float gravity = 0.5;
  boolean onGround = false;
  float spawnX, spawnY;
  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }

  int flipCooldown = 0;
  Player(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    spawnX = x;
    spawnY = y;
  }

  void setGravity(float g) {
    if (sign(gravity) != sign(g)) {
      yVelocity *= -0.25;
    }
    gravity = g;
  }

  int sign(float v) {
    return v >= 0 ? 1 : -1;
  }

  void respawn() {
    x = spawnX;
    y = spawnY;
    xVelocity = 0;
    yVelocity = 0;
    gravity = 0.5;
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
    fill(200, 0, 0);
    noStroke();
    rect(x, y, w, h);
  }
}
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
    noStroke();
    strokeWeight(3);

    if (mode == MODE_TOGGLE) {
      if (pl.gravity > 0) {
        stroke(40, 120, 255);
        fill(40, 120, 255, 60);
      } else {
        stroke(255, 140, 0);
        fill(255, 140, 0, 60);
      }
    } else {
      stroke(0, 180, 100);
      fill(0, 180, 100, 60);
    }

    ellipse(x, y, r*2, r*2);
  }
}
