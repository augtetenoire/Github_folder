# -*- coding: utf-8 -*-
"""
Created on Fri Dec 14 16:59:31 2018

@author: auguste
"""

import numpy as np
import scipy
import re


##################################################
##################################################
##################################################
#   This program read the VASP XDATCAR file in order to operate on ions coordinates
##################################################
##################################################
##################################################








XDATCAR_PATH= '/home/auguste/TEST/IBRION_2/XDATCAR'







##################################################
#   Start reading the number of configuration in XDATCAR file
##################################################
config_number=0
XDATCAR_file = open(XDATCAR_PATH,'r')

for line in XDATCAR_file:
    if re.match("Direct configuration=", line):
        config_number = config_number +1

print('configuration number = ', config_number, ' is ',type(config_number))
print('')
##################################################
#   End reading the number of configuration in XDATCAR file
##################################################







##################################################
#   Start reading informations of the XDATCAR file
##################################################

with open(XDATCAR_PATH,'r') as XDATCAR_file:
    
    ##################################################
    #   Reading first line of the document
    ##################################################
    
    comment_line = str(XDATCAR_file.readline()) 
    
    ##################################################
    #   Reading the lattice parameter which multiply the matrix
    ##################################################
    
    lparam_a = float(XDATCAR_file.readline())
    
    ##################################################
    #   Reading the lattice vectors a,b,c
    ##################################################
    
    cell_vectors= [] #They are lying... In python we must initialised variables... I don't understand why peoples find this easier than fortran... #SadWorld
    for i in range(3):
        cell_vectors.append(np.array(next(XDATCAR_file).split()).astype(float))
        
        #I stop here to comment a bit the program.
        #split() is used to split the readed line into column. Without argument it skip blank space (that is what we want it to do). It also put all the splited colums in an array.
        #next(file) is used to pass to the next output. 
        #That is to say: the current output is the one of the precedent readed line "lparam_a", then with next() we are going to the following outup, thus we get the first line of cell vector, and so on three times, as it is in range(3) for loop.
        #Finally we used .append() to concatenate the three vectors in an array to create a matrix !
        #We hence have floats, in array, in array == matrix
        
    ##################################################
    #   Reading species
    ##################################################
    
    species = XDATCAR_file.readline().split()
    
    ##################################################
    #   Reading the number of element of each species
    ##################################################
    
    species_number = np.array(XDATCAR_file.readline().split()).astype(int)
   
    
    #Counting the number of ions in the system
    ions_number=0
    for i in range(len(species_number)):
        ions_number = ions_number + species_number[i]
    
    ##################################################
    #   Reading the number label of the configuration & ions vector for this configuration
    ##################################################
    
    
    
    
    configuration = []
    for conf in range(config_number):
        configuration_label = np.array(re.findall(r'[\d.]+', XDATCAR_file.readline())).astype(int)
        print('configuration_label= ',configuration_label, ' is ',type(configuration_label[0]))
        print('')
        ions_vectors = []
        for i in range(ions_number):
            ions_vectors.append(np.array(next(XDATCAR_file).split()).astype(float))   
            
        configuration.append(np.array(ions_vectors))
        print('ions_vectors= ',ions_vectors, ' is ',type(ions_vectors))
        print('')
    
    #Example: configuration[2][1,1] is the 3rd configuration, 2nd line, y coordinate
    
    
XDATCAR_file.closed
##################################################
#   End of reading informations of the XDATCAR file
##################################################

print('comment_line= ',comment_line, ' is ',type(comment_line))
print('')
print('lparam_a= ',lparam_a, ' is ',type(lparam_a))
print('')
print('cell_vectors= ',cell_vectors, ' is ',type(cell_vectors))
print('')
print('species= ',species, ' is ',type(species))
print('')
print('species_number= ',species_number, ' is ',type(species_number[0]))
print('')
print('ions_number= ',ions_number, ' is ',type(ions_number))
print('')
#print('configuration_label= ',configuration_label, ' is ',type(configuration_label[0]))
#print('')
#print('ions_vectors= ',ions_vectors, ' is ',type(ions_vectors))
#print('')
print('configuration= ',configuration, ' is ',type(configuration))
print('')


#Now that data has been loads, we can play with it

##################################################
#   Creating an array of ions' label to later identy them
##################################################


ion_label = []
for i in range(3):
    for j in range(species_number[i]):
        k=j+1
        ion_label.append(species[i]+str(k))
print(ion_label)
        
        
##################################################
#   
##################################################


























