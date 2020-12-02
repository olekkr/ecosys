class Carnivore extends Entity {
  Carnivore (PlayArea aWorld, float px, float py, float vx, float vy) {
    pos.set(px, py);
    vel.set(vx, vy);
    world = aWorld;

    clr = #e55130;
  }
  void Collide(Entity e) {
    if (e instanceof Herbivore) {
      e.clearNextFrame = true;
    }
  }
}
