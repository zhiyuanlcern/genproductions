#!/bin/bash

export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh

mass=${1}
contrib=${2} # t-only
width=${3}
# hdampmode=${4}
hfactmode=${4}
higgstype=${5}
alternative=${6}
# set hfact depending on mass and contrib
#e.g, for h125 t = 48, b = 18, t+b = 9
hfact=9

if [ "$alternative" == "1" ]; then
  inline=$(cat scripts/scales-higgs-mass-scan-ps.dat | grep -P "^${mass}\t")
  echo "using alternative hdamp scales for tb loop"
else
  inline=$(cat scripts/scales-higgs-mass-scan.dat | grep -P "^${mass}\t")
  echo "using hdamp for t loop or b loop or tb loop with small difference"
fi

if [ "$inline" == "" ]; then
  echo "Error: There are no hfact damping scales for your chosen mass point, exiting."
  exit
fi

stringarray=($inline)
if [ "$alternative" == "1" ]; then
  if [ "${contrib}" == "tb" ]; then
    hfact=${stringarray[1]}
  else
      echo "alternative hdamp values only defined for tb contribution";
      exit
  fi
else
  if [ "${contrib}" == "t" ]; then
  hfact=${stringarray[1]}
  elif [ "${contrib}" == "b" ]; then
    hfact=${stringarray[2]}
  elif [ "${contrib}" == "tb" ]; then
    hfact=${stringarray[3]}
  else
    echo "Error: Your chosen contribution must can only be t, b, tb, exiting"
    exit
  fi
fi
echo "higgs type set to2:" $higgstype


if [ "${hfactmode}" == 1 ]; then hfact=`awk "BEGIN {print 2*${hfact}}"`; fi
if [ "${hfactmode}" == 2 ]; then hfact=`awk "BEGIN {print 0.5*${hfact}}"`; fi

echo "hfact set to: " $hfact
echo "higgs type set to:" $higgstype

workdir=$PWD/../
template=$workdir/gg_H_2HDM_template/
massdir=$workdir/m${mass}_${contrib}_higgs${higgstype}

if [[ "${hfactmode}" == 1 ]]; then massdir=$workdir/m${mass}_${contrib}_higgs${higgstype}_hfactUp; fi
if [[ "${hfactmode}" == 2 ]]; then massdir=$workdir/m${mass}_${contrib}_higgs${higgstype}_hfactDown; fi

echo "creating directories"
mkdir -p $massdir
echo "Copying files:"
cp -v $template/pwg-rwl.dat $massdir
cp -v $template/ggH_mssm.input-* $massdir
cp -v $template/JHUGen.input $massdir
cp -rv $template/lib $massdir

sed -i "s/XHMASSX/${mass}/g" $massdir/ggH_mssm.input-*
sed -i "s/XHWIDTHX/${width}/g" $massdir/ggH_mssm.input-*
sed -i "s/XHFACTX/${hfact}/g" $massdir/ggH_mssm.input-*
sed -i "s/XHDAMPX/${hdamp}/g" $massdir/ggH_mssm.input-*

# tanb = 15 for h and A
# tanb = 50 for H
# alpha always pi/4

tanb=15
echo tanb set to ${tanb}

sed -i "s/XTANBX/${tanb}/g" $massdir/ggH_mssm.input-*
sed -i "s/XALPHAX/0.785398163397448/g" $massdir/ggH_mssm.input-*


if [ "${contrib}" == "t" ]; then
    sed -i "s/XNOBOTX/1/g" $massdir/ggH_mssm.input-*
    sed -i "s/XNOTOPX/0/g" $massdir/ggH_mssm.input-*
  elif [ "${contrib}" == "b" ]; then
    sed -i "s/XNOBOTX/0/g" $massdir/ggH_mssm.input-*
    sed -i "s/XNOTOPX/1/g" $massdir/ggH_mssm.input-*

  elif [ "${contrib}" == "tb" ]; then
    sed -i "s/XNOBOTX/0/g" $massdir/ggH_mssm.input-*
    sed -i "s/XNOTOPX/0/g" $massdir/ggH_mssm.input-*
  else
    echo "Error: Your chosen contribution must can only be t, b, tb, exiting"
    exit
fi

sed -i "/higgstype/c\higgstype ${higgstype}" $massdir/ggH_mssm.input-*

mv $massdir/ggH_mssm.input-base $massdir/ggH_mssm.input