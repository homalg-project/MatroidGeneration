#
# MatroidGeneration: Rank 3 matroids
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

#! @Description
#!  Compute using the &GAP; package <C>Images</C> the minimal representative
#!  of the list of <A>coatoms</A> of the <A>matroid</A> on the atoms [ 1 .. <A>n</A> ].
#! @Arguments matroid
#! @Returns a list of lists
#! @Group MinimalListOfCoatoms
DeclareAttribute( "MinimalListOfCoatoms",
        IsMatroid );

#! @Arguments n, coatoms
#! @Group MinimalListOfCoatoms
DeclareOperation( "MinimalListOfCoatoms",
        [ IsInt, IsList ] );

DeclareGlobalFunction( "IteratorOfFlatsPerBlock" );

DeclareGlobalFunction( "IteratorOfNextBlock" );

#! @Description
#!  Returns a recursive iterator <C>riter</C> of all rank 3 matroids with
#!  <A>n</A> atoms and given multiplicity vector <A>mult_vec</A>.
#!  The recursive iterator <C>riter</C> can for example be evaluated in <C>hpcgap</C> using
#!  * <C>ParallelyEvaluateRecursiveIterator( state, nr_workers, riter, channel_of_matroids );</C>
#!  
#!  where the user should pre-define:
#!  * <C>state := rec( );</C>
#!  * <C>channel_of_matroids := CreateChannel(10^6);</C>
#!  
#!  The function understands the Boolean option <A>balanced</A> and if true
#!  computes only balanced matroids.
#! @Arguments n, mult_vec
#! @Returns an iterator
DeclareOperation( "Rank3MatroidIterator",
        [ IsInt, IsList ] );
#! @InsertChunk Rank3MatroidIterator
