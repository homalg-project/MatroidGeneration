LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split_public.document("118cb9babc77e406eb53043ac399bf851a012830");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
zz := HomalgRingOfIntegersInSingular( );
SetInfoLevel( InfoWarning, 0 );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, zz );
LoadPackage( "ZariskiFrames", ">= 2023.06-06" );
m := DistinguishedQuasiAffineSet( M );
e := EmbedInSmallerAmbientSpace( m );
a := DistinguishedLocallyClosedPart( e );