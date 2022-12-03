/* Organism class
 
 parent: the parent that generated this organism
 generation: the generation this organism belongs to
 body: this organism body
 fitness: a number that represents how close to the target the body is
 mutationRate: a percentage indicating the chance each body component has of changing to a random value
 **/

class Organism {
  Organism parent;
  Generation generation;
  String body;
  float fitness;
  int mutationRate;

  Organism(Organism part, Generation gen, int mutRate) {
    generation = gen;
    parent = part;
    mutationRate = mutRate;

    if (generation.number == 0) {
      char[] bodyArray = new char[target.length()];

      for (int i = 0; i < bodyArray.length; i++) {
        bodyArray[i] = alphabet[int(random(alphabet.length))];
      }

      body = new String(bodyArray);
    } else {
      body = parent.body;
      mutate();
    }

    fitness = getFitness();
  }

  float getFitness() {

    int size = body.length();

    char[] targetArray = target.toCharArray();
    char[] bodyArray = body.toCharArray();

    int correctCount = 0;

    for (int i = 0; i < size; i++) {
      if (targetArray[i] == bodyArray[i]) {
        correctCount++;
      }
    }

    return (float) correctCount / size;
  }

  void mutate() {
    char[] bodyArray = body.toCharArray();

    for (int i = 0; i < bodyArray.length; i++) {
      int chance = int(random(100)) + 1;

      if (chance <= mutationRate) {
        bodyArray[i] = alphabet[int(random(alphabet.length))];
      }
    }

    body = new String(bodyArray);
  }
}
