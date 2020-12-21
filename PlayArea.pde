class PlayArea {
  LinkedList<Entity> Entities;
  float[] bounds = {0, 0, width, height};
  LinkedList<Entity> AddNext = new LinkedList<Entity>();

  PlayArea(int plants, int herbivores, int carnivores ) {
    // ---- Plants
    Entities = new LinkedList();
    for (int i=0; i < plants; i++) {
      Entities.add(new Plant(
        this, 
        random(bounds[0], bounds[2]), 
        random(bounds[1], bounds[3])));
    }
    // ---- Herbivores
    for (int i=0; i < herbivores; i++) {
      Entities.add(new Herbivore(
        this, 
        random(bounds[0], bounds[2]), 
        random(bounds[1], bounds[3]), 
        random(-5, 5), 
        random(-5, 5)));
    }
    // ---- Carnivores
    for (int i=0; i < carnivores; i++) {
      Entities.add(new Carnivore(
        this, 
        random(bounds[0], bounds[2]), 
        random(bounds[1], bounds[3]), 
        random(-5, 5), 
        random(-5, 5)));
    }
  }

  void Run() {
    if (Entities.size() < 2000) {
      spawnPlants(2);
    }

    for (Entity e : Entities) {
      e.Render();
      e.Move();
      e.CheckPulls();
      e.CheckCollisions(); 
      e.Update();
      e.slow();
    }
    cleanEntites();
    
  }
  void spawnPlants (int n) {
    for (int i=0; i < n; i++) {
      Entities.add(new Plant(
        this, 
        random(bounds[0], bounds[2]), 
        random(bounds[1], bounds[3])));
    }
  }
  
  
  
  
  void cleanEntites() {
    Iterator iter = Entities.iterator();
    Entity e;
    while (iter.hasNext()) {
      e = (Entity)iter.next();
      if (e.clearNextFrame) {
        iter.remove();
      }
    }
    Entity ee;
    Iterator it = AddNext.iterator();
    while (it.hasNext()) {
      ee = (Entity) it.next() ;
      Entities.add(ee);
    }
    AddNext.clear();
  }
}
