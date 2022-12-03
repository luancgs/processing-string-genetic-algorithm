/* Generation class
 
 number: generation number
 totalOrganisms: how many organisms this generation should hold
 parent: the organism that generated this generation
 children: array of organisms children of the parent organism
 **/

class Generation {
  int number;
  int totalOrganisms;
  Organism parent;
  Organism[] children;

  Generation(Organism part, int num, int t) {
    number = num;
    totalOrganisms = t;
    parent = part;

    children = new Organism[totalOrganisms];

    if (parent == null) {
      populate();
    }
  }

  void populate() {
    for (int i = 0; i < totalOrganisms; i++) {
      children[i] = new Organism(parent, this, mutation);
    }
  }

  Organism getFittest() {
    float greatestFitness = 0;
    Organism fittest = parent;

    for (int i = 0; i < children.length; i++) {
      float childFitness = children[i].getFitness();

      if (childFitness >= greatestFitness) {
        greatestFitness = childFitness;
        fittest = children[i];
      }
    }

    return fittest;
  }
}
