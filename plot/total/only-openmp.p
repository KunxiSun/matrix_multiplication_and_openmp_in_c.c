#Output Settings
set terminal png size 800,1000
set output 'only-openmp.png'

# Labels, Title and Data
#set key inside bottom right
set xlabel 'Size'
set ylabel 'Time (s)'
set title 'Time performance of all matrix multiplication solutions(exclude size 2048)'
plot "./plot/total/only-openmp.txt" using 1:2 title 'openmp' with linespoints, \
"./plot/total/only-openmp.txt" using 1:3 title 'openmp collapse(3)' with linespoints
