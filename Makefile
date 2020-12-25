SHELL := /bin/bash
CC=gcc
CFLAGS= -O0 -g -std=c11 -fopenmp #-Wall -Werror -Wvla -fsanitize=address
.PHONY: all test clean


unit-test:	./src/test/unit-tests.c
		$(CC) $(CFLAGS) $^ -o $@ -lcmocka -fsanitize=address
		./$@

openmp:
	gcc ./src/test/openmp/openmp32.c -o openmp32 -fopenmp
	gcc ./src/test/openmp/openmp64.c -o openmp64 -fopenmp
	gcc ./src/test/openmp/openmp128.c -o openmp128 -fopenmp
	gcc ./src/test/openmp/openmp256.c -o openmp256 -fopenmp
	gcc ./src/test/openmp/openmp512.c -o openmp512 -fopenmp
	gcc ./src/test/openmp/openmp1024.c -o openmp1024 -fopenmp
	gcc ./src/test/openmp/openmp2048.c -o openmp2048 -fopenmp

	time ./openmp32
	time ./openmp64
	time ./openmp128
	time ./openmp256
	time ./openmp512
	time ./openmp1024
	time ./openmp2048

openmp-collapse:
	gcc ./src/test/openmp-collapse/openmp32.c -o openmp32 -fopenmp
	gcc ./src/test/openmp-collapse/openmp64.c -o openmp64 -fopenmp
	gcc ./src/test/openmp-collapse/openmp128.c -o openmp128 -fopenmp
	gcc ./src/test/openmp-collapse/openmp256.c -o openmp256 -fopenmp
	gcc ./src/test/openmp-collapse/openmp512.c -o openmp512 -fopenmp
	gcc ./src/test/openmp-collapse/openmp1024.c -o openmp1024 -fopenmp
	gcc ./src/test/openmp-collapse/openmp2048.c -o openmp2048 -fopenmp

	time ./openmp32
	time ./openmp64
	time ./openmp128
	time ./openmp256
	time ./openmp512
	time ./openmp1024
	time ./openmp2048

single: 
	gcc ./src/test/single-thread/single32.c -o single32 -fopenmp
	gcc ./src/test/single-thread/single64.c -o single64 -fopenmp
	gcc ./src/test/single-thread/single128.c -o single128 -fopenmp
	gcc ./src/test/single-thread/single256.c -o single256 -fopenmp
	gcc ./src/test/single-thread/single512.c -o single512 -fopenmp
	gcc ./src/test/single-thread/single1024.c -o single1024 -fopenmp
	gcc ./src/test/single-thread/single2048.c -o single2048 -fopenmp

	time ./single32
	time ./single64
	time ./single128
	time ./single256
	time ./single512
	time ./single1024
	time ./single2048

draw:
	gnuplot ./plot/openmp/plot-setting.p
	gnuplot ./plot/openmp-collapse/plot-setting.p
	gnuplot ./plot/single-thread/plot-setting.p
	gnuplot ./plot/total/data-setting.p
	gnuplot ./plot/total/exclude-outliner-setting.p
	gnuplot ./plot/total/only-openmp.p

clean:	
	rm -f ./unit-test
	rm -f ./openmp32
	rm -f ./openmp64
	rm -f ./openmp128
	rm -f ./openmp256
	rm -f ./openmp512
	rm -f ./openmp1024
	rm -f ./openmp2048
	rm -f ./single32
	rm -f ./single64
	rm -f ./single128
	rm -f ./single256
	rm -f ./single512
	rm -f ./single1024
	rm -f ./single2048
	rm -f only-openmp.png
	rm -f openmp-collapse.png
	rm -f openmp.png
	rm -f single.png
	rm -f total-exclude-2048.png
	rm -f total.png