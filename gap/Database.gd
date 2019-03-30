#
# MatroidGeneration: Database
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
