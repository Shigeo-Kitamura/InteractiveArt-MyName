import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Kita_1> kita_1;
ArrayList<Kita_2> kita_2;
ArrayList<Kita_3> kita_3;
ArrayList<Kita_4> kita_4;
ArrayList<Kita_5> kita_5;
ArrayList<Mura_1> mura_1;
ArrayList<Mura_2> mura_2;
ArrayList<Mura_3> mura_3;
ArrayList<Mura_4> mura_4;
ArrayList<Mura_5> mura_5;
ArrayList<Mura_6> mura_6;
ArrayList<Mura_7> mura_7;

PImage img, bg;
PImage[] chr;
int flag = 0;
int difficulty = 0; //easy = 1, nomal = 2, hard = 3
float ms = 0;
boolean[] clr;
boolean NorM = false; //true = M, false = N
float kita1_x, kita1_y, kita1_angle;
float kita2_x, kita2_y, kita2_angle;
float kita3_x, kita3_y, kita3_angle;
float kita4_x, kita4_y, kita4_angle;
float kita5_x, kita5_y, kita5_angle;
float mura1_x, mura1_y, mura1_angle;
float mura2_x, mura2_y, mura2_angle;
float mura3_x, mura3_y, mura3_angle;
float mura4_x, mura4_y, mura4_angle;
float mura5_x, mura5_y, mura5_angle;
float mura6_x, mura6_y, mura6_angle;
float mura7_x, mura7_y, mura7_angle;

void setup() {
  size(600, 600);
  smooth();
  frameRate(60);
  refresh();
  chr = new PImage[13];
  chr[1] = loadImage("kita_1.png");
  chr[2] = loadImage("kita_2.png");
  chr[3] = loadImage("kita_3.png");
  chr[4] = loadImage("kita_4.png");
  chr[5] = loadImage("kita_5.png");
  chr[6] = loadImage("mura_1.png");
  chr[7] = loadImage("mura_2.png");
  chr[8] = loadImage("mura_3.png");
  chr[9] = loadImage("mura_4.png");
  chr[10] = loadImage("mura_5.png");
  chr[11] = loadImage("mura_6.png");
  chr[12] = loadImage("mura_7.png");
  clr = new boolean[13];

  //Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  //Create ArrayLists
  kita_1 = new ArrayList<Kita_1>();
  kita_2 = new ArrayList<Kita_2>();
  kita_3 = new ArrayList<Kita_3>();
  kita_4 = new ArrayList<Kita_4>();
  kita_5 = new ArrayList<Kita_5>();
  mura_1 = new ArrayList<Mura_1>();
  mura_2 = new ArrayList<Mura_2>();
  mura_3 = new ArrayList<Mura_3>();
  mura_4 = new ArrayList<Mura_4>();
  mura_5 = new ArrayList<Mura_5>();
  mura_6 = new ArrayList<Mura_6>();
  mura_7 = new ArrayList<Mura_7>();
  boundaries = new ArrayList<Boundary>();

  //Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/2, height-5, width, 10));
  boundaries.add(new Boundary(width/2, 5, width, 10));
  boundaries.add(new Boundary(width-5, height/2, 10, height));
  boundaries.add(new Boundary(5, height/2, 10, height));
}

void draw() {
  refresh();
  box2d.step();

  for (int i = 0; i < boundaries.size (); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }

  //show FPS
  fill(255);
  textSize(10);
  text("FPS:" + (int)frameRate, 10, 10);

  //title
  if (flag == 0) {
    img = loadImage("title.png");
    image(img, 75, 75);
    textAlign(CENTER);
    textSize(50);
    if (mouseX > 225 && mouseX < 380 && mouseY > 365 && mouseY < 405) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    text("START", 300, 400);
    textAlign(LEFT);
    textSize(16);
    fill(200);
    text("Powered by Box2D for Processing", 320, 580);
  }
  if (flag == 1) {
    img = loadImage("title.png");
    image(img, 75, 75);
    textAlign(CENTER);
    textSize(50);
    if (mouseX > 245 && mouseX < 360 && mouseY > 315 && mouseY < 355) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    text("EASY", 300, 350);
    if (mouseX > 215 && mouseX < 390 && mouseY > 366 && mouseY < 404) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    text("NOMAL", 300, 400);
    if (mouseX > 235 && mouseX < 370 && mouseY > 416 && mouseY < 452) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    text("HARD", 300, 450);
    textAlign(LEFT);
    textSize(16);
    fill(200);
    text("Powered by Box2D for Processing", 320, 580);
  }
  if (flag == 2) {
    textAlign(LEFT);
    textSize(10);
    text("TIME: " + ms, 500, 10);
    ms = ms + (1 / frameRate);
    if (difficulty == 1) {
      img = loadImage("name.png");
      image(img, 0, 0);
    }
    for (Kita_1 kita1 : kita_1) {
      kita1.display();
      kita1_x = map(kita1.body.getPosition().x, -30, 30, 0, 600);
      kita1_y = map(kita1.body.getPosition().y, -30, 30, 600, 0);
      kita1_angle = abs(degrees(kita1.body.getAngle()) % 180);
    }
    for (Kita_2 kita2 : kita_2) {
      kita2.display();
      kita2_x = map(kita2.body.getPosition().x, -30, 30, 0, 600);
      kita2_y = map(kita2.body.getPosition().y, -30, 30, 600, 0);
      kita2_angle = abs(degrees(kita2.body.getAngle()) % 180);
      //println(kita2_angle);
    }
    for (Kita_3 kita3 : kita_3) {
      kita3.display();
      kita3_x = map(kita3.body.getPosition().x, -30, 30, 0, 600);
      kita3_y = map(kita3.body.getPosition().y, -30, 30, 600, 0);
      kita3_angle = abs(degrees(kita3.body.getAngle()) % 180);
    }
    for (Kita_4 kita4 : kita_4) {
      kita4.display();
      kita4_x = map(kita4.body.getPosition().x, -30, 30, 0, 600);
      kita4_y = map(kita4.body.getPosition().y, -30, 30, 600, 0);
      kita4_angle = abs(degrees(kita4.body.getAngle()) % 180);
    }
    for (Kita_5 kita5 : kita_5) {
      kita5.display();
      kita5_x = map(kita5.body.getPosition().x, -30, 30, 0, 600);
      kita5_y = map(kita5.body.getPosition().y, -30, 30, 600, 0);
      kita5_angle = abs(degrees(kita5.body.getAngle()) % 180);
      //println(kita5_x, kita5_y);
      //println(mouseX, mouseY);
    }
    for (Mura_1 mura1 : mura_1) {
      mura1.display();
      mura1_x = map(mura1.body.getPosition().x, -30, 30, 0, 600);
      mura1_y = map(mura1.body.getPosition().y, -30, 30, 600, 0);
      mura1_angle = abs(degrees(mura1.body.getAngle()) % 180);
    }
    for (Mura_2 mura2 : mura_2) {
      mura2.display();
      mura2_x = map(mura2.body.getPosition().x, -30, 30, 0, 600);
      mura2_y = map(mura2.body.getPosition().y, -30, 30, 600, 0);
      mura2_angle = abs(degrees(mura2.body.getAngle()) % 180);
      //println(mura2_x, mura2_y);
      //println(mouseX, mouseY);
    }
    for (Mura_3 mura3 : mura_3) {
      mura3.display();
      mura3_x = map(mura3.body.getPosition().x, -30, 30, 0, 600);
      mura3_y = map(mura3.body.getPosition().y, -30, 30, 600, 0);
      mura3_angle = abs(degrees(mura3.body.getAngle()) % 180);
    }
    for (Mura_4 mura4 : mura_4) {
      mura4.display();
      mura4_x = map(mura4.body.getPosition().x, -30, 30, 0, 600);
      mura4_y = map(mura4.body.getPosition().y, -30, 30, 600, 0);
      mura4_angle = abs(degrees(mura4.body.getAngle()) % 180);
    }
    for (Mura_5 mura5 : mura_5) {
      mura5.display();
      mura5_x = map(mura5.body.getPosition().x, -30, 30, 0, 600);
      mura5_y = map(mura5.body.getPosition().y, -30, 30, 600, 0);
      mura5_angle = abs(degrees(mura5.body.getAngle()) % 180);
    }
    for (Mura_6 mura6 : mura_6) {
      mura6.display();
      mura6_x = map(mura6.body.getPosition().x, -30, 30, 0, 600);
      mura6_y = map(mura6.body.getPosition().y, -30, 30, 600, 0);
      mura6_angle = abs(degrees(mura6.body.getAngle()) % 180);
    }
    for (Mura_7 mura7 : mura_7) {
      mura7.display();
      mura7_x = map(mura7.body.getPosition().x, -30, 30, 0, 600);
      mura7_y = map(mura7.body.getPosition().y, -30, 30, 600, 0);
      mura7_angle = abs(degrees(mura7.body.getAngle()) % 180);
    }
    if (kita1_x > 171 && kita1_x < 191 && kita1_y > 263 && kita1_y < 283) {
      if (difficulty == 3) {
        if (kita1_angle < 10 || kita1_angle > 170) {
          for (int i = kita_1.size ()-1; i>=0; i--) {
            Kita_1 kita1 = kita_1.get(i);
            kita_1.remove(i);
          }
          chr[1] = loadImage("kita_1.png");
          image(chr[1], 161, 273);
          clr[1] = true;
        }
      } else {
        for (int i = kita_1.size ()-1; i>=0; i--) {
          Kita_1 kita1 = kita_1.get(i);
          kita_1.remove(i);
        }
        chr[1] = loadImage("kita_1.png");
        image(chr[1], 161, 273);
        clr[1] = true;
      }
    }
    if (kita2_x > 190 && kita2_x < 210 && kita2_y > 290 && kita2_y < 310) {
      if (difficulty == 3) {
        if (kita2_angle < 10) {
          for (int i = kita_2.size ()-1; i>=0; i--) {
            Kita_2 kita2 = kita_2.get(i);
            kita_2.remove(i);
          }
          chr[2] = loadImage("kita_2.png");
          image(chr[2], 200, 236);
          clr[2] = true;
        }
      } else {
        for (int i = kita_2.size ()-1; i>=0; i--) {
          Kita_2 kita2 = kita_2.get(i);
          kita_2.remove(i);
        }
        chr[2] = loadImage("kita_2.png");
        image(chr[2], 200, 236);
        clr[2] = true;
      }
    }
    if (kita3_x > 148 && kita3_x < 168 && kita3_y > 306 && kita3_y < 326) {
      if (difficulty == 3) {
        if (kita3_angle < 10) {
          for (int i = kita_3.size ()-1; i>=0; i--) {
            Kita_3 kita3 = kita_3.get(i);
            kita_3.remove(i);
          }
          chr[3] = loadImage("kita_3.png");
          image(chr[3], 158, 316);
          clr[3] = true;
        }
      } else {
        for (int i = kita_3.size ()-1; i>=0; i--) {
          Kita_3 kita3 = kita_3.get(i);
          kita_3.remove(i);
        }
        chr[3] = loadImage("kita_3.png");
        image(chr[3], 158, 316);
        clr[3] = true;
      }
    }
    if (kita4_x > 229 && kita4_x < 249 && kita4_y > 251 && kita4_y < 271) {
      if (difficulty == 3) {
        if (kita4_angle < 10) {
          for (int i = kita_4.size ()-1; i>=0; i--) {
            Kita_4 kita4 = kita_4.get(i);
            kita_4.remove(i);
          }
          chr[4] = loadImage("kita_4.png");
          image(chr[4], 239, 261);
          clr[4] = true;
        }
      } else {
        for (int i = kita_4.size ()-1; i>=0; i--) {
          Kita_4 kita4 = kita_4.get(i);
          kita_4.remove(i);
        }
        chr[4] = loadImage("kita_4.png");
        image(chr[4], 239, 261);
        clr[4] = true;
      }
    }
    if (kita5_x > 240 && kita5_x < 280 && kita5_y > 280 && kita5_y < 320) {
      if (difficulty == 3) {
        if (kita5_angle < 10) {
          for (int i = kita_5.size ()-1; i>=0; i--) {
            Kita_5 kita5 = kita_5.get(i);
            kita_5.remove(i);
          }
          chr[5] = loadImage("kita_5.png");
          image(chr[5], 230, 235);
          clr[5] = true;
        }
      } else {
        for (int i = kita_5.size ()-1; i>=0; i--) {
          Kita_5 kita5 = kita_5.get(i);
          kita_5.remove(i);
        }
        chr[5] = loadImage("kita_5.png");
        image(chr[5], 230, 235);
        clr[5] = true;
      }
    }
    if (mura1_x > 295 && mura1_x < 315 && mura1_y > 249 && mura1_y < 269) {
      if (difficulty == 3) {
        if (mura1_angle < 10) {
          for (int i = mura_1.size ()-1; i>=0; i--) {
            Mura_1 mura1 = mura_1.get(i);
            mura_1.remove(i);
          }
          chr[6] = loadImage("mura_1.png");
          image(chr[6], 305, 259);
          clr[6] = true;
        }
      } else {
        for (int i = mura_1.size ()-1; i>=0; i--) {
          Mura_1 mura1 = mura_1.get(i);
          mura_1.remove(i);
        }
        chr[6] = loadImage("mura_1.png");
        image(chr[6], 305, 259);
        clr[6] = true;
      }
    }
    if (mura2_x > 321 && mura2_x < 341 && mura2_y > 290 && mura2_y < 310) {
      if (difficulty == 3) {
        if (mura2_angle < 10) {
          for (int i = mura_2.size ()-1; i>=0; i--) {
            Mura_2 mura2 = mura_2.get(i);
            mura_2.remove(i);
          }
          chr[7] = loadImage("mura_2.png");
          image(chr[7], 331, 234);
          clr[7] = true;
        }
      } else {
        for (int i = mura_2.size ()-1; i>=0; i--) {
          Mura_2 mura2 = mura_2.get(i);
          mura_2.remove(i);
        }
        chr[7] = loadImage("mura_2.png");
        image(chr[7], 331, 234);
        clr[7] = true;
      }
    }
    if (mura3_x > 293 && mura3_x < 313 && mura3_y > 262 && mura3_y < 282) {
      if (difficulty == 3) {
        if (mura3_angle < 10) {
          for (int i = mura_3.size ()-1; i>=0; i--) {
            Mura_3 mura3 = mura_3.get(i);
            mura_3.remove(i);
          }
          chr[8] = loadImage("mura_3.png");
          image(chr[8], 303, 272);
          clr[8] = true;
        }
      } else {
        for (int i = mura_3.size ()-1; i>=0; i--) {
          Mura_3 mura3 = mura_3.get(i);
          mura_3.remove(i);
        }
        chr[8] = loadImage("mura_3.png");
        image(chr[8], 303, 272);
        clr[8] = true;
      }
    }
    if (mura4_x > 330 && mura4_x < 350 && mura4_y > 284 && mura4_y < 304) {
      if (difficulty == 3) {
        if (mura4_angle < 10) {
          for (int i = mura_4.size ()-1; i>=0; i--) {
            Mura_4 mura4 = mura_4.get(i);
            mura_4.remove(i);
          }
          chr[9] = loadImage("mura_4.png");
          image(chr[9], 340, 294);
          clr[9] = true;
        }
      } else {
        for (int i = mura_4.size ()-1; i>=0; i--) {
          Mura_4 mura4 = mura_4.get(i);
          mura_4.remove(i);
        }
        chr[9] = loadImage("mura_4.png");
        image(chr[9], 340, 294);
        clr[9] = true;
      }
    }
    if (mura5_x > 400 && mura5_x < 420 && mura5_y > 263 && mura5_y < 283) {
      if (difficulty == 3) {
        if (mura5_angle < 10) {
          for (int i = mura_5.size ()-1; i>=0; i--) {
            Mura_5 mura5 = mura_5.get(i);
            mura_5.remove(i);
          }
          chr[10] = loadImage("mura_5.png");
          image(chr[10], 374, 263);
          clr[10] = true;
        }
      } else {
        for (int i = mura_5.size ()-1; i>=0; i--) {
          Mura_5 mura5 = mura_5.get(i);
          mura_5.remove(i);
        }
        chr[10] = loadImage("mura_5.png");
        image(chr[10], 374, 263);
        clr[10] = true;
      }
    }
    if (mura6_x > 390 && mura6_x < 410 && mura6_y > 290 && mura6_y < 310) {
      if (difficulty == 3) {
        if (mura6_angle < 10) {
          for (int i = mura_6.size ()-1; i>=0; i--) {
            Mura_6 mura6 = mura_6.get(i);
            mura_6.remove(i);
          }
          chr[11] = loadImage("mura_6.png");
          image(chr[11], 383, 237);
          clr[11] = true;
        }
      } else {
        for (int i = mura_6.size ()-1; i>=0; i--) {
          Mura_6 mura6 = mura_6.get(i);
          mura_6.remove(i);
        }
        chr[11] = loadImage("mura_6.png");
        image(chr[11], 383, 237);
        clr[11] = true;
      }
    }
    if (mura7_x > 358 && mura7_x < 378 && mura7_y > 281 && mura7_y < 301) {
      if (difficulty == 3) {
        if (mura7_angle < 10) {
          for (int i = mura_7.size ()-1; i>=0; i--) {
            Mura_7 mura7 = mura_7.get(i);
            mura_7.remove(i);
          }
          chr[12] = loadImage("mura_7.png");
          image(chr[12], 368, 291);
          clr[12] = true;
        }
      } else {
        for (int i = mura_7.size ()-1; i>=0; i--) {
          Mura_7 mura7 = mura_7.get(i);
          mura_7.remove(i);
        }
        chr[12] = loadImage("mura_7.png");
        image(chr[12], 368, 291);
        clr[12] = true;
      }
    }
    if (NorM == true) {
      img = loadImage("M.png");
    } else {
      img = loadImage("N.png");
    }
    image(img, mouseX-15, mouseY-15, 30, 30);
    if (mousePressed) {
      if (NorM == true) {
        for (Kita_1 kita1 : kita_1) {
          kita1.attract(mouseX, mouseY);
        }
        for (Kita_2 kita2 : kita_2) {
          kita2.attract(mouseX, mouseY);
        }
        for (Kita_3 kita3 : kita_3) {
          kita3.attract(mouseX, mouseY);
        }
        for (Kita_4 kita4 : kita_4) {
          kita4.attract(mouseX, mouseY);
        }
        for (Kita_5 kita5 : kita_5) {
          kita5.attract(mouseX, mouseY);
        }
        for (Mura_1 mura1 : mura_1) {
          mura1.unattract(mouseX, mouseY);
        }
        for (Mura_2 mura2 : mura_2) {
          mura2.unattract(mouseX, mouseY);
        }
        for (Mura_3 mura3 : mura_3) {
          mura3.unattract(mouseX, mouseY);
        }
        for (Mura_4 mura4 : mura_4) {
          mura4.unattract(mouseX, mouseY);
        }
        for (Mura_5 mura5 : mura_5) {
          mura5.unattract(mouseX, mouseY);
        }
        for (Mura_6 mura6 : mura_6) {
          mura6.unattract(mouseX, mouseY);
        }
        for (Mura_7 mura7 : mura_7) {
          mura7.unattract(mouseX, mouseY);
        }
      } else {
        for (Kita_1 kita1 : kita_1) {
          kita1.unattract(mouseX, mouseY);
        }
        for (Kita_2 kita2 : kita_2) {
          kita2.unattract(mouseX, mouseY);
        }
        for (Kita_3 kita3 : kita_3) {
          kita3.unattract(mouseX, mouseY);
        }
        for (Kita_4 kita4 : kita_4) {
          kita4.unattract(mouseX, mouseY);
        }
        for (Kita_5 kita5 : kita_5) {
          kita5.unattract(mouseX, mouseY);
        }
        for (Mura_1 mura1 : mura_1) {
          mura1.attract(mouseX, mouseY);
        }
        for (Mura_2 mura2 : mura_2) {
          mura2.attract(mouseX, mouseY);
        }
        for (Mura_3 mura3 : mura_3) {
          mura3.attract(mouseX, mouseY);
        }
        for (Mura_4 mura4 : mura_4) {
          mura4.attract(mouseX, mouseY);
        }
        for (Mura_5 mura5 : mura_5) {
          mura5.attract(mouseX, mouseY);
        }
        for (Mura_6 mura6 : mura_6) {
          mura6.attract(mouseX, mouseY);
        }
        for (Mura_7 mura7 : mura_7) {
          mura7.attract(mouseX, mouseY);
        }
      }
    }
    int clr_cnt = 0;
    for (int i = 1; i < 13; i++) {
      if (clr[i] == true) {
        clr_cnt += 1;
      }
    }
    if (clr_cnt >= 12) {
      flag = 3;
    }
  }
  if (flag == 3) {
    textAlign(CENTER);
    textSize(64);
    fill(255, 255, 0);
    text("CLEAR!!", 300, 200);
    text("TIME: " + ms, 300, 300);
    if (mouseX > 209 && mouseX < 398 && mouseY > 355 && mouseY < 403) {
      fill(0, 255, 255);
    } else {
      fill(255, 255, 0);
    }
    text("RETRY", 300, 400);
    println(mouseX, mouseY);
  }
}

