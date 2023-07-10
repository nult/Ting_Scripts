#!/usr/bin/env python
# -*- coding:utf-8 -*-

# by Ting, simple filters

import numpy as np
from scipy import signal

# bandpass filter, filt.bandpass
def bandpass(data,shortperiod,longperiod,deltat):
    if (shortperiod>=longperiod):
        print("argv: 2 & 3 Use shortpriod and longperiod ...")
    wn1=2*deltat/longperiod
    wn2=2*deltat/shortperiod
    b,a=signal.butter(2,[wn1,wn2],'bandpass')
    filteddata=signal.filtfilt(b, a, data)
    return filteddata

# lowpass filter, filt.lowpass
def lowpass(data,shortperiod,deltat):
    wn2=2*deltat/shortperiod
    b,a=signal.butter(2,wn2,'lowpass')
    filteddata=signal.filtfilt(b, a, data)
    return filteddata

# highpass filter, filt.highpass
def highpass(data,longperiod,deltat):
    wn1=2*deltat/longperiod
    b,a=signal.butter(2,wn1,'highpass')
    filteddata=signal.filtfilt(b, a, data)
    return filteddata
