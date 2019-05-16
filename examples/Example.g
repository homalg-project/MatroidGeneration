#! @Chunk Rank3MatroidIterator

LoadPackage( "MatroidGeneration" );

#! @Example
mult_vec := [ [ 2, 8 ], [ 3, 9 ], [ 5, 2 ] ];;
riter := Rank3MatroidIterator( 11, mult_vec );
#! <iterator>
state := rec( );;
channel_of_matroids := CreateChannel(10^6);;
ParallelyEvaluateRecursiveIterator( state, 8, riter, channel_of_matroids );
#! rec( shutdown := function(  ) ... end )
coatoms1 := ReceiveChannel( channel_of_matroids );;
coatoms1[1];
#! [ [ 1, 2, 3, 4, 5 ], [ 1, 6, 7, 8, 9 ], [ 1, 10, 11 ], [ 2, 6, 10 ],
#!   [ 2, 7, 11 ], [ 3, 6, 11 ], [ 3, 7, 10 ], [ 4, 8, 10 ], [ 4, 9, 11 ],
#!   [ 5, 8, 11 ], [ 5, 9, 10 ], [ 2, 8 ], [ 2, 9 ], [ 3, 8 ], [ 3, 9 ],
#!   [ 4, 6 ], [ 4, 7 ], [ 5, 6 ], [ 5, 7 ] ]
coatoms2 := ReceiveChannel( channel_of_matroids );;
coatoms2[1];
#! [ [ 1, 2, 3, 4, 5 ], [ 1, 6, 7, 8, 9 ], [ 1, 10, 11 ], [ 2, 6, 10 ],
#!   [ 2, 7, 11 ], [ 3, 6, 11 ], [ 3, 8, 10 ], [ 4, 7, 10 ], [ 4, 9, 11 ],
#!   [ 5, 8, 11 ], [ 5, 9, 10 ], [ 2, 8 ], [ 2, 9 ], [ 3, 7 ], [ 3, 9 ],
#!   [ 4, 6 ], [ 4, 8 ], [ 5, 6 ], [ 5, 7 ] ]
ReceiveChannel( channel_of_matroids );
#! fail
#! @EndExample
