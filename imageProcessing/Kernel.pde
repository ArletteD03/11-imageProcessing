   public class Kernel {
      float[][]kernel;

      /**Constructor takes the kernel that will be applied to the image
      *This implementation only allows 3x3 kernels
      */
      public Kernel(float[][]init) {
        kernel = init;
      }

      /**If part of the kernel is off of the image, return black, Otherwise
      *Calculate the convolution of r/g/b separately, and return that color\
      *if the calculation for any of the r,g,b values is outside the range
      *     0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
      */
      color calcNewColor(PImage img, int x, int y) {
        //Hint: start by always returning black.
        //This will let you test your apply method right away!
        if (x == 0 || y == 0 || x == width - 1 || y == height - 1){
          return color(0);
        }
        else{
          int red = 0;
          int green = 0;
          int blue = 0;
          for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
              int xCoor = (x-1) + j;
              int yCoor = (y-1) + i;
              float kern = kernel[i][j];
              color newC = img.get(xCoor, yCoor);
              red += (int) red(newC) * kern;
              green += (int) green(newC) * kern;
              blue += (int) blue(newC) * kern;
            }
          }
        red = constrain(red, 0, 255);
        green = constrain(green, 0, 255);
        blue = constrain(blue, 0, 255);
        return color(red, green, blue);     
      }
     }


      /**You must write this method that applies the kernel to the source,
      *and saves the data to the destination.*/
      void apply(PImage source, PImage destination){
        for (int i = 0; i < source.height; i++) {
         for (int j = 0; j < source.width; j++) {
           color newC = calcNewColor(source, j, i);
           destination.set(j,i, newC);
          }
        }
      }   
    }
