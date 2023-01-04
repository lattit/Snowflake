ArrayList <Flake> mySnowflake;
int spokeNum = 10;
Flake myFlake;
void setup() {
  size(500, 500);
  mySnowflake = new ArrayList<Flake> ();
  myFlake = new Flake();
  mySnowflake.add(myFlake);
}
void draw() {
  translate(width/2, height/2);
  background(250);
  if (!myFlake.ended || !myFlake.stuck) {
    myFlake.move();
  }
  if (myFlake.update()) {
    myFlake = new Flake();
    if (getLastElement().x >= width/2 - getLastElement().fS) {
      noLoop();
    }
    mySnowflake.add(myFlake);
  }

  for (int i=0; i< spokeNum; i++) {
    rotate(2*PI/spokeNum);
    showFlakes();

    //use the get() and the size() method to get the last flake in the arrayList
  }
}


Flake getLastElement() {
  int sizeOfSnowflake = mySnowflake.size()-1;
  Flake lastElement = mySnowflake.get(sizeOfSnowflake);
  return lastElement;
}

void showFlakes () {
  for (Flake f : mySnowflake) {
    f.show();
  }
}
