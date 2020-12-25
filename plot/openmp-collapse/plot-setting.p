#Output Settings
set terminal png size 800,1000
set output 'openmp-collapse.png'

# Labels, Title and Data
#set key inside bottom right
set xlabel 'Size'
set ylabel 'Time (s)'
set title 'Openmp collapse(3) optimize matrix multiplication'
plot "./plot/openmp-collapse/data.txt" using 1:2 title '' with linespoints
