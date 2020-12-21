class Plant extends Entity {

  Plant(PlayArea aWorld, float x, float y) {
    pos.set(x, y);
    vel.set(0, 0);
    world = aWorld;
    size = 10;
    clr = #2eaa0b;

    pullDist = 100;

    mass = 0.3;
  }

  // optimizations:
  @Override
    void Move() {
  }
  @Override
    void CheckPulls() {
  }
  @Override
    void CheckCollisions() {
  }
}
