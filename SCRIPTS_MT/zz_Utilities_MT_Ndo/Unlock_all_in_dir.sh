#!/bin/bash
######################################################################################
# Script to unclock all Mac locked files from dir and its sub dirs. 
# Must be launched with path to dir to unclock as only parameter.
#
# I know, it is a bit messy and can be improved.. when time. But it works..
# AMSTer: SAR & InSAR Automated Mass processing Software for Multidimensional Time series
# NdO (c) 2019/12/05 - could make better... when time.
# -----------------------------------------------------------------------------------------

DIRTOUNLOCK=$1

chflags -R nouchg ${DIRTOUNLOCK}

