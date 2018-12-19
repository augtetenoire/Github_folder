set terminal pdf truecolor
set output "all_rdisp.pdf"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

#set title "Variation of the atom around their equilibrium position along X,Y,Z"
set ylabel "Mean square displacement"
set xlabel "Time step"

set format x "%.se{%S}"
set yrange [-0.001:0.05]
set key outside r t

plot for [i in '1000 700 500 300 100 50 10' ] 'Slab_'.i.'K_tau_2_nstmin_10000000/analysis/rdisp.FF' using 1:2 smooth bezier title i.'K'

