#
# MatroidGeneration: Tools
#
# Declarations
#

# @Chapter Tools

# @Section Tools

#! @Description
#!  Construct the matroid defined by the entries
#!  * d.n (number of atoms)
#!  * d.rank
#!  * d.adjList (list of coatoms, i.e., maximal proper flats)
#!  of the database document <A>d</A>.
#! @Arguments d
DeclareOperation( "MatroidByCoatomsNC",
        [ IsDatabaseDocument ] );

DeclareGlobalFunction( "CopyPermGroup" );

DeclareGlobalFunction( "IsSymmetricMultiplicityVector" );

DeclareGlobalFunction( "FlatenMultiplicityVector" );
