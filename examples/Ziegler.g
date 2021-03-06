LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase( : localhost );
d := db.matroids_split_public.document("d8ffc0e083ea534e34556086ac2416ca48cc0483");
matroid := MatroidByCoatomsNC( d );
ZZ := HomalgRingOfIntegersInSingular( );
SetInfoLevel( InfoWarning, 0 );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );
LoadPackage( "ZariskiFrames" );
m := DistinguishedQuasiAffineSet( M );
e := EmbedInSmallerAmbientSpace( m );
a := DistinguishedLocallyClosedPart( e );
piter := PseudoIteratorOfClosedPoints( e );
p := NextIterator( piter );
Display( p );
p := NextIterator( piter );
Display( p );
p := NextIterator( piter );
Display( p );
p := NextIterator( piter );
Display( p );
p := NextIterator( piter );
Display( p );
p := NextIterator( piter );
Display( p );
charset := ConstructibleProjection( e );
Display( charset );
