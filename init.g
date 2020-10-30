# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# Reading the declaration part of the package.
#

ReadPackage( "MatroidGeneration", "gap/Rank3Matroids.gd");

if IsHPCGAP then
ReadPackage( "MatroidGeneration", "gap/ptree.gd");
else
#Info( InfoWarning, 1, "Warning: ParallelyEvaluateRecursiveIterator can only be load in HPCGAP" );
fi;

ReadPackage( "MatroidGeneration", "gap/Database.gd");

ReadPackage( "MatroidGeneration", "gap/Tools.gd");
