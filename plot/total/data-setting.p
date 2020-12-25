#Output Settings
set terminal png size 800,1000
set output 'total.png'

# Labels, Title and Data
#set key inside bottom right
set xlabel 'Size'
set ylabel 'Time (s)'
set title 'Time performance of all matrix multiplication solutions'
plot "./plot/total/data.txt" using 1:2 title 'single thread' with linespoints, \
"./plot/total/data.txt" using 1:3 title 'openmp' with linespoints, \
"./plot/total/data.txt" using 1:4 title 'openmp collapse(3)' with linespoints, \