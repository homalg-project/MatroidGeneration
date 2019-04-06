#
# MatroidGeneration: Rank 3 matroids
#
# Implementations
#

##
InstallGlobalFunction( GenerateMultiplicityVectorsOfRank3SplitMatroids,
  function( n )
    local balanced, bino, result, maxExponentRange, exp1, exp2, b2, maxMultiplicity, numberOfCoatoms, MultiplicityVectors, currentMultiplicityVector;
    
    balanced := ValueOption( "balanced" );
    
    if not balanced = true then
        balanced := false;
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
                        Add(result, Reversed( Collected( currentMultiplicityVector ) ) );
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
    local stab, minAdjList, MultiplicityVector, blockStart, blockEnd, nextBlock, minimalBlock, minPerm;
    
    stab := SymmetricGroup( n );
    
    minAdjList := [ ];
    
    Sort( adjList, function( a, b ) return Length( a ) > Length( b ) or ( Length( a ) = Length( b ) and a < b ); end );
    
    MultiplicityVector := List( adjList, Length );
    
    blockStart := 1;
    blockEnd := 1;
    
    while blockEnd <= Length( MultiplicityVector ) do
        
        if blockEnd < Length( MultiplicityVector ) then
            
            while MultiplicityVector[blockEnd] = MultiplicityVector[blockEnd + 1] do
                
                blockEnd := blockEnd + 1;
                
                if blockEnd = Length( MultiplicityVector ) then
                    
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
        
        if MultiplicityVector[blockEnd] > 2 then
            
            stab := Stabilizer( stab, minimalBlock, OnSetsSets );
            
        fi;
        
        Append( minAdjList, minimalBlock );
    
        blockStart := blockEnd + 1;
        blockEnd := blockStart;
        
    od;
    
    Sort( minAdjList, function( a, b ) return Length( a ) > Length( b ) or ( Length( a ) = Length( b ) and a < b ); end );
    
    return minAdjList;
    
end );

##
InstallGlobalFunction( IteratorOfFlatsPerBlock,
  function( info )
    local els, k, previousFlat, comb, lastAtom, interestingAtoms, n, maxAtom, elsFiltered, moveForward,
          len, iter, nextComb, iterEmpty, i, pairCheckMatrix, wasteBudget, excessVector, costAtom,
          NextIterator_NextFlat, IsDoneIterator_NextFlat, ShallowCopy_NextFlat, res_iter;
    
    els := info!.els;
    k := info!.k;
    
    if k > Length(els) then
        return IteratorList([]);
    fi;
    
    previousFlat := info!.previousFlat;
    
    #   if ForAny(comb, i -> i = fail) then
    #     Error("PreviousFlat is not part of els!");
    #   fi;
    
    lastAtom := info!.lastAtom;
    
    interestingAtoms := info!.interestingAtoms;
    
    n := info!.n;
    
    maxAtom := Minimum(lastAtom + k, n);
    
    elsFiltered := Filtered(els, i -> (i <= maxAtom and lastAtom < i) or i in interestingAtoms);
    
    pairCheckMatrix := info!.pairCheckMatrix;
    
    wasteBudget := info!.wasteBudget;
    
    excessVector := info!.excessVector;
    
    costAtom := List( excessVector, i -> Maximum(k - 2 -i , 0 ));
    
    elsFiltered := Filtered( elsFiltered, i -> costAtom[i] <= wasteBudget );
    
    len := Length(elsFiltered);
    
    if len < k then
        return IteratorList([]);
    fi;
    
    if Length(previousFlat) = k then
        comb := List(previousFlat, i -> Position(elsFiltered, i));
    elif Length(previousFlat) = 0 then
        #Special case when the previous Flat has a different length. Comb is set in a way that the first call of Nextiterator will consider the right value [1..k].
        comb := [1 .. k ];
        comb[k] := k - 1;
    else
        Error("Previous Flat is too long or short.");
    fi;
    
    #Print("before while", comb, " previousFlat: ", previousFlat, "\n");
    if ForAny(comb, i -> i = fail) then
        comb := [1 .. k ];
        comb[k] := k - 1;
        iter := IteratorOfCombinations([1 .. Length(elsFiltered)], k);
        iterEmpty := true;
        for nextComb in iter do
            if elsFiltered{nextComb} <= previousFlat then
                comb := nextComb;
            else
                iterEmpty := false;
                break;
            fi;
        od;
        
        if iterEmpty then
            return IteratorList([]);
        fi;
    fi;
    
    #Print("after while comb: ", comb, " flat: ", elsFiltered{comb}, "\n");
    
    NextIterator_NextFlat := function(it)
      local res, comb, k, addedPos, i, len, iterEmpty, skip, lastOldIndex, nextFlat, pairMat, pairCheck, costAtom, wasteBudget;
      
      comb := it!.comb;
      if comb = fail then
          Error("No more elements in iterator.");
      fi;
      
      # first create combination to return
      res := it!.els{comb};
      
      # now construct indices for next combination
      len := it!.len;
      k := it!.k;
      addedPos := it!.addedPos;
      iterEmpty := false;
      skip := true;
      
      while skip do
          iterEmpty := true;
          
          for i in [0..(k-1)] do
              if comb[k-i] < len - i then
                  comb{[k-i..k]} := [comb[k-i] + 1 .. comb[k-i] + 1 + i];
                  iterEmpty := false;
                  break;
              fi;
          od;
          
          if iterEmpty then
              break;
          fi;
          
          #Remove redundancy from last Atoms which have not been used.
          #I.e. only use the first ones of those. If not comb is fast forwarded.
          if not addedPos = fail then
              if comb[k] > addedPos and ForAny([addedPos .. comb[k] - 1], l -> not l in comb ) then
                  lastOldIndex := PositionProperty(comb, i -> i >= addedPos) - 1;
                  comb{[lastOldIndex .. k]} := [comb[lastOldIndex] + 1 .. comb[lastOldIndex] + 1 + k - lastOldIndex];
              fi;
          fi;
          
          nextFlat := it!.els{comb};
          
          #Check if nextFlat >= previousflat
          if nextFlat <= it!.previousFlat then
              continue;
          fi;
          
          #Check if the next Flat joins two Atoms which are already joined.
          pairMat := it!.pairCheckMatrix;
          skip := false;
          for pairCheck in Combinations(nextFlat, 2) do
              if pairMat[pairCheck[1]][pairCheck[2]] = 1 then
                  skip := true;
                  break;
              fi;
          od;
          if skip then
              continue;
          fi;
          
          #check if wasteBudget
          costAtom := it!.costAtom;
          wasteBudget := it!.wasteBudget;
          if Sum( nextFlat, i -> costAtom[i]) > wasteBudget then
              skip := true;
          fi;
      od;
      
      # check if done
      if iterEmpty then
          it!.comb := fail;
      fi;
      
      return res;
    end;
    
    IsDoneIterator_NextFlat := function(it)
      return it!.comb = fail;
    end;
    
    ShallowCopy_NextFlat := function(it)
      return rec(
                 NextIterator := it!.NextIterator,
                 IsDoneIterator := it!.IsDoneIterator,
                 ShallowCopy := it!.ShallowCopy,
                 els := it!.els,
                 k := it!.k,
                 comb := ShallowCopy(it!.comb));
    end;
    
    res_iter := IteratorByFunctions(rec(
                        NextIterator := NextIterator_NextFlat,
                        IsDoneIterator := IsDoneIterator_NextFlat,
                        ShallowCopy := ShallowCopy_NextFlat,
                        els := elsFiltered,
                        k := k,
                        comb := comb,
                        len := len,
                        previousFlat := previousFlat,
                        pairCheckMatrix := pairCheckMatrix,
                        addedPos := Position(elsFiltered, lastAtom + 1),
                        wasteBudget := wasteBudget,
                        costAtom := costAtom));
    
    #Move Iterator once, to get next element.
    if IsDoneIterator(res_iter) then
        return IteratorList([]);
    fi;
    
    previousFlat := NextIterator(res_iter);
    
    return res_iter;
    
end );

