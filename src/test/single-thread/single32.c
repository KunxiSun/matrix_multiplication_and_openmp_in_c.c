#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "../../src/single-thread/matrix-multiplication.c"

#define WIDTH (32)
#define HEIGHT (32)

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

    single_multiply(mata, WIDTH, HEIGHT, matb, WIDTH, HEIGHT, &result_mat, &res_width, &res_height);
}