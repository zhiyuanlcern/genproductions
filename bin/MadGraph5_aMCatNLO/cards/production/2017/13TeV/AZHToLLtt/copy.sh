#!/bin/bash

default=$(basename $(pwd))

is=(360 400 400 500 500 500 500 600 600 600 600 700 700 700 700 800 800 800 800 1000 1000 1000 1000 1500 1500 1500 1500 2000 2000 2000 2000 2500 2500 2500 2500 3000 3000 3000 3000 )
js=(260 260 300 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400 260 300 350 400)
for idx in "${!is[@]}"; do
   mA=${is[$idx]}
   mH=${js[$idx]}
   ks=0.2
   echo $wA
    echo "Copying mass (mA,mH)" # ($mA,$mH)
    newdir="$default"_mA"$mA"_mH"$mH"
    mkdir $newdir
    cp "$default"_customizecards.dat $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    cp "$default"_extramodels.dat $newdir/"$default"_mA"$mA"_mH"$mH"_extramodels.dat
    cp "$default"_madspin_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_madspin_card.dat
    cp "$default"_proc_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_proc_card.dat
    cp "$default"_run_card.dat $newdir/"$default"_mA"$mA"_mH"$mH"_run_card.dat
    # modify output name
    sed -i 's/'$default'/'$default'_mA'$mA'_mH'$mH'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_proc_card.dat
    # Modify mass parameter
    sed -i 's/AMASS/'$mA'.0/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    sed -i 's/HMASS/'$mH'.0/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    # sed -i 's/HWIDTH/'$(bc <<< "$ks * $mH")'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    sed -i 's/HWIDTH/'$(bc <<< " 0 ")'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
    sed -i 's/AWIDTH/'$(bc <<< "$ks * $mA")'/g' $newdir/"$default"_mA"$mA"_mH"$mH"_customizecards.dat
done

sed -i 's/lambda2/-1.00442/g' AZHToLLtt_mA360_mH260/AZHToLLtt_mA360_mH260_customizecards.dat
sed -i 's/lambda3/1.31454/g' AZHToLLtt_mA360_mH260/AZHToLLtt_mA360_mH260_customizecards.dat

sed -i 's/lambda2/-1.50586/g' AZHToLLtt_mA400_mH260/AZHToLLtt_mA400_mH260_customizecards.dat
sed -i 's/lambda3/1.81599/g' AZHToLLtt_mA400_mH260/AZHToLLtt_mA400_mH260_customizecards.dat

sed -i 's/lambda2/-1.23958/g' AZHToLLtt_mA400_mH300/AZHToLLtt_mA400_mH300_customizecards.dat
sed -i 's/lambda3/1.46121/g' AZHToLLtt_mA400_mH300/AZHToLLtt_mA400_mH300_customizecards.dat

sed -i 's/lambda2/-2.99041/g' AZHToLLtt_mA500_mH260/AZHToLLtt_mA500_mH260_customizecards.dat
sed -i 's/lambda3/3.30054/g' AZHToLLtt_mA500_mH260/AZHToLLtt_mA500_mH260_customizecards.dat

sed -i 's/lambda2/-2.72413/g' AZHToLLtt_mA500_mH300/AZHToLLtt_mA500_mH300_customizecards.dat
sed -i 's/lambda3/2.94575/g' AZHToLLtt_mA500_mH300/AZHToLLtt_mA500_mH300_customizecards.dat

sed -i 's/lambda2/-2.33778/g' AZHToLLtt_mA500_mH350/AZHToLLtt_mA500_mH350_customizecards.dat
sed -i 's/lambda3/2.43100/g' AZHToLLtt_mA500_mH350/AZHToLLtt_mA500_mH350_customizecards.dat

sed -i 's/lambda2/-1.89199/g' AZHToLLtt_mA500_mH400/AZHToLLtt_mA500_mH400_customizecards.dat
sed -i 's/lambda3/1.83706/g' AZHToLLtt_mA500_mH400/AZHToLLtt_mA500_mH400_customizecards.dat

sed -i 's/lambda2/-4.80486/g' AZHToLLtt_mA600_mH260/AZHToLLtt_mA600_mH260_customizecards.dat
sed -i 's/lambda3/5.11498/g' AZHToLLtt_mA600_mH260/AZHToLLtt_mA600_mH260_customizecards.dat

sed -i 's/lambda2/-4.53857/g' AZHToLLtt_mA600_mH300/AZHToLLtt_mA600_mH300_customizecards.dat
sed -i 's/lambda3/4.76020/g' AZHToLLtt_mA600_mH300/AZHToLLtt_mA600_mH300_customizecards.dat

sed -i 's/lambda2/-4.15222/g' AZHToLLtt_mA600_mH350/AZHToLLtt_mA600_mH350_customizecards.dat
sed -i 's/lambda3/4.24545/g' AZHToLLtt_mA600_mH350/AZHToLLtt_mA600_mH350_customizecards.dat

sed -i 's/lambda2/-3.70643/g' AZHToLLtt_mA600_mH400/AZHToLLtt_mA600_mH400_customizecards.dat
sed -i 's/lambda3/3.65151/g' AZHToLLtt_mA600_mH400/AZHToLLtt_mA600_mH400_customizecards.dat

sed -i 's/lambda2/-6.94920/g' AZHToLLtt_mA700_mH260/AZHToLLtt_mA700_mH260_customizecards.dat
sed -i 's/lambda3/7.25933/g' AZHToLLtt_mA700_mH260/AZHToLLtt_mA700_mH260_customizecards.dat

sed -i 's/lambda2/-6.68292/g' AZHToLLtt_mA700_mH300/AZHToLLtt_mA700_mH300_customizecards.dat
sed -i 's/lambda3/6.90455/g' AZHToLLtt_mA700_mH300/AZHToLLtt_mA700_mH300_customizecards.dat

sed -i 's/lambda2/-6.29657/g' AZHToLLtt_mA700_mH350/AZHToLLtt_mA700_mH350_customizecards.dat
sed -i 's/lambda3/6.38980/g' AZHToLLtt_mA700_mH350/AZHToLLtt_mA700_mH350_customizecards.dat

sed -i 's/lambda2/-5.85078/g' AZHToLLtt_mA700_mH400/AZHToLLtt_mA700_mH400_customizecards.dat
sed -i 's/lambda3/5.79585/g' AZHToLLtt_mA700_mH400/AZHToLLtt_mA700_mH400_customizecards.dat

sed -i 's/lambda2/-9.42345/g' AZHToLLtt_mA800_mH260/AZHToLLtt_mA800_mH260_customizecards.dat
sed -i 's/lambda3/9.73357/g' AZHToLLtt_mA800_mH260/AZHToLLtt_mA800_mH260_customizecards.dat

sed -i 's/lambda2/-9.15716/g' AZHToLLtt_mA800_mH300/AZHToLLtt_mA800_mH300_customizecards.dat
sed -i 's/lambda3/9.37879/g' AZHToLLtt_mA800_mH300/AZHToLLtt_mA800_mH300_customizecards.dat

sed -i 's/lambda2/-8.77081/g' AZHToLLtt_mA800_mH350/AZHToLLtt_mA800_mH350_customizecards.dat
sed -i 's/lambda3/8.86404/g' AZHToLLtt_mA800_mH350/AZHToLLtt_mA800_mH350_customizecards.dat

sed -i 's/lambda2/-8.32502/g' AZHToLLtt_mA800_mH400/AZHToLLtt_mA800_mH400_customizecards.dat
sed -i 's/lambda3/8.27010/g' AZHToLLtt_mA800_mH400/AZHToLLtt_mA800_mH400_customizecards.dat

sed -i 's/lambda2/-15.36163/g' AZHToLLtt_mA1000_mH260/AZHToLLtt_mA1000_mH260_customizecards.dat
sed -i 's/lambda3/15.67176/g' AZHToLLtt_mA1000_mH260/AZHToLLtt_mA1000_mH260_customizecards.dat

sed -i 's/lambda2/-15.09535/g' AZHToLLtt_mA1000_mH300/AZHToLLtt_mA1000_mH300_customizecards.dat
sed -i 's/lambda3/15.31698/g' AZHToLLtt_mA1000_mH300/AZHToLLtt_mA1000_mH300_customizecards.dat

sed -i 's/lambda2/-14.70900/g' AZHToLLtt_mA1000_mH350/AZHToLLtt_mA1000_mH350_customizecards.dat
sed -i 's/lambda3/14.80223/g' AZHToLLtt_mA1000_mH350/AZHToLLtt_mA1000_mH350_customizecards.dat

sed -i 's/lambda2/-14.26321/g' AZHToLLtt_mA1000_mH400/AZHToLLtt_mA1000_mH400_customizecards.dat
sed -i 's/lambda3/14.20828/g' AZHToLLtt_mA1000_mH400/AZHToLLtt_mA1000_mH400_customizecards.dat

sed -i 's/lambda2/-35.98034/g' AZHToLLtt_mA1500_mH260/AZHToLLtt_mA1500_mH260_customizecards.dat
sed -i 's/lambda3/36.29046/g' AZHToLLtt_mA1500_mH260/AZHToLLtt_mA1500_mH260_customizecards.dat

sed -i 's/lambda2/-35.71405/g' AZHToLLtt_mA1500_mH300/AZHToLLtt_mA1500_mH300_customizecards.dat
sed -i 's/lambda3/35.93568/g' AZHToLLtt_mA1500_mH300/AZHToLLtt_mA1500_mH300_customizecards.dat

sed -i 's/lambda2/-35.32770/g' AZHToLLtt_mA1500_mH350/AZHToLLtt_mA1500_mH350_customizecards.dat
sed -i 's/lambda3/35.42093/g' AZHToLLtt_mA1500_mH350/AZHToLLtt_mA1500_mH350_customizecards.dat

sed -i 's/lambda2/-34.88191/g' AZHToLLtt_mA1500_mH400/AZHToLLtt_mA1500_mH400_customizecards.dat
sed -i 's/lambda3/34.82699/g' AZHToLLtt_mA1500_mH400/AZHToLLtt_mA1500_mH400_customizecards.dat

sed -i 's/lambda2/-64.84652/g' AZHToLLtt_mA2000_mH260/AZHToLLtt_mA2000_mH260_customizecards.dat
sed -i 's/lambda3/65.15665/g' AZHToLLtt_mA2000_mH260/AZHToLLtt_mA2000_mH260_customizecards.dat

sed -i 's/lambda2/-64.58024/g' AZHToLLtt_mA2000_mH300/AZHToLLtt_mA2000_mH300_customizecards.dat
sed -i 's/lambda3/64.80187/g' AZHToLLtt_mA2000_mH300/AZHToLLtt_mA2000_mH300_customizecards.dat

sed -i 's/lambda2/-64.19389/g' AZHToLLtt_mA2000_mH350/AZHToLLtt_mA2000_mH350_customizecards.dat
sed -i 's/lambda3/64.28712/g' AZHToLLtt_mA2000_mH350/AZHToLLtt_mA2000_mH350_customizecards.dat

sed -i 's/lambda2/-63.74810/g' AZHToLLtt_mA2000_mH400/AZHToLLtt_mA2000_mH400_customizecards.dat
sed -i 's/lambda3/63.69317/g' AZHToLLtt_mA2000_mH400/AZHToLLtt_mA2000_mH400_customizecards.dat

sed -i 's/lambda2/-101.96019/g' AZHToLLtt_mA2500_mH260/AZHToLLtt_mA2500_mH260_customizecards.dat
sed -i 's/lambda3/102.27031/g' AZHToLLtt_mA2500_mH260/AZHToLLtt_mA2500_mH260_customizecards.dat

sed -i 's/lambda2/-101.69390/g' AZHToLLtt_mA2500_mH300/AZHToLLtt_mA2500_mH300_customizecards.dat
sed -i 's/lambda3/101.91553/g' AZHToLLtt_mA2500_mH300/AZHToLLtt_mA2500_mH300_customizecards.dat

sed -i 's/lambda2/-101.30755/g' AZHToLLtt_mA2500_mH350/AZHToLLtt_mA2500_mH350_customizecards.dat
sed -i 's/lambda3/101.40078/g' AZHToLLtt_mA2500_mH350/AZHToLLtt_mA2500_mH350_customizecards.dat

sed -i 's/lambda2/-100.86176/g' AZHToLLtt_mA2500_mH400/AZHToLLtt_mA2500_mH400_customizecards.dat
sed -i 's/lambda3/100.80684/g' AZHToLLtt_mA2500_mH400/AZHToLLtt_mA2500_mH400_customizecards.dat

sed -i 's/lambda2/-147.32133/g' AZHToLLtt_mA3000_mH260/AZHToLLtt_mA3000_mH260_customizecards.dat
sed -i 's/lambda3/147.63146/g' AZHToLLtt_mA3000_mH260/AZHToLLtt_mA3000_mH260_customizecards.dat

sed -i 's/lambda2/-147.05505/g' AZHToLLtt_mA3000_mH300/AZHToLLtt_mA3000_mH300_customizecards.dat
sed -i 's/lambda3/147.27668/g' AZHToLLtt_mA3000_mH300/AZHToLLtt_mA3000_mH300_customizecards.dat

sed -i 's/lambda2/-146.66870/g' AZHToLLtt_mA3000_mH350/AZHToLLtt_mA3000_mH350_customizecards.dat
sed -i 's/lambda3/146.76193/g' AZHToLLtt_mA3000_mH350/AZHToLLtt_mA3000_mH350_customizecards.dat

sed -i 's/lambda2/-146.22291/g' AZHToLLtt_mA3000_mH400/AZHToLLtt_mA3000_mH400_customizecards.dat
sed -i 's/lambda3/146.16799/g' AZHToLLtt_mA3000_mH400/AZHToLLtt_mA3000_mH400_customizecards.dat

