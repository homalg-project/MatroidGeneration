LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split_public.document("ec7965794e6c0cc2766eeb2b8557fa149a3f8fc9");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames", ">= 2019.04.13" );
m := DistinguishedQuasiAffineSet( M );
