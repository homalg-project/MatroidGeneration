# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# Implementations
#

##
InstallValue( MATROIDS_DB,
        rec(
            Server := "http+ssl://matroid.mathematik.uni-siegen.de:443",
            Credentials := [ "--console.auto-complete", "false",
                             "--console.colors", "false",
                             "--console.pretty-print", "false",
                             "--server.username", "matroid",
                             "--server.password", "matroid",
                             "--server.database", "MatroidsDB",
                             "--server.endpoint" ],
                           )
                           );

##
InstallGlobalFunction( AttachMatroidsDatabase,
  function( arg... )
    local server, credentials;
    
    if ValueOption( "localhost" ) = true then
        server := "http+tcp://127.0.0.1:8529";
    else
        server := MATROIDS_DB.Server;
    fi;
    
    Info( InfoArangoDB, 1, "Connecting to ", server );
    
    credentials := Concatenation( MATROIDS_DB.Credentials, [ server ] );
    
    return AttachAnArangoDatabase( credentials );
    
end );

##
InstallMethod( MatroidByCoatomsNC,
        "for a database document",
        [ IsDatabaseDocument ],
        
  function( d )
    local matroid;
    
    matroid := MatroidByCoatomsNC( d.NumberOfAtoms, d.Rank, d.ListOfCoatoms );
    
    matroid!.document := d;
    
    return matroid;
    
end );

##
InstallMethod( EquationsAndInequationsOfModuliSpaceOfMatroid,
        "for a database document and a homalg ring",
        [ IsDatabaseDocument, IsHomalgRing and IsIntegersForHomalg ],
        
  function( d, ZZ )
    local S, k, pos1, p, R, eqs, pos2, var, ineqs, matrix;
    
    if not IsBound( d.CoordinateRingOfModuliSpace ) then
        Error( "the component d.CoordinateRingOfModuliSpace is not bound\n" );
    elif not IsBound( d.MatrixOfVectorMatroid ) then
        Error( "the component d.MatrixOfVectorMatroid is not bound\n" );
    fi;
    
    S := d.CoordinateRingOfModuliSpace;
    
    if S = "0" then
        return fail;
    elif S{[1]} = "Z" then
        k := ZZ;
    elif S{[1,2]} = "GF" then
        k := HomalgRingOfIntegersInSingular( EvalString( S{[ 4 .. Position( S, ')' ) - 1 ]} ), ZZ );
    else
        Error( "the ring S has an unexpected coefficients ring" );
    fi;
    
    pos1 := Position( S, '[' );
    
    if pos1 = fail then
        if S{[1]} = "Z" then
            # S = Z or Z/( m )
            R := ZZ;
            eqs := S{[ 4 .. Length( S ) - 2 ]};
        else
            # S = GF(p)
            p := S{[ 4 .. Length( S ) - 1 ]};
            R := HomalgRingOfIntegersInSingular( EvalString( p ), ZZ );
            eqs := "";
        fi;
    else
        # S = k[...] or S = k[...]/( ... )
        pos2 := Position( S, ']' );
        var := S{[ pos1 + 1 .. pos2 - 1 ]};
        R := k * var;
        eqs := S{[ pos2 + 4 .. Length( S ) - 2 ]};
    fi;
    
    eqs := SplitString( eqs, "," );
    
    eqs := List( eqs, a -> a / R );
    
    ineqs := d.InequalitiesOfModuliSpace;
    
    ineqs := ineqs{ [ 3 .. Length( ineqs ) - 2 ] };
    
    ineqs := SplitString( ineqs, "," );
    
    ineqs := List( ineqs, a -> a / R );
    
    matrix := HomalgMatrix( d.MatrixOfVectorMatroid, R );
    
    return [ eqs, ineqs, R, matrix ];
    
end );
