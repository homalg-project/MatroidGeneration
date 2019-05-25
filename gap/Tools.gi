#
# MatroidGeneration: Tools
#
# Implementations
#

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

## Constributed by Chris Jefferson
## Email from 27. April 2017 at 14:51:34 CEST
InstallGlobalFunction( CopyPermGroup,
  function(G)
    local copy;
    
    if not HasStabChainMutable(G) then
        return G;
    fi;
    
    copy := Group(GeneratorsOfGroup(G), ());
    
    if HasSize(G) then
        SetSize(copy, Size(G));
    fi;
    
    if HasMovedPoints(G) then
        SetMovedPoints(copy, MovedPoints(G));
    fi;
    
    return copy;
    
end );

##
InstallGlobalFunction( IsSymmetricMultiplicityVector,
  function( vec )
    local relevantNumbers, symmetryNumber;
    
    relevantNumbers := Filtered( [ 3 .. Maximum( vec ) ], i -> Number( vec, j -> j = i ) > 0 );
    
    if Length( relevantNumbers ) = 0 then
        return false;
    fi;
    
    symmetryNumber := Number( vec, j -> j = relevantNumbers[1] );
    
    return ForAll( relevantNumbers, i -> Number(vec, j -> j=i ) = symmetryNumber );
    
end );

##
InstallGlobalFunction( FlatenMultiplicityVector,
  function( vec )
    
    if ForAll( vec, IsList ) then
        vec := Concatenation( List( vec, a -> ListWithIdenticalEntries( a[2], a[1] ) ) );
    fi;
    
    return Reversed( SortedList( vec ) );
    
end );
