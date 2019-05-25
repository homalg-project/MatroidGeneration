#
# MatroidGeneration: Tools
#
# Declarations
#

# @Chapter Tools

# @Section Tools

#! @Description
#!  Construct the matroid defined by the entries
#!  * d.NumberOfAtoms
#!  * d.Rank
#!  * d.ListOfCoatoms (the maximal proper flats)
#!  of the database document <A>d</A>.
#! @Arguments d
DeclareOperation( "MatroidByCoatomsNC",
        [ IsDatabaseDocument ] );

DeclareGlobalFunction( "CopyPermGroup" );

DeclareGlobalFunction( "IsSymmetricMultiplicityVector" );

DeclareGlobalFunction( "FlatenMultiplicityVector" );
