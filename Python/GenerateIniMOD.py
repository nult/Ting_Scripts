#!/usr/bin/env python
# how to run:
# ./GenerateIniMOD.py
# remember to move MOD to the directory where you want to run DSurfTomo
import numpy as np
#import matplotlib.pyplot as plt
#parameters need to be changed
#start
nx=5	
ny=55	
nz=48
dep1=np.array([0,0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1.00,1.10,1.20,1.30,1.40,1.50,1.60,1.70,1.80,1.90,2.00,2.10,2.20,2.30,2.40,2.50,2.60,2.70,2.80,2.90,3.00,3.10,3.20,3.30,3.40,3.50,3.60,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7])
depth=np.array([1.7731, 1.8139, 1.8440, 1.8645, 1.8798, 1.8977, 1.9241, 1.9627, 2.0152, 2.0810, 2.1581, 2.2438, 2.3342, 2.4278, 2.5210, 2.6115, 2.6988, 2.7813, 2.8586, 2.9305, 2.9967, 3.0578, 3.1134, 3.1645, 3.2114, 3.2542, 3.2940, 3.3303, 3.3642, 3.3961, 3.4255, 3.4538, 3.5244, 3.5929, 3.6606, 3.7272, 3.7929, 3.8588, 3.9244, 3.9895, 4.0548,4.1200,4.12,4.12,4.12,4.12,4.12,4.12,4.12])

vs1=np.zeros(nz)
mod=np.zeros((nz*ny,nx))
for k in range(nz):
  for j in range(ny):
    for i in range(nx):
      mod[k*ny+j,i]= depth[k]
with open('MOD','w') as fp:
    for i in range(nz):
        fp.write('%6.2f  ' % dep1[i])
    fp.write('\n')
    for k in range(nz):
        for j in range(ny):
            for i in range(nx):
                fp.write('%7.3f  ' % mod[k*ny+j,i])
            fp.write('\n')
#for i in range(nz):
#  print dep1[i]