void refresh() {
  bg = loadImage("floor.png");
  image(bg, 0, 0);
}

void mouseReleased() {
  if (flag == 0) {
    if (mouseX > 225 && mouseX < 380 && mouseY > 365 && mouseY < 405) {
      flag = 1;
    }
  }
  if (flag == 3) {
    if (mouseX > 209 && mouseX < 398 && mouseY > 355 && mouseY < 403) {
      flag = 0;
      ms = 0;
      for (int i = 1; i < 13; i++) {
        clr[i] = false;
      }
    }
  }
}
void mousePressed() {
  if (flag == 1) {
    if (mouseX > 245 && mouseX < 360 && mouseY > 315 && mouseY < 355) {
      difficulty = 1;
      start_pressed();
    }
    if (mouseX > 215 && mouseX < 390 && mouseY > 366 && mouseY < 404) {
      difficulty = 2;
      start_pressed();
    }
    if (mouseX > 235 && mouseX < 370 && mouseY > 416 && mouseY < 452) {
      difficulty = 3;
      start_pressed();
    }
  }
  if (flag == 2) {
    if (mouseButton == RIGHT) {
      NorM = !NorM;
    }
  }
}


void start_pressed() {
  flag = 2;
  Kita_1 kita1 = new Kita_1(random(10, 590), random(10, 590));
  kita_1.add(kita1);
  Kita_2 kita2 = new Kita_2(random(10, 590), random(10, 590));
  kita_2.add(kita2);
  Kita_3 kita3 = new Kita_3(random(10, 590), random(10, 590));
  kita_3.add(kita3);
  Kita_4 kita4 = new Kita_4(random(10, 590), random(10, 590));
  kita_4.add(kita4);
  Kita_5 kita5 = new Kita_5(random(10, 590), random(10, 590));
  kita_5.add(kita5);
  Mura_1 mura1 = new Mura_1(random(10, 590), random(10, 590));
  mura_1.add(mura1);
  Mura_2 mura2 = new Mura_2(random(10, 590), random(10, 590));
  mura_2.add(mura2);
  Mura_3 mura3 = new Mura_3(random(10, 590), random(10, 590));
  mura_3.add(mura3);
  Mura_4 mura4 = new Mura_4(random(10, 590), random(10, 590));
  mura_4.add(mura4);
  Mura_5 mura5 = new Mura_5(random(10, 590), random(10, 590));
  mura_5.add(mura5);
  Mura_6 mura6 = new Mura_6(random(10, 590), random(10, 590));
  mura_6.add(mura6);
  Mura_7 mura7 = new Mura_7(random(10, 590), random(10, 590));
  mura_7.add(mura7);
}

