# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# Reading the implementation part of the package.
#

ReadPackage( "MatroidGeneration", "gap/Rank3Matroids.gi");

if IsHPCGAP then
ReadPackage( "MatroidGeneration", "gap/ptree.gi");
fi;

ReadPackage( "MatroidGeneration", "gap/Database.gi");

ReadPackage( "MatroidGeneration", "gap/Tools.gi");
