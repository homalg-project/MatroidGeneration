#
# Tools
#
# Declarations
#

#! @Chapter Generate low-rank matroids

#! @Section Rank 3 matroids

#! @Description
#!  Compute the list of multiplicity vectors of rank 3 split matroids with <A>n</A> atoms.
#!  The function understands the Boolean option <A>balanced</A> and if true
#!  computes only balanced multiplicity vectors.
#! @Arguments n
#! @Returns a list of listlists
DeclareGlobalFunction( "GenerateMultiplicityVectorsOfRank3SplitMatroids" );

DeclareGlobalFunction( "ChangePairInAdjacencyMatrix" );

DeclareGlobalFunction( "AddFlatsConnectingPairsOfAtoms" );

DeclareGlobalFunction( "ChangeInterestingVector" );

DeclareGlobalFunction( "ChangeExcessCounter" );

DeclareGlobalFunction( "FlatExcessOfMultiplicityVector" );

DeclareGlobalFunction( "ListOfMaximallyConnectedAtomsForBalancedness" );

DeclareGlobalFunction( "MinimalAdjList" );

DeclareGlobalFunction( "IteratorOfFlatsPerBlock" );

DeclareGlobalFunction( "IteratorOfNextBlock" );

DeclareGlobalFunction( "Rank3MatroidIterator" );
