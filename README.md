# Iterative site-based positive selection testing

These scripts utilize the ETE3 toolkit implementation of CodeML to run dN/dS measurements and site-based
positive selection tests across a series of homologous genes.

## Overview

Two tests are performed for positive selection, M2 vs M1 model and M8 vs M7 model.  The test compares the ML values of the trees and returns a p-value.  The lower the p-value, the more likely that the gene is under positive selection in the population.  

## Data input

The genes must already be aligned and converted to tree files

One folder, called "genes.align" contains all alignments and another, called "genes.trees" contains all of the tree files.  
The folders must be in the same directory where the script is executed from and should contain no additional files.

Three scripts are provided, one which measure dN/dS via the M0 model, and two which detect site-based positive selection
using the M2 vs M1 and M8 vs M7 tests.  

## Script editing

For reasons that I do not understand, when using the "ete3 evol" command, the -t and --alg commands require *explicit* filepaths, using filepaths relative to working directory does not work.

*replace the -t and --alg switches with explicit filepaths for your project*

## output

A folder containing all of the results will be generated, a subfolder for each gene tested.  The scripts parse the critical results files and create a single csv formatted table with the ML tree scores and p-values for each test performed (one for each gene).  This script does not apply a false-discovery rate correction; this should be performed afterwards (simple to do with R).

Note that p-values lower than 0.05 are written as 0.049\*\*\*, thus will have to be altered in order to properly be treated numerically.
