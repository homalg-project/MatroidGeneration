# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# Declarations
#

#! @Chapter The database of matroids

#! @Section The database of matroids

DeclareGlobalVariable( "MATROIDS_DB" );

#! @Description
#!  Attach the Arango database of matroids at
#!  <C>http://matroid.mathematik.uni-siegen.de:8529</C>.
#! @Arguments 
#! @Returns a an Arango database
DeclareGlobalFunction( "AttachMatroidsDatabase" );

#! @Description
#!  Construct the matroid defined by the entries
#!  * d.NumberOfAtoms
#!  * d.Rank
#!  * d.ListOfCoatoms (the maximal proper flats)
#!  of the database document <A>d</A>.
#! @Arguments d
DeclareOperation( "MatroidByCoatomsNC",
        [ IsDatabaseDocument ] );

#! @Description
#!  Get the list of equations and inequations defining
#!  the possibly empty moduli space of vector matroids of the matroid
#!  over the homalg ring <A>ZZ</A> defined by the document <A>d</A>.
#!  This is a quasi-affine representation of the (abstractly) affine moduli space.
#! @Arguments d, ZZ
#! @Returns a list
DeclareOperation( "EquationsAndInequationsOfModuliSpaceOfMatroid",
        [ IsDatabaseDocument, IsHomalgRing ] );
