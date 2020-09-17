
using HomalgProject

LoadPackage( "MatroidGeneration" )

coatoms =
  [ [ 1, 2, 3, 4, 5 ], [ 1, 6, 7, 8, 9 ],
    [ 1, 10, 11, 12 ], [ 2, 6, 10, 13 ], [ 2, 7, 11, 14 ], [ 3, 6, 12, 14 ], [ 3, 8, 11, 13 ], [ 4, 9, 10, 14 ],
    [ 4, 7, 13 ], [ 5, 7, 12 ], [ 5, 8, 10 ], [ 5, 9, 11 ], [ 5, 13, 14 ], [ 9, 12, 13 ],
    [ 1, 13 ], [ 1, 14 ], [ 2, 8 ], [ 2, 9 ], [ 2, 12 ], [ 3, 7 ], [ 3, 9 ], [ 3, 10 ],
    [ 4, 6 ], [ 4, 8 ], [ 4, 11 ], [ 4, 12 ], [ 5, 6 ], [ 6, 11 ], [ 7, 10 ], [ 8, 12 ], [ 8, 14 ] ];

matroid = MatroidByCoatomsNC( 14, 3, ConvertJuliaToGAP( coatoms ) )

ℤ = HomalgRingOfIntegersInSingular( )

SetInfoLevel( InfoWarning, 0 )

LoadPackage( "ZariskiFrames" )

M = EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ℤ );

m = DistinguishedQuasiAffineSet( M )

Display( m )

arr = ParametrizedObject( m )

Display( arr )

e = EmbedInSmallerAmbientSpace( m )

Display( e )

a = DistinguishedLocallyClosedPart( e )

Display( a )

arr = ParametrizedObject( e )

Display( arr )

charset = ConstructibleProjection( e )

Display( charset )

piter = PseudoIteratorOfClosedPoints( e )

p = NextIterator( piter )

Display( p )

p = NextIterator( piter )

Display( p )

p = NextIterator( piter )

Display( p )

p = NextIterator( piter )

Display( p )

p = NextIterator( piter )

Display( p )


