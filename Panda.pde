class Panda {
  float x, y, d, speed;
  float xdirection, ydirection;

  boolean visibility = true; 
  int dir; 

  Panda(float xc, float yc, float dc) {
    x = xc;
    y = yc;
    d = dc;
    speed = random(1.5, 3.5);
    
    dir = (int) random(0, 2);
    if(dir == 0){ xdirection = -1; } else { xdirection = 1; }
    dir = (int) random(0, 2);
    if(dir == 0){ ydirection = -1; } else { ydirection = 1; }
    }

  void display() {
    if (visibility) { 
      noStroke();
      //orelhas
      fill(360-x/2, 100, 100-y/10);
      circle(x-0.35*d, y-0.3*d, d/2);
      circle(x+0.35*d, y-0.3*d, d/2);

      //cabeça
      fill(0, 0, 100);
      circle(x, y, d);

      //olheiras
      fill(360-x/2, 100, 100-y/10);
      circle(x-0.25*d, y, d/3);
      circle(x+0.25*d, y, d/3);

      //olhos
      strokeWeight(1);
      stroke(0, 0, 100);
      fill(0, 0, 0);
      circle(x-0.22*d, y, d/10);
      circle(x+0.22*d, y, d/10);
      fill(0, 0, 100);
      circle(x-0.25*d, y-0.02*d, d/60);
      circle(x+0.19*d, y-0.02*d, d/60);

      //nariz
      noStroke();
      fill(360-x/2, 100, 100-y/10);
      circle(x, y+0.1*d, d/15);  

      //bochecha
      fill(0, 42, 95);
      ellipse(x+0.27*d, y+0.2*d, d/4, d/10);
      ellipse(x-0.27*d, y+0.2*d, d/4, d/10);

      //boca
      noFill();
      stroke(60, 0, 20);
      strokeWeight(1.8);
      arc(x, y+0.2*d, d/4, d/10, radians(0), radians(180));
    }
  }    

  void move() {
    x = x + (speed * xdirection);
    y = y + (speed * ydirection);

    if (x < d/2 || x > width-d/2) { 
      xdirection *= -1;
    }
    if (y < d/2 || y > height-d/2) { 
      ydirection *= -1;
    }
  }

  boolean click() {
    float distance = dist(x, y, mouseX, mouseY);
    if (distance < d/2) {
      return true;
    } else { 
      return false;
    }
  }
}  
