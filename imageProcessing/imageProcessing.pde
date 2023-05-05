String[]names;
Kernel[]kernels;
int currentKernel;
PImage car;
PImage output;

void setup(){
  size(1450,500);
  currentKernel = 0;
  names = new String[]{
    "Identity", "Blur", "Sharpen",
    "Outline", "Left Sobel", "Right Sobel",
    "Top Sobel", "Emboss"
  };

  kernels = new Kernel[] {
    new Kernel( new float[][] {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0}
    }) ,
    new Kernel( new float[][] {
      {.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }) ,
    new Kernel( new float[][] {
      {0, -1, 0},
      {-1, 5, -1},
      {0, -1, 0}
    }) ,
    new Kernel( new float[][] {
      {-1, -1, -1},
      {-1, 8, -1},
      {-1, -1, -1}
    }) ,
    new Kernel( new float[][] {
      {1, 0, -1},
      {2, 0, -2},
      {1, 0, -1}
    }) ,
    new Kernel( new float[][] {
      {-1, 0, 1},
      {-2, 0, 2},
      {-1, 0, 1}
    }) ,
    new Kernel( new float[][] {
      {1, 2,  1},
      {0, 0, 0},
      {-1, -2, -1}
    }),
    new Kernel( new float[][] {
      {-2, -1,  0},
      {-1, 1, 1},
      {0, 1, 2}
    })
  };
}

void keyPressed(){
  if (currentKernel == 7){
    currentKernel = 0;
  }
  currentKernel++;
  Kernel k = kernels[currentKernel];
  k.apply(car,output);
}

void draw(){
  size(1450,500);
  PImage car = loadImage("redcar.png");
  PImage output = car.copy();
  image(car,0,0);
  image(output,car.width,0);
}
 
 
 
 /*void setup(){
      size(1450,500);
      PImage car = loadImage("redcar.png");
      PImage output = car.copy();
      Kernel k = new Kernel( new float[][] {
        {-1, -1, -1},
        {-1, 8, -1},
        {-1, -1, -1}
      } );
      Kernel k2 = new Kernel( new float[][] {
        {.11, .11, .11},
        {.11, .11, .11},
        {.11, .11, .11}
      } );
      k.apply(car,output);
      image(car,0,0);
      image(output,car.width,0);
    }*/
