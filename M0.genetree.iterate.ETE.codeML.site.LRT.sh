#!/bin/bash

# this script loops through trees and trimmed alignments in their own directories
# and then subjects them to LRT testing using the ETE3 codeML/src implementation
# this script does NOT parse the LRT results, which are in the stout file

# This script should be run from the same folder where the folder containing the gene trees and alignments are

# export PATH=~/anaconda_ete/bin:$PATH



for f in /genestree/*
	do
	gene=${f##*/}
	mkdir "results_genetree_M0/$gene"
	ete3 evol \
	-t /genestree/$gene \
	--alg /genesalilgn/"${gene}.trim" \
	--models M0 \
	--codeml_param verbose,0 \
	-i "results_genetree_M0/$gene/image.png" \
	--histface bar \
	-C 8 \
	-o "results_genetree_M0/$gene"/ > "results_genetree_M0/$gene/$gene.stdout.txt"
	echo -n "${gene}" >> ETE3_results_genetree_M0.csv
	echo -n "," >> ETE3_results_genetree_M0.csv
	w1=$(grep Average results_genetree_M0/$gene/*.txt | grep -oE '[0-9]+.[0-9]+' | sed -n '1p')
	echo "$w1" >> ETE3_results_genetree_M0.csv
done

