   public class Kernel {
      float[][]kernel;

      /**Constructor takes the kernel that will be applied to the image
      *This implementation only allows 3x3 kernels
      */
      public Kernel(float[][]init) {
        kernel = new float[3][3];
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            kernel[i][j] = init[i][j];
          }
        }
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
          color origC = color(0);
          for (int i = -1; i <= 1; i++){
            for (int j = -1; j <= 1; j++){
              if (x + i >= 0 && x + i < img.width && y + j >= 0 && y + j < img.height){
              float k = kernel[i+1][j+1];
              origC += k * img.get(x + i, y + j);
            }
          }
        }
        int r = constrain((int) red(origC), 0, 255);
        int g = constrain((int) green(origC), 0, 255);
        int b = constrain((int) blue(origC), 0, 255);      
        return color(r, g, b);       
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
