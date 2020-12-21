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
      HP += HP < MaxHP ? 1 : 0;
    }
    if (e instanceof Herbivore) {
      //https://matbhtx.systime.dk/index.php?id=111
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(-1).mult(mass);
      AddImpuls(impVect);

      if (HP == MaxHP && e.HP == e.MaxHP) {
        world.AddNext.add(new Herbivore(world, pos.x, pos.y, vel.x *-1, vel.y *-1));
        HP =1 ;
        e.HP =1;
      }
    }
  }

  @Override
    void Pull(Entity e) {
    if (e instanceof Carnivore) {
      //https://matbhtx.systime.dk/index.php?id=111
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(-0.25);
      AddImpuls(impVect);
    }
  }
}
