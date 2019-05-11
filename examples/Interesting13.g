LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split.document("6b4b8282e9790adb5f5250776399b26b5df0eb8e");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames", ">= 2019.04.12" );
m := DistinguishedQuasiAffineSet( M );
