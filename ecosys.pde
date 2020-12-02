import java.util.*;

int entC;

PlayArea PA;

int EntCount = 0;


void setup() {
  PA = new PlayArea(100, 10, 1);
  size(800, 800);

  frameRate(60);
}


long startTime;

void draw() {
  startTime = System.nanoTime();
  background(254);
  PA.Run();
  //println("frame: " + (System.nanoTime() - startTime)/1000000.0 + " ms - " + 1000/((System.nanoTime() - startTime)/1000000.0) + " fps");
}
