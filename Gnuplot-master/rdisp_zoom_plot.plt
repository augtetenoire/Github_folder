set terminal pdf truecolor
set output "rdisp_zoom.pdf"
#set autoscale
set xrange [0 : 10000]
plot "rdisp.FF" w p lt 0
