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

  @Override
    void Render() {
    noStroke();
    fill(clr);
    circle(pos.x, pos.y, 10);
  }

  @Override
    void Move() {
  }
}
