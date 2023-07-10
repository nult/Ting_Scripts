#!/usr/bin/env python
# -*- encoding:utf-8 -*-
# by Ting, calc fft amplitude spectrum

import numpy as np
from scipy.fftpack import fft

def dfft(data,deltat):
    n=np.size(data)
    x=np.arange(n)
    half_n=x[range(int(n/2))]
    datafft=fft(data)
    absfft=np.abs(datafft)
    normabs=absfft/n
    normhalfabs=normabs[range(int(n/2))]
    freqindex=half_n/(deltat*n)
    return freqindex,normhalfabs
