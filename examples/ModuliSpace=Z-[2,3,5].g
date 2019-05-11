LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split.document("71ffc9ffa4e429bca0eab178ff4340834b931892");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames", ">= 2019.04.16" );
m := DistinguishedQuasiAffineSet( M );