##
InstallGlobalFunction( IteratorOfNextBlock,
  function(n, previousBlocks, MultiplicityVector, stabilizerPreviousBlocks, iteratorState, only_balanced_matroids )
    local blockLength, stack, excessVector, wasteBudget, r;
    
    previousBlocks := MakeReadOnlyObj( previousBlocks );
    MultiplicityVector := MakeReadOnlyObj( MultiplicityVector );
    stabilizerPreviousBlocks := MakeReadOnlyObj( stabilizerPreviousBlocks );
    iteratorState := MakeReadOnlyObj( iteratorState );
    
    stabilizerPreviousBlocks := CopyPermGroup( stabilizerPreviousBlocks);
    
    blockLength := PositionProperty( MultiplicityVector, k -> k < MultiplicityVector[1]);
    
    if blockLength = fail then
        blockLength := Length( MultiplicityVector );
    else
        blockLength := blockLength - 1;
    fi;
    
    if MultiplicityVector[1] = 2 then
        return Iterator( [SortedList( AddFlatsConnectingPairsOfAtoms(n, [], NullMat( n, n))) ]);
    fi;
    
    stack := CreateAugmentedLiFoOfIterators();
    
    stack!.minimalBlocks := [ ];
    
    if Length( previousBlocks ) = 0 then
        
        #this makes sure the matroids are balanced with respect to the atoms
        excessVector := List([1 .. n], l -> ((n - 1) / 2));
        
        if only_balanced_matroids then
            wasteBudget := FlatExcessOfMultiplicityVector(MultiplicityVector) - Sum(excessVector);
        else
            wasteBudget := 10*n^3;
        fi;
        
        iteratorState := rec(
                             k := MultiplicityVector[1],
                             els:= [1..n],
                             previousFlat := [],
                             pairCheckMatrix := NullMat( n, n),
                             n := n,
                             lastAtom := 0,
                             interestingAtoms := [1],
                             excessVector := excessVector,
                             wasteBudget := wasteBudget,
                             previousFlats := []);
        iteratorState := MakeReadOnlyObj( iteratorState );
    fi;
    
    Push(stack,[IteratorOfFlatsPerBlock(iteratorState), iteratorState]);
    
    r := rec(
             stack := stack,
             blockLength := blockLength,
             stabilizerPreviousBlocks := stabilizerPreviousBlocks,
             only_balanced_matroids := only_balanced_matroids,
             
             locally_uniform := true,
             
             NextIterator := function(it)
               local stack, previousFlats, iteratorState, nextFlat, n, newExcessVector,
                     newWasteBudget, newFlatList, newLength, newPairMat, newLastUsedAtom,
                     interestingAtoms, newInterestingAtoms, removeRow, newIteratorState,
                     blockLength, newIter, currentMinimalBlock, newPreviousBlocks,
                     completeAdjList, newMultiplicityVector, stabilizerPreviousBlocks,
                     newStabilizerPreviousBlocks, nextIter;
               
               stack := it!.stack;
               
               while (Length(stack) > 0) do
                   
                   iteratorState := InfoOfLiFo(stack);
                   nextFlat := Pop(stack);
                   n := iteratorState!.n;
                   previousFlats := iteratorState!.previousFlats;
                   
                   #TODO remove symmetry here
                   
                   if nextFlat = fail then
                       continue;
                   fi;
                   
                   newExcessVector := ChangeExcessCounter(iteratorState!.excessVector, nextFlat);
                   
                   if only_balanced_matroids then
                       newWasteBudget := FlatExcessOfMultiplicityVector(
                                                 MultiplicityVector{[(Length(previousFlats)+2) .. Length(MultiplicityVector)]}) - Sum(newExcessVector);
                   else
                       newWasteBudget := 10*n^3;
                   fi;
                   
                   newFlatList := Concatenation( previousFlats, [ nextFlat ] );
                   
                   newLength := Length(previousFlats) + 1;
                   
                   newPairMat := ChangePairInAdjacencyMatrix(iteratorState!.pairCheckMatrix, nextFlat);
                   
                   newLastUsedAtom := Maximum(iteratorState!.lastAtom, Maximum(nextFlat));
                   
                   interestingAtoms := iteratorState!.interestingAtoms;
                   
                   if Length(interestingAtoms) < n then
                       newInterestingAtoms := ChangeInterestingVector(nextFlat, iteratorState!.lastAtom, newLastUsedAtom, interestingAtoms);
                   else
                       newInterestingAtoms := interestingAtoms;
                   fi;
                   
                   newInterestingAtoms := Set(newInterestingAtoms);
                   
                   if only_balanced_matroids then
                       removeRow := ListOfMaximallyConnectedAtomsForBalancedness(n, newFlatList);
                       newInterestingAtoms := Difference(newInterestingAtoms, removeRow);
                   fi;
                   
                   blockLength := it!.blockLength;
                   
                   if (newLength  < blockLength ) then
                       
                       newIteratorState := rec(
                                               k := MultiplicityVector[newLength + 1],
                                               els := [1 .. n],
                                               previousFlat := nextFlat,
                                               pairCheckMatrix := newPairMat,
                                               n := n,
                                               lastAtom := newLastUsedAtom,
                                               interestingAtoms := newInterestingAtoms,
                                               excessVector := newExcessVector,
                                               wasteBudget := newWasteBudget,
                                               previousFlats := newFlatList);
                       
                       newIteratorState := MakeReadOnlyObj( newIteratorState );
                       
                       newIter := IteratorOfFlatsPerBlock(newIteratorState);
                       Push( stack, [newIter, newIteratorState]);
                       
                   else
                       
                       #check symmetry
                       stabilizerPreviousBlocks := CopyPermGroup( it!.stabilizerPreviousBlocks );
                       currentMinimalBlock := MinimalImage(stabilizerPreviousBlocks, newFlatList, OnSetsSets);
                       
                       if currentMinimalBlock in stack!.minimalBlocks then
                           
                           continue;
                           
                       else
                           
                           Append(stack!.minimalBlocks, [currentMinimalBlock]);
                           
                           newPreviousBlocks := Concatenation(previousBlocks, newFlatList);
                           
                           if Length(MultiplicityVector) = blockLength then
                               
                               #return finished result
                               completeAdjList := MinimalAdjList( n, newPreviousBlocks);
                               
                               return completeAdjList;
                               
                           elif Length(MultiplicityVector) > blockLength and MultiplicityVector[blockLength + 1] = 2 then
                               
                               #return finished results after appending the twos
                               completeAdjList := AddFlatsConnectingPairsOfAtoms(n, newPreviousBlocks, newPairMat);
                               completeAdjList := MinimalAdjList( n, newPreviousBlocks);
                               
                               return completeAdjList;
                               
                           else
                               
                               #return new Iterator for the next Block
                               newMultiplicityVector := MultiplicityVector{[(blockLength + 1) .. Length(MultiplicityVector)]};
                               
                               newStabilizerPreviousBlocks := Stabilizer(stabilizerPreviousBlocks, newFlatList, OnSetsSets);
                               
                               newIteratorState := rec(
                                                       k := MultiplicityVector[newLength + 1],
                                                       els := [1 .. n],
                                                       previousFlat := [],
                                                       pairCheckMatrix := newPairMat,
                                                       n := n,
                                                       lastAtom := newLastUsedAtom,
                                                       interestingAtoms := newInterestingAtoms,
                                                       excessVector := newExcessVector,
                                                       wasteBudget := newWasteBudget,
                                                       previousFlats := []);
                               
                               newIteratorState := MakeReadOnlyObj( newIteratorState );
                               
                               nextIter := IteratorOfNextBlock(n, newPreviousBlocks, newMultiplicityVector,
                                                   newStabilizerPreviousBlocks, newIteratorState, only_balanced_matroids);
                               
                               return nextIter;
                               
                           fi;
                       fi;
                   fi;
               od;
              
               # empty stack! i.e. iterator is done.
               
               return fail;
               
             end
           );
    
    return IteratorByUncertainFunction(r, fail);
    
end );

##
InstallMethod( Rank3MatroidIterator,
        "for an integer and a list",
        [ IsInt, IsList ],
        
  function( n, multiplicity_vector )
    local only_balanced_matroids;
    
    only_balanced_matroids := ValueOption( "balanced" );
    
    if only_balanced_matroids = fail then
        only_balanced_matroids := false;
    fi;
    
    multiplicity_vector := FlatenMultiplicityVector( multiplicity_vector );
    
    return IteratorOfNextBlock( n, [ ], multiplicity_vector, SymmetricGroup( n ), [ ], only_balanced_matroids );
    
end );
