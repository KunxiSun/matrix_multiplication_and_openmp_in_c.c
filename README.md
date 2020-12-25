# How to run my code

Before you run my program, please make sure you have the *openmp* library.

Check if you have by runing: 

        sudo apt list libomp-dev

If you do not have this library, install it by runing:

        sudo apt update
        sudo apt install libomp-dev


* run unit test to check the output between the multipy from spec and optimized by openmp:

        make unit-test

* run single thread time performace test:

        make single

* run normal openmp optimization time performace test:

        make openmp

* run openmp collapse(3) optimization time performace test:

        make openmp-collapse

* get all the plot I prepared for the report:

        make draw

* clean all the complied file and plots:

        make clean