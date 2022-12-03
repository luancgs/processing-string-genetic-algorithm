/* Display file
 
 Functions related to displaying the values to the screen.
 Not related to the genetic algorithm.
 **/

int BACKGROUND_COLOR = 220;
int LEFT_OFFSET = 10;

void drawGeneration(Generation gen) {

  Organism fittest = gen.getFittest();
  getCheckpoints(gen.getFittest());

  drawTarget();
  drawFittest(fittest);
  drawGenInfo(gen);
  drawSeparator();
  drawCheckpoints();
}

void drawTarget() {
  background(BACKGROUND_COLOR);
  fill(160);
  textSize(14);
  String targetDraw = "Target: " + target;
  text(targetDraw, LEFT_OFFSET, 20);
}

void drawFittest(Organism fittest) {
  textSize(32);
  fill(getFittestColor(fittest));
  text(fittestOrganism.body, LEFT_OFFSET, 65);
}

void drawGenInfo(Generation gen) {
  textSize(16);
  fill(100);
  String text = "Generation: " + gen.number;
  text(text, LEFT_OFFSET, 100);
  text("| Mutation Rate: " + mutation + "%   | Organisms in each generation: " + gen.totalOrganisms, LEFT_OFFSET + int(textWidth("Generation: 000 |")), 100);
}

void drawSeparator() {
  stroke(75);
  line(LEFT_OFFSET, 120, width-LEFT_OFFSET, 125);
}

void drawCheckpoints() {
  for (int i = checkpoints.size() - 1; i >= 0; i--) {
    String checkpointGen = "Generation: " + checkpoints.get(i).number;
    int textHeight = 160+(i*30);
    int generationTextWidth = int(textWidth("Generation: 000 |"));
    text(checkpointGen, LEFT_OFFSET, textHeight);

    text("| " + checkpoints.get(i).getFittest().body, LEFT_OFFSET + generationTextWidth, textHeight);
  }
}

void getCheckpoints(Organism fittest) {
  checkpoints.put(ceil(fittest.fitness*10), fittest.generation);
}

color getFittestColor(Organism fittest) {
  float fitness = fittest.fitness;

  if (fitness < 0.14) {
    return color(244, 67, 105);
  } else if (fitness < 0.28) {
    return color(214, 66, 112);
  } else if (fitness < 0.42) {
    return color(183, 64, 119);
  } else if (fitness < 0.56) {
    return color(153, 63, 126);
  } else if (fitness < 0.70) {
    return color(123, 62, 132);
  } else if (fitness < 0.84) {
    return color(92, 60, 139);
  } else {
    return color(62, 59, 146);
  }
}
