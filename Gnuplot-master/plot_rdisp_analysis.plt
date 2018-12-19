
###Founding Min, Max, Mean values###

set fit quiet
stats 'rdisp.FF' u 1:2 nooutput
#min_y = GPVAL_DATA_Y_MIN
#max_y = GPVAL_DATA_Y_MAX

#d(x)=min_y
#e(x)=max_y
f(x) = mean_y
fit f(x) 'rdisp.FF' u 1:2 via mean_y 



###Parmeter for the plot###

set terminal pdf truecolor
set output "rdisp_analysis.pdf"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
#set title "Variation of the sticking probability at 1000K \n in function of the angle theta"

set yrange [0:*]
set format x "%.se{%S}"
set xlabel "Integration step"
set ylabel "Mean square displacement "
set key off

set label 1 "Maximun" at 80000, STATS_max_y offset 1,-0.5
set label 2 "Minimun" at 80000, STATS_min_y offset 1,-0.5


###Ploting the cloud point in black, guide line curve in blue, min, mean and max vaues in red###

plot 'rdisp.FF' u 1:2 pt 0 lc '#000000', '' smooth bezier lc '#0000FF', STATS_min_y lc '#FF0000',  STATS_max_y lc '#FF0000', f(x) lc '#FF0000'
