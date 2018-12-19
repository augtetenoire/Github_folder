set terminal pdf truecolor
set output "sticking_probability_comparison.pdf"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Variation of the sticking prbability at 1000K for slab therm= 3fs"
set xlabel "Variation of angle (°)"
set ylabel "Sticking probability S_0 "
set logscale y
set key on outside r t

set key noenhanced
plot 'new_sticking_probability_table.txt' using 1:2 title 'new_Etot_1eV' w lp lt rgb '#CC0000' pt 1 ,\
'new_sticking_probability_table.txt' using 1:3 title 'new_Etot_0.6eV' w lp lt rgb '#00CC00' pt 1  ,\
'new_sticking_probability_table.txt' using 1:4 title 'new_Ez_1eV' w lp lt rgb '#CC0000' pt 6 ,\
'new_sticking_probability_table.txt' using 1:5 title 'new_Ez_0.6eV' w lp lt rgb '#00CC00' pt 6  ,\
'sticking_probability_table.txt' using 1:2 title 'Etot_1eV' w lp lc rgb '#CC0000' dt 2 pt 1 ,\
'sticking_probability_table.txt' using 1:4 title 'Etot_0.6eV' w lp lc rgb '#00CC00' dt 2 pt 1  ,\
'sticking_probability_table.txt' using 1:7 title 'Ez_1eV' w lp lc rgb '#CC0000' dt 2 pt 6,\
'sticking_probability_table.txt' using 1:9 title 'Ez_0.6eV' w lp lc rgb '#00CC00' dt 2 pt 6  ,\
