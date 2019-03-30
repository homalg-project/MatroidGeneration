#
# MatroidGeneration: Database
#
# Implementations
#

##
InstallValue( MATROIDS_DB,
        rec(
            Credentials := [ "--console.auto-complete", "false",
                             "--console.colors", "false",
                             "--console.pretty-print", "false",
                             "--server.username", "matroid",
                             "--server.password", "matroid",
                             "--server.database", "MatroidsDB",
                             "--server.endpoint", "http+tcp://matroid.mathematik.uni-siegen.de:8529" ],
                           )
                           );

##
InstallGlobalFunction( AttachMatroidsDatabase,
  function( arg... );
    
    return AttachAnArangoDatabase( MATROIDS_DB.Credentials );
    
end );
