#
# Rank3Matroids: Rank 3 matroids
#
# Implementations
#

##
InstallGlobalFunction( GenerateMultiplicityVectorsOfRank3Matroids,
  function( n )
    local balanced, bino, result, maxExponentRange, exp1, exp2, b2, maxMultiplicity, numberOfCoatoms, MultiplicityVectors, currentMultiplicityVector;
    
    balanced := ValueOption( "balanced" );
    
    if not balanced = true then
        balanced := fail;
    fi;
    
    bino := Binomial(n, 2);
    result := [];
    
    if balanced then
        maxExponentRange := [ Int((n - 1) / 2) ];
        maxMultiplicity := Int(n/2)-1;
    else
        maxExponentRange := [ Int((n - 1) / 2) .. (n - 2) ];
        maxMultiplicity := n - 1;
    fi;
    
    for exp1 in maxExponentRange do
	
        # The two non-trivial exponents of A
        exp2 := n - 1 - exp1;
        
        # The quadratic term of the charateristic polynomial, i.e. b_2(A)
        b2 := exp1 + exp2 + ( exp1 * exp2 );
        
        for numberOfCoatoms in [ n .. b2 ] do
            # This makes sure the characteristic polynomial splits with roots exp1, exp2
            MultiplicityVectors := RestrictedPartitions(b2 + numberOfCoatoms, [2 .. maxMultiplicity], numberOfCoatoms);
            
            for currentMultiplicityVector in MultiplicityVectors do
                # Makes sure the MultiplicityVector can come from an arrangement
                if Sum(List(currentMultiplicityVector, x -> Binomial(x, 2))) = bino then
                    if not currentMultiplicityVector in result then
                        Append(result, [currentMultiplicityVector] );
                    fi;
                fi;
            od;
        od;
    od;
    
    return result;
    
end );

##
InstallGlobalFunction( ChangePairInAdjacencyMatrix,
  function(mat,vector)
    local i, newMat, iter;
    
    newMat := StructuralCopy(mat);
    
    iter := IteratorOfCombinations(vector,2);
    
    for i in iter do
        newMat[i[1]][i[2]] := 1;
    od;
    
    return newMat;
    
end );

##
InstallGlobalFunction( AddFlatsConnectingPairsOfAtoms,
  function(n,Vectors,mat)
    local pair,iter;
    
    iter:= IteratorOfCombinations([1 .. n],2);
    
    for pair in iter do
        if mat[pair[1]][pair[2]] = 0 then
            Append(Vectors,[pair]);
        fi;
    od;
    
    return Vectors;
    
end );

##	
InstallGlobalFunction( ChangeInterestingVector,
  function(currVector, lastUsedAtom, newLastUsedAtom, interesting)
    local newInteresting, i;
    
    newInteresting := StructuralCopy(interesting);
    
    for i in currVector do
        if (((i+1) in newInteresting) = false) and (i < lastUsedAtom)  then
            Add(newInteresting, (i+1));
        fi;
    od;
    
    if lastUsedAtom < newLastUsedAtom and (((lastUsedAtom+1) in newInteresting) = false) then
        Add(newInteresting, lastUsedAtom+1);
    fi;
    
    return newInteresting;
    
end );

##
InstallGlobalFunction( ChangeExcessCounter,
  function(balancedCounter, vector)
    local i, newBalancedCounter;
    
    newBalancedCounter := ShallowCopy(balancedCounter);
    
    for i in vector do
        newBalancedCounter[i] := Maximum(0,(newBalancedCounter[i]-(Length(vector)-2)));
    od;
    
    return newBalancedCounter;
    
end );

##
InstallGlobalFunction( FlatExcessOfMultiplicityVector,
  function(vec)
    local sum, i;
    
    sum := 0;
    
    for i in vec do
        if (i > 2) then
            sum := sum + (i * (i-2));
        else
            break;
        fi;
    od;
     
     return sum;
     
end );

##
InstallGlobalFunction( ListOfMaximallyConnectedAtomsForBalancedness,
  function(n, adjList)
    local counter, l, pair, bound;
    
    counter := Collected(Flat(adjList));
    
    l := [];
    
    bound := Int((n-1)/2);
    
    for pair in counter do
        if pair[2] = bound then
            Add(l,pair[1]);
        fi;
    od;
    
    return l;
    
end );

##
InstallGlobalFunction( MinimalAdjList,
  function( n, adjList )
    local stab, minAdjList, flatCardinalityVector, blockStart, blockEnd, nextBlock, minimalBlock, minPerm;
    
    stab := SymmetricGroup( n );
    
    minAdjList := [ ];
    
    Sort( adjList, function( a, b ) return Length( a ) > Length( b ) or ( Length( a ) = Length( b ) and a < b ); end );
    
    flatCardinalityVector := List( adjList, Length );
    
    blockStart := 1;
    blockEnd := 1;
    
    while blockEnd <= Length( flatCardinalityVector ) do
        
        if blockEnd < Length( flatCardinalityVector ) then
            
            while flatCardinalityVector[blockEnd] = flatCardinalityVector[blockEnd + 1] do
                
                blockEnd := blockEnd + 1;
                
                if blockEnd = Length( flatCardinalityVector ) then
                    
                    break;
                    
                fi;
                
            od;
            
        fi;
        
        nextBlock := adjList{[ blockStart .. blockEnd]};
        
        nextBlock := Set( nextBlock );
        
        minimalBlock := MinimalImage( stab, nextBlock, OnSetsSets );
        
        minPerm := MinimalImagePerm( stab, nextBlock, OnSetsSets );
        
        adjList := OnSetsSets( adjList, minPerm );
        
        Sort( adjList, function( a, b ) return Length( a ) > Length( b ) or ( Length( a ) = Length( b ) and a < b ); end );
        
        minimalBlock := Set( minimalBlock );
        
        if flatCardinalityVector[blockEnd] > 2 then
            
            stab := Stabilizer( stab, minimalBlock, OnSetsSets );
            
        fi;
        
        Append( minAdjList, minimalBlock );
    
        blockStart := blockEnd + 1;
        blockEnd := blockStart;
        
    od;
    
    Sort( minAdjList, function( a, b ) return Length( a ) > Length( b ) or ( Length( a ) = Length( b ) and a < b ); end );
    
    return minAdjList;
    
end );
