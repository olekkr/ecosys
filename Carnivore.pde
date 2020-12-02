class Carnivore extends Entity {
  Carnivore (PlayArea aWorld, float px, float py, float vx, float vy) {
    pos.set(px, py);
    vel.set(vx, vy);
    world = aWorld;

    pullDist = 100;
    clr = #e55130;
  }
  void Collide(Entity e) {
    if (e instanceof Herbivore) {
      e.clearNextFrame = true;
    }
    println(HP);
  }
  
  void Pull(Entity e) {
    if (e instanceof Herbivore) {
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(1).mult(0.13);
      AddImpuls(impVect);
    }
  }
}
