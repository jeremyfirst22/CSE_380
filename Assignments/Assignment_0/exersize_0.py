#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt


for file in 'compute', 'chem_compute' :
    
    data = np.genfromtxt(file+'.csv',delimiter=',')

    x = range(0,len(data))

    numcores = data[:,4] / data[:,0]
    datachem = np.genfromtxt('chem_compute.csv',delimiter=',')

    plt.plot(x,numcores,label='Number of cores')
    plt.plot(x, 0.50*np.power(x,3),label='Simple fit y = 1/2 x^3')
    plt.xlabel('time (1/2 years since Jun 1993)')
    plt.ylabel('Number of cores per machine')
    if file == 'compute' :
        plt.title('Rapid growth of supercomputers (cores/computers)')
    elif file == 'chem_compute' :
        plt.title('Rapid growth of specifically for chemistry')
    plt.savefig(file+'.png', format='png')
    plt.close()


