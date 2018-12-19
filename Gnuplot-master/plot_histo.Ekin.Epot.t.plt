set terminal pdf truecolor
set output "histogram.Ekin.Epot.t.pdf"

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

set title "Variation of Ekin, Epot, temperature through slabmotion"
set xlabel "Variation ()"
set ylabel "Normalized number (a.u.) "

set key on inside r t

plot 'Ekin_histogram.out' using 1:2 title 'Ekin' w l lt rgb '#000000' lw 1.5

plot 'Epot_histogram.out' using 1:2 title 'Epot' w l lt rgb '#000000' lw 1.5

plot 'temperature_histogram.out' using 1:2 title 'Temperature' w l lt rgb '#000000' lw 1.5

plot 'Ekin_histogram.out' using 1:2 title 'Ekin' w l  lw 1.5,\
'Epot_histogram.out' using 1:2 title 'Epot' w l lw 1.5

