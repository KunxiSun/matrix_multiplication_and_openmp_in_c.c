#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include "../src/openmp/matrix-multiplication.c"
#include "../src/single-thread/matrix-multiplication.c"

void result_test1(){
    
    //shared witth and height for single threads and multi threads
    size_t mata_width = 100;
    size_t mata_height = 100;
    size_t matb_width = 100;
    size_t matb_height = 100;

    //result widths and heights
    size_t res_width_single, res_height_single;
    size_t res_width_multi, res_height_multi;

    //single thread matrix a, matrix b and result matrix
    float * mata_single = (float*)malloc(sizeof(float)*mata_width*mata_height);
    float * matb_single = (float*)malloc(sizeof(float)*mata_width*mata_height);
    float * result_mat_single;

    //openmp thread matrix a, matrix b and result matrix
    float * mata_multi = (float*)malloc(sizeof(float)*mata_width*mata_height);
    float * matb_multi = (float*)malloc(sizeof(float)*mata_width*mata_height);
    float * result_mat_multi;

    //set values to matrix a
    int i, random;
    for(i=0; i<mata_width*mata_height; i++){
        random = rand()%255;
        mata_single[i] = random;
        mata_multi[i] = random;
    }

    //set values to matrix b
    for(i=0; i<mata_width*mata_height; i++){
        random = rand()%255;
        matb_single[i] = random;
        matb_multi[i] = random;
    }

    //apply the functions
    single_multiply(mata_single, mata_width, mata_height, matb_single, matb_width, matb_height, &result_mat_single, &res_width_single, &res_height_single);
    multiply(mata_single, mata_width, mata_height, matb_single, matb_width, matb_height, &result_mat_multi, &res_width_multi, &res_height_multi);

    //check the result
    for(i=0;i<res_width_single*res_height_single;i++){
        //printf("i %d %f %f\n",i , result_mat_single[i], result_mat_multi[i]);
        assert((int)result_mat_single[i]==(int)result_mat_multi[i]);
    }

    //clean
    free(mata_single);
    free(matb_single);
    free(result_mat_single);
    free(mata_multi);
    free(matb_multi);
    free(result_mat_multi);
}

int main() {
    
    result_test1();
    
    return 0;
}