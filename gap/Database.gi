#
# MatroidGeneration: Database
#
# Implementations
#

##
InstallValue( MATROIDS_DB,
        rec(
            Server := "http+tcp://matroid.mathematik.uni-siegen.de:8529",
            Credentials := [ "--console.auto-complete", "false",
                             "--console.colors", "false",
                             "--console.pretty-print", "false",
                             "--server.username", "matroid",
                             "--server.password", "matroid",
                             "--server.database", "MatroidsDB",
                             "--server.endpoint", ~.Server ],
                           )
                           );

##
InstallGlobalFunction( AttachMatroidsDatabase,
  function( arg... );
    
    Info( InfoArangoDB, 1, "Connecting with ", MATROIDS_DB.Server );
    
    return AttachAnArangoDatabase( MATROIDS_DB.Credentials );
    
end );
