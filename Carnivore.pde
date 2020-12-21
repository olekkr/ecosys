class Carnivore extends Entity {
  Carnivore (PlayArea aWorld, float px, float py, float vx, float vy) {
    pos.set(px, py);
    vel.set(vx, vy);
    world = aWorld;
    
    size = 60;
    pullDist = 100;
    clr = #e55130;
  }
  void Collide(Entity e) {
    if (e instanceof Herbivore) {
      e.clearNextFrame = true;
      AddHP(1);
    }
    if (e instanceof Carnivore) {
      //https://matbhtx.systime.dk/index.php?id=111
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(-1).mult(mass);
      AddImpuls(impVect);

      if (HP == MaxHP && e.HP == e.MaxHP) {
        world.AddNext.add(new Carnivore(world, pos.x, pos.y, vel.x *-1, vel.y *-1));
        HP =1 ;
        e.HP =1;
      }
    }
  }
  
  void Pull(Entity e) {
    if (e instanceof Herbivore) {
      PVector collisionDir = e.pos.copy().sub(pos);
      PVector impVect = collisionDir.copy().setMag(1).mult(0.13);
      AddImpuls(impVect);
    }
  }
}
