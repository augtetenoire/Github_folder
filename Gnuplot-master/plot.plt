set terminal pdf truecolor
set output "graphic_of_all_dat.pdf"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
#set title "Variation of the atom around their equilibrium position along X,Y,Z"
#set xlabel "Variation (Angstrom)"
#set ylabel "Normalized number of atom "
#set key on inside r t

set key off
f(x) = system(sprintf("find *.dat", x))
    #list_files= system(sprintf("find *mov.out %f",x))
do for [filename in f(x) ] {
    set title filename noenhanced
    #plot filename using 1:2 w l lt rgb '#CC0000' lw 1.5
    plot filename using 1:2 w lp lt rgb '#CC0000'

}
f(x) = system(sprintf("find *xy*.dat", x))
do for [filename in f(x) ] {
    set title filename noenhanced
    plot filename using 1:2 w p lt rgb '#CC0000'

}

#plot 'x_layer001_histo_mov.out' using 1:2 title 'X Variation' w l lt rgb '#CC0000' lw 1.5,\
#'x_layer002_histo_mov.out' using 1:2 title 'Y Variation' w l lt rgb '#00CC00' lw 1.5

