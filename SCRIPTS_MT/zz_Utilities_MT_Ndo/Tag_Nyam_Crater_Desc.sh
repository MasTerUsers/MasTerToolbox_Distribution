#!/bin/bash
# This scripts tags all the the jpg images in dir with date close to Nyam crater 
#   then it creatyes a gif.
#  Jpg and envi files were copied manually from DRC_NyigoCrater_D_21 as it is on the same swath/burst. 
#
# New in V1.1 Beta:	- take state variable for PATHGNU etc
#
# CSL InSAR Suite utilities. 
# NdO (c) 2018/01/19 - could make better with more functions... when time.
# -----------------------------------------------------------------------------------------
PRG=`basename "$0"`
VER="v1.1 Beta CIS script utilities"
AUT="Nicolas d'Oreye, (c)2018, Last modified on Oct 30, 2018"
echo " "
echo "${PRG} ${VER}, ${AUT}"
echo " " 

# For Nyam Crater when commputed from Nyigo_Nyam_Crater
LABELX=3040
LABELY=980

for JPGDIR in `ls *.jpg`
do 
	DATE=`echo ${JPGDIR} | cut -d _ -f 2`
	
	DATECELL=" -gravity SouthWest -undercolor white -font Helvetica -pointsize 12 -fill black -annotate"
	POSDATECELL=" +${LABELX}+${LABELY} "
	cp -f ${JPGDIR} ${JPGDIR}_tmp
	${PATHCONV}/convert ${DATECELL}${POSDATECELL} "${DATE}" ${JPGDIR}_tmp ${JPGDIR} 2> /dev/null
	rm ${JPGDIR}_tmp
done

jpg2movie_gif.sh S1 DRC_NyamCrater_D_21 Nyigo_Nyam_crater_originalForm 