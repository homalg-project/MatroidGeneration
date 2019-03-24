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

#! @Description
#!  Returns an iterator of all rank 3 matroids with
#!  <A>n</A> atoms and given multiplicity vector <A>mult_vec</A>.
#!  The function understands the Boolean option <A>balanced</A> and if true
#!  computes only balanced matroids.
#! @Arguments n, mult_vec
#! @Returns an iterator
DeclareOperation( "Rank3MatroidIterator",
        [ IsInt, IsList ] );
