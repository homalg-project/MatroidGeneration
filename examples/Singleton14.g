LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split_public.document("ec7965794e6c0cc2766eeb2b8557fa149a3f8fc9");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
SetInfoLevel( InfoWarning, 0 );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames" );
m := DistinguishedQuasiAffineSet( M );
e := EmbedInSmallerAmbientSpace( m );
a := DistinguishedLocallyClosedPart( e );