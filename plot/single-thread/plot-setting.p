#Output Settings
set terminal png size 800,1000
set output 'single.png'

# Labels, Title and Data
#set key inside bottom right
set xlabel 'Size'
set ylabel 'Time (s)'
set title 'Single thread matrix multiplication'
plot "./plot/single-thread/data.txt" using 1:2 title '' with linespoints
