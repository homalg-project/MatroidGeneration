#! @Chunk DivFreeNotIndFree

LoadPackage( "MatroidGeneration" );

#! This is the smallest representable rank $3$ matroid
#! which is divisionally free but not inductively free.
#! It has $14$ atoms (cf. <Cite Key="BBJKL"/>).

#! @Example
#db := AttachMatroidsDatabase( ); # needs arangosh
#key := "ef53049d834fba1b21f36c365d7f1d46d7fce2f2";
#d := db.matroids_split_public.document( key );
d := [ [ 1, 2, 3, 4, 5 ], [ 1, 6, 7, 8, 9 ],
       [ 1, 10, 11, 12 ], [ 2, 6, 10, 13 ], [ 2, 7, 11, 14 ],
       [ 3, 6, 12, 14 ], [ 3, 8, 11, 13 ], [ 4, 9, 10, 14 ],
       [ 4, 7, 13 ], [ 5, 7, 12 ], [ 5, 8, 10 ],
       [ 5, 9, 11 ], [ 5, 13, 14 ], [ 9, 12, 13 ],
       [ 1, 13 ], [ 1, 14 ], [ 2, 8 ], [ 2, 9 ], [ 2, 12 ], [ 3, 7 ],
       [ 3, 9 ], [ 3, 10 ], [ 4, 6 ], [ 4, 8 ], [ 4, 11 ], [ 4, 12 ],
       [ 5, 6 ], [ 6, 11 ], [ 7, 10 ], [ 8, 12 ], [ 8, 14 ] ];;
matroid := MatroidByCoatomsNC( 14, 3, d );
#! <A matroid>
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
#! Z
SetInfoLevel( InfoWarning, 0 );
M := EquationsAndInequationsOfModuliSpaceOfMatroid( matroid, ZZ );;
LoadPackage( "ZariskiFrames" );
#! true
m := DistinguishedQuasiAffineSet( M );
#! V_{Z[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12]}( I )
#! \ V_{Z[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12]}( J_1 )
#! \ .. \ V_{Z[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12]}( J_199 )
e := EmbedInSmallerAmbientSpace( m );
#! V_{Z[a9]}( I ) \ V_{Z[a9]}( J_1 ) \ V_{Z[a9]}( J_2 )
Display( e );
#! V( <2*a9^2-2*a9+1> ) \ V( <5,a9+1> ) \ V( <5,a9-2> )
a := DistinguishedLocallyClosedPart( e );
#! V_{Z[a9]}( I ) \ V_{Z[a9]}( J_1 ) \ V_{Z[a9]}( J_2 )
Display( a );
#! V( <2*a9^2-2*a9+1> ) \ V( <3*a9-1> ) \ V( <a9+1> )
piter := PseudoIteratorOfClosedPoints( e );
#! <iterator of closed points of
#!  V_{Z[a9]}( I ) \ V_{Z[a9]}( J_1 ) \ V_{Z[a9]}( J_2 )>
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(3)[a9]/( a9^2-a9-1 ):
#! 1,0,1,1,    1,  0,1,1,   1,    0, 1,   1, 0,    1,
#! 0,1,1,-a9-1,-a9,0,0,0,   0,    1, a9-1,1, 1,    1,
#! 0,0,0,0,    0,  1,1,a9+1,-a9+1,a9,1,   a9,-a9-1,1
#! 
#! modulo [ a9^2-a9-1 ]
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(7)[a9]/( a9^2-a9-3 ):
#! 1,0,1,1,     1,   0,1,1,      1,    0, 1,      1, 0,     1,
#! 0,1,1,2*a9-1,2*a9,0,0,0,      0,    1, -2*a9+2,1, 1,     1,
#! 0,0,0,0,     0,   1,1,-2*a9+1,-a9+1,a9,1,      a9,2*a9-1,1
#! 
#! modulo [ a9^2-a9-3 ]
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(11)[a9]/( a9^2-a9-5 ):
#! 1,0,1,1,     1,   0,1,1,      1,    0, 1,      1, 0,     1,
#! 0,1,1,2*a9-1,2*a9,0,0,0,      0,    1, -2*a9+2,1, 1,     1,
#! 0,0,0,0,     0,   1,1,-2*a9+1,-a9+1,a9,1,      a9,2*a9-1,1
#! 
#! modulo [ a9^2-a9-5 ]
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(13):
#! 1,0,1,1, 1, 0,1,1,1,0, 1,1, 0, 1,
#! 0,1,1,-5,-4,0,0,0,0,1, 6,1, 1, 1,
#! 0,0,0,0, 0, 1,1,5,3,-2,1,-2,-5,1
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(17):
#! 1,0,1,1,1,0,1,1, 1,0, 1, 1, 0,1,
#! 0,1,1,4,5,0,0,0, 0,1, -3,1, 1,1,
#! 0,0,0,0,0,1,1,-4,7,-6,1, -6,4,1
p := NextIterator( piter );
#! <A vector matroid>
Display( p );
#! The vector matroid of this matrix over GF(19)[a9]/( a9^2-a9-9 ):
#! 1,0,1,1,     1,   0,1,1,      1,    0, 1,      1, 0,     1,
#! 0,1,1,2*a9-1,2*a9,0,0,0,      0,    1, -2*a9+2,1, 1,     1,
#! 0,0,0,0,     0,   1,1,-2*a9+1,-a9+1,a9,1,      a9,2*a9-1,1
#! 
#! modulo [ a9^2-a9-9 ]
charset := ConstructibleProjection( e );
#! ( V_{Z}( I1 ) \ V_{Z}( J1_1 ) \ V_{Z}( J1_2 ) )
Display( charset );
#! V( <> ) \ V( <2> ) \ V( <5> )
#! @EndExample
