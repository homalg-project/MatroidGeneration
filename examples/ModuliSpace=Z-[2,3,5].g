LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split_public.document("34695a21a6c818bd99bc63bbf7ab162e2e9267cf");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames", ">= 2019.04.16" );
m := DistinguishedQuasiAffineSet( M );
