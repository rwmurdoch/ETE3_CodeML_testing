# Iterative site-based positive selection testing

These scripts utilize the ETE3 toolkit implementation of CodeML to run dN/dS measurements and site-based
positive selection tests across a series of homologous genes.

## Data input

The genes must already be aligned and converted to tree files

One folder, called "genes.align" contains all alignments and another, called "genes.trees" contains all of the tree files.  
The folders must be in the same directory where the script is executed from and should contain no additional files.

Three scripts are provided, one which measure dN/dS via the M0 model, and two which detect site-based positive selection
using the M2 vs M1 and M8 vs M7 tests.  

## Script editing

For reasons that I do not understand, when using the "ete3 evol" command, the -t and --alg commands require *explicit* filepaths, relative to working directory does not work.

*replace the -t and --alg switches with explicit filepaths for your project**
