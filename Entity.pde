class Entity {
  PVector pos = new PVector(); 
  PVector vel = new PVector();
  PlayArea world;
  int ticks = 0;
  int HP;
  int MaxHP;
  float size;
  color clr = #dddddd;
  boolean clearNextFrame = false;
  float mass = 1;
  float pullDist;

  Entity() {
    HP = 10;
    MaxHP = 20;
    size = 30;
  }

  void Render() {
    noStroke();
    fill(clr);
    circle(pos.x, pos.y, size);
  }

  void Move() {
    vel.x *= pos.x <= world.bounds[0] || pos.x >= world.bounds[2] ? -1 : 1;
    vel.y *= pos.y <= world.bounds[1] || pos.y >= world.bounds[3] ? -1 : 1;

    pos.x += vel.x;
    pos.y += vel.y;
  }

  void CheckPulls () {
    for (Entity e : world.Entities) {
      
      //println("fart");
      if ((pos.dist(e.pos) > e.pullDist/2 + pullDist/2) && e!= this) {
        e.Pull(this);
      }
    }
  }

  void CheckCollisions() {
    for (Entity e : world.Entities) {
      if ((pos.dist(e.pos) < e.size/2 + size/2) && e!= this) {
        Collide(e);
        e.Collide(this);
      }
    }
  }

  void Collide(Entity e) {
  }

  void Update() {
    ticks += 1;
  }

  void AddImpuls(PVector imp) {
    //vel.set((imp.x + vel.x ), (imp.y + vel.y ));
    vel.set((imp.x + vel.x * mass)/mass, (imp.y + vel.y * mass)/mass);
  }

  void slow() {
    if (vel.mag() > 2) {
      vel.mult(0.993);
    }
  }

  void Pull(Entity e) {
  }
}
