/**
 * Originall version from lab9 spec 
 */

#include <stdio.h>
#include <omp.h>


void single_multiply(const float * mata, size_t mata_width, size_t mata_height, const float * matb, size_t matb_width, size_t matb_height, float ** result_mat, size_t * res_width, size_t * res_height) {
    if(result_mat) {
        *res_width = matb_width;
        *res_height = mata_height;
        *result_mat = calloc(mata_height * matb_width, sizeof(float));
        
        for(size_t y = 0; y < mata_height; y++) {
            for(size_t x = 0; x < matb_width; x++) {
                for(size_t k = 0; k < mata_width; k++) {
                    (*result_mat)[(y * matb_width) + x] =(mata[(y * mata_width) + k] * matb[(k * matb_width) + x]);
                }
            }
        }
    }
}
