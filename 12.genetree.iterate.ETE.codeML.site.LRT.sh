#!/bin/bash

# this script loops through trees and trimmed alignments in their own directories
# and then subjects them to LRT testing using the ETE3 codeML/src implementation
# this script does NOT parse the LRT results, which are in the stout file

# This script should be run from the same folder where the folder containing the gene trees and alignments are

# export PATH=~/anaconda_ete/bin:$PATH



for f in /genestree/*
	do
	gene=${f##*/}
	mkdir "results_genetree_12/$gene"
	ete3 evol \
	-t /genestree/$gene \
	--alg /genesalign/"${gene}.trim" \
	--models M1 M2 \
	--tests M1,M2 \
	--codeml_param verbose,0 \
	-i "results_genetree_12/$gene/image.png" \
	--histface bar \
	-C 8 \
	-o "results_genetree_12/$gene"/ > "results_genetree_12/$gene/$gene.stdout.txt"
	echo -n "${gene}" >> ETE3_genetree_12_results.csv
	echo -n "," >> ETE3_genetree_12_results.csv
	lnL1=$(grep lnL results_genetree_12/$gene/M1*/rst | grep -oE '\-[0-9]+.[0-9]+')
	echo -n "$lnL1" >> ETE3_genetree_12_results.csv
	echo -n "," >> ETE3_genetree_12_results.csv
	lnL2=$(grep lnL results_genetree_12/$gene/M2*/rst | grep -oE '\-[0-9]+.[0-9]+')
	echo -n "$lnL2" >> ETE3_genetree_12_results.csv
	echo -n "," >> ETE3_genetree_12_results.csv
	LRTp=$(grep '^\s*M1' results_genetree_12/$gene/*.txt | grep -oE '[^ ]+$')
	echo -n "$LRTp" >> ETE3_genetree_12_results.csv 
	echo -n "," >> ETE3_genetree_12_results.csv
	w1=$(grep Average results_genetree_12/$gene/*.txt | grep -oE '[0-9]+.[0-9]+' | sed -n '1p')
	echo -n "$w1" >> ETE3_genetree_12_results.csv
	echo -n "," >> ETE3_genetree_12_results.csv
	w2=$(grep Average results_genetree_12/$gene/*.txt | grep -oE '[0-9]+.[0-9]+' | sed -n '2p')
	echo "$w2" >> ETE3_genetree_12_results.csv
done

