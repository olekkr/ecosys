class Herbivore extends Entity {

  Herbivore(PlayArea aWorld, float px, float py, float vx, float vy) {
    pos.set(px, py);
    vel.set(vx, vy);
    world = aWorld;

    clr = #69e530;
    size = 30;
    pullDist = 100;
  }



  @Override
    void Collide(Entity e) {
    if (e instanceof Plant) {
      e.clearNextFrame = true;
    }
    if (e instanceof Herbivore) {
      //https://matbhtx.systime.dk/index.php?id=111
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(-1).mult(mass);
      AddImpuls(impVect);
    }
  }

  @Override
    void Pull(Entity e) {
    if (e instanceof Plant) {
      //https://matbhtx.systime.dk/index.php?id=111
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(1).mult(0.1);
      AddImpuls(impVect);
    }
  }
}
