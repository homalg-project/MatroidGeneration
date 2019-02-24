#
# MatroidGeneration
#
# Reading the implementation part of the package.
#

ReadPackage( "MatroidGeneration", "gap/Rank3Matroids.gi");

if IsHPCGAP then
ReadPackage( "MatroidGeneration", "gap/ptree.gi");
fi;

ReadPackage( "MatroidGeneration", "gap/Tools.gi");
