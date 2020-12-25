#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "../../src/openmp/matrix-multiplication.c"

#define WIDTH (256)
#define HEIGHT (256)

int main(){

    size_t res_width, res_height;
    
    //single thread matrix a, matrix b and result matrix
    float * mata= (float*)malloc(sizeof(float)*WIDTH*HEIGHT);
    float * matb = (float*)malloc(sizeof(float)*WIDTH*HEIGHT);
    float * result_mat;

    //set values to matrix a
    int i, random;
    for(i=0; i<WIDTH*HEIGHT; i++){
        random = rand()%255;
        mata[i] = random;
        matb[i] = random;
    }

    multiply(mata, WIDTH, HEIGHT, matb, WIDTH, HEIGHT, &result_mat, &res_width, &res_height);
}