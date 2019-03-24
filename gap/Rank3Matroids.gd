#
# Tools
#
# Declarations
#

#! @Chapter Generate low-rank matroids

#! @Section Rank 3 matroids

#! @Description
#!  Compute the list of multiplicity vectors of rank 3 matroids with <A>n</A> atoms.
#!  The function understands the Boolean option <A>balanced</A> and if true
#!  computes only balanced multiplicity vectors.
#! @Returns a list of listlists
#! @Arguments n
DeclareGlobalFunction( "GenerateMultiplicityVectorsOfRank3Matroids" );

DeclareGlobalFunction( "ChangePairInAdjacencyMatrix" );

DeclareGlobalFunction( "AddFlatsConnectingPairsOfAtoms" );

DeclareGlobalFunction( "ChangeInterestingVector" );

DeclareGlobalFunction( "ChangeExcessCounter" );

DeclareGlobalFunction( "FlatExcessOfMultiplicityVector" );

DeclareGlobalFunction( "ListOfMaximallyConnectedAtomsForBalancedness" );

DeclareGlobalFunction( "MinimalAdjList" );

DeclareGlobalFunction( "IteratorOfFlatsPerBlock" );
