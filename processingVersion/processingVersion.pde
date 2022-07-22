int x, y;
int px, py;
int step = 1;
int state = 0;
int numSteps = 1;
int turnCounter = 1;

// Scale / resolution
int stepSize = 5;
int totalSteps;

// Function to test if number is prime
boolean isPrime(int value) {
  if (value == 1) return false;
  for (int i = 2; i <= sqrt(value); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

void setup() {
  size(1920, 1920);

  // set up spiral
  int cols = width / stepSize;
  int rows = height / stepSize;
  totalSteps = cols * rows;
  x = width / 2;
  y = height / 2;
  px = x;
  py = y;
  background(0);

  while(step <= totalSteps){
  // If prime draw circle
  fill(255);
  stroke(255);
  if (isPrime(step)) { 
    point(x,y);
  }
  
  // Connect current to previous with a line
  //line(x, y, px, py);
  px = x;
  py = y;

  // Move according to state
  switch (state) {
    case 0:
      x += stepSize;
      break;
    case 1:
      y -= stepSize;
      break;
    case 2:
      x -= stepSize;
      break;
    case 3:
      y += stepSize;
      break;
  }
  
  // Change state
  if (step % numSteps == 0) {
    state = (state + 1) % 4;
    turnCounter++;
    if (turnCounter % 2 == 0) {
      numSteps++;
    }
  }
  step++;
  
  }
}
