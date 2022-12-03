/* Constants **/

char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'ç', 'Ç', ' ', '.', ',', '"', '?', '!'};
String target = "\"And everywhere Lamb went, Wolf was sure to follow.\"";
int totalChildrenByGeneration = 1000;
int mutation = 1;

/* Variables and Objects declaration **/

Generation generationZero = new Generation(null, 0, 1);
Organism fittestOrganism = generationZero.children[0];
int generationCount = 0;

HashMap<Integer, Generation> checkpoints = new HashMap<Integer, Generation>();

boolean end = false;

void setup() {
  size(1000, 500);
  println("Generation Zero: ", fittestOrganism.body);
  checkpoints.put(0, fittestOrganism.generation);
}

void draw() {
  if (!end) {

    generationCount++;
    Generation gen = new Generation(fittestOrganism, generationCount, totalChildrenByGeneration);

    gen.populate();
    fittestOrganism = gen.getFittest();

    drawGeneration(gen);

    println("Generation ", generationCount);
    println("Fittest: ", fittestOrganism.body);

    if (fittestOrganism.body.equals(target)) end = true;
  }
}
