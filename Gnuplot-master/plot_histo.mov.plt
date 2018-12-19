set terminal pdf truecolor
set output "histogram.mov.pdf"

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

set title "Variation of the atom around their equilibrium position along X,Y,Z"
set xlabel "Variation (Angstrom)"
set ylabel "Normalized number of atom "

set key on inside r t

plot 'x_layer001_histo_mov.out' using 1:2 title 'X: layer 1' w l lt rgb '#CC0000' lw 1.5,\
'x_layer002_histo_mov.out' using 1:2 title 'X: layer 2' w l lt rgb '#0066CC' lw 1.5

plot 'y_layer001_histo_mov.out' using 1:2 title 'Y: layer 1' w l lt rgb '#CC0000' lw 1.5,\
'y_layer002_histo_mov.out' using 1:2 title 'Y: layer 2' w l lt rgb '#0066CC' lw 1.5

plot 'z_layer001_histo_mov.out' using 1:2 title 'Z: layer 1' w l lt rgb '#CC0000' lw 1.5,\
'z_layer002_histo_mov.out' using 1:2 title 'Z: layer 2' w l lt rgb '#0066CC' lw 1.5

plot 'x_layer001_histo_mov.out' using 1:2 title 'X: layer 1' w l  lw 1.5,\
'x_layer002_histo_mov.out' using 1:2 title 'X: layer 2' w l lw 1.5,\
'y_layer001_histo_mov.out' using 1:2 title 'Y: layer 1' w l lw 1.5,\
'y_layer002_histo_mov.out' using 1:2 title 'Y: layer 2' w l lw 1.5
