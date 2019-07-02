# The GAP package MatroidGeneration

This package was used to create the publicly available read-only ArangoDB collection `matroids_split_public`.

#### Table of contents

* [Accessing the collection through the web interface](#accessing-the-collection-through-the-web-interface)
* [Accessing the collection through GAP](#accessing-the-collection-through-gap)
* [Content of the collection](#content-of-the-collection)
* [Verifying Terao's freeness conjecture for rank 3 matroids with 14 atoms](#verifying-teraos-freeness-conjecture-for-rank-3-matroids-with-14-atoms)
  * [in the web interface using filters](#in-the-web-interface-using-filters)
  * [in the web interface using a query](#in-the-web-interface-using-a-query)
  * [in GAP](#in-gap)

## Accessing the collection through the web interface

The collection can be accessed through the publicly available ArangoDB web interface:

|           | credentials                                                                            |
|-----------|----------------------------------------------------------------------------------------|
|server	    | [https://matroid.mathematik.uni-siegen.de/](https://matroid.mathematik.uni-siegen.de/) |
|username   | matroid                                                                                |
|password   | matroid                                                                                |
|database   | MatroidsDB                                                                             |
|collection | matroids_split_public                                                                  |

<p>
<img src="doc/matroid1.png" alt="Logging into the webinterface" style="float: center; margin-right: 10px;" width="300"/>
</p>
<p>
<img src="doc/matroid2.png" alt="Choosing the database MatroidsDB" style="float: center; margin-right: 10px;" width="300"/>
</p>
<p>
<img src="doc/matroid3.png" alt="Inside the database MatroidsDB" style="float: center; margin-right: 10px;" width="500"/>
</p>
<p>
<img src="doc/matroid4.png" alt="Choosing the collection matroids_split_public" style="float: center; margin-right: 10px;" width="700"/>
</p>

## Accessing the collection through GAP

The package can also be used to access the collection directly.

1. First start `gap` and make sure you can
```gap
gap> LoadPackage( "MatroidGeneration" );
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  AutoDoc 2019.05.20 (Generate documentation from GAP source code)
by Sebastian Gutsche (https://algebra.mathematik.uni-siegen.de/gutsche/) and
   Max Horn (https://www.quendi.de/math).
Homepage: https://gap-packages.github.io/AutoDoc
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  ferret 1.0.2 (Backtrack Search in Permutation Groups)
by Christopher Jefferson (http://caj.host.cs.st-andrews.ac.uk/).
Homepage: https://gap-packages.github.io/ferret/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  Gauss 2019.06.01 (Extended Gauss functionality for GAP)
by Simon Görtzen (https://www.linkedin.com/in/simongoertzen/).
Homepage: https://homalg-project.github.io/homalg_project/Gauss/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  json 2.0.0 (Reading and Writing JSON)
by Christopher Jefferson (http://caj.host.cs.st-andrews.ac.uk/).
Homepage: https://gap-packages.github.io/json/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  ToolsForHomalg 2019.06.02 (Provides special methods and knowledge propagation tools)
by Mohamed Barakat (https://mohamed-barakat.github.io),
   Sebastian Gutsche (https://sebasguts.github.io), and
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/).
Homepage: https://homalg-project.github.io/homalg_project/ToolsForHomalg/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  images 1.1.0 (Minimal and Canonical images)
by Christopher Jefferson (http://caj.host.cs.st-andrews.ac.uk/),
   Markus Pfeiffer (http://www.morphism.de/~markusp/),
   Rebecca Waldecker (http://conway1.mathematik.uni-halle.de/~waldecker/), and
   Eliza Jonauskyte (ej31@st-andrews.ac.uk).
Homepage: https://gap-packages.github.io/images/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  MatricesForHomalg 2019.06.03 (Lazy evaluated matrices with clever operations for the homalg project)
by Mohamed Barakat (https://mohamed-barakat.github.io),
   Markus Lange-Hegermann (https://www.hs-owl.de/fb5/fachbereich/fachgebiete/md/team/prof-dr-markus-lange-hegermann.html),
   Martin Leuner (http://wwwb.math.rwth-aachen.de/Mitarbeiter/leuner.php), and
   Vinay Wagh (http://www.iitg.ernet.in/vinay.wagh/).
Homepage: https://homalg-project.github.io/homalg_project/MatricesForHomalg/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  ParallelizedIterators 2019.06.06 (Parallely evaluate recursive iterators)
by Mohamed Barakat (https://mohamed-barakat.github.io),
   Reimer Behrends (https://github.com/rbehrends), and
   Lukas Kühne (https://github.com/lukaskuehne).
Homepage: https://homalg-project.github.io/ParallelizedIterators
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  GaussForHomalg 2019.06.01 (Gauss functionality for the homalg project)
by Simon Görtzen (https://www.linkedin.com/in/simongoertzen/).
Homepage: https://homalg-project.github.io/homalg_project/GaussForHomalg/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  HomalgToCAS 2019.06.01 (A window to the outer world)
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/),
   Mohamed Barakat (https://mohamed-barakat.github.io),
   Simon Görtzen (https://www.linkedin.com/in/simongoertzen/),
   Sebastian Gutsche (https://sebasguts.github.io), and
   Vinay Wagh (http://www.iitg.ernet.in/vinay.wagh/).
Homepage: https://homalg-project.github.io/homalg_project/HomalgToCAS/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  IO_ForHomalg 2019.06.01 (IO capabilities for the homalg project)
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/),
   Mohamed Barakat (https://mohamed-barakat.github.io),
   Sebastian Gutsche (https://algebra.mathematik.uni-siegen.de/gutsche/),
   Max Neunhöffer (http://www-groups.mcs.st-and.ac.uk/~neunhoef/), and
   Daniel Robertz (http://wwwb.math.rwth-aachen.de/~daniel/).
Homepage: https://homalg-project.github.io/homalg_project/IO_ForHomalg/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  RingsForHomalg 2019.06.01 (Dictionaries of external rings for the homalg project)
by Mohamed Barakat (https://mohamed-barakat.github.io),
   Simon Görtzen (https://www.linkedin.com/in/simongoertzen/),
   Markus Kirschmer (http://www.math.rwth-aachen.de/~Markus.Kirschmer/),
   Markus Lange-Hegermann (https://www.hs-owl.de/fb5/fachbereich/fachgebiete/md/team/prof-dr-markus-lange-hegermann.html),
   Oleksandr Motsak (http://www.mathematik.uni-kl.de/~motsak/),
   Daniel Robertz (http://wwwb.math.rwth-aachen.de/~daniel/),
   Hans Schönemann (http://www.mathematik.uni-kl.de/~hannes/),
   Andreas Steenpaß (steenpass@mathematik.uni-kl.de), and
   Vinay Wagh (http://www.iitg.ernet.in/vinay.wagh/).
Homepage: https://homalg-project.github.io/homalg_project/RingsForHomalg/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  ArangoDBInterface 2019.04.07 (An interface to ArangoDB)
by Mohamed Barakat (https://algebra.mathematik.uni-siegen.de/barakat/).
Homepage: https://github.com/homalg-project/ArangoDBInterface/
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  alcove 2019-03-11 (alcove - Objects in Algebraic Combinatorics)
by Martin Leuner (http://wwwb.math.rwth-aachen.de/~leuner/).
Homepage: https://github.com/martin-leuner/alcove
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  MatroidGeneration 2019.06.06 (Generate low-rank matroids)
by Mohamed Barakat (https://mohamed-barakat.github.io) and
   Lukas Kühne (https://github.com/lukaskuehne).
Homepage: https://homalg-project.github.io/MatroidGeneration
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
true
```
`MatroidGeneration` recursively depends on the above packages, which can all be downloaded
from [https://github.com/homalg-project/](https://github.com/homalg-project/).

2. Then attach the database `MatroidsDB`:
```gap
gap> db := AttachMatroidsDatabase();
#I  Connecting to http+ssl://matroid.mathematik.uni-siegen.de:443
================================================================

                                       _
  __ _ _ __ __ _ _ __   __ _  ___  ___| |__
 / _` | '__/ _` | '_ \ / _` |/ _ \/ __| '_ \
| (_| | | | (_| | | | | (_| | (_) \__ \ | | |
 \__,_|_|  \__,_|_| |_|\__, |\___/|___/_| |_|
                       |___/

arangosh (ArangoDB 3.4.5 [darwin] 64bit, using jemalloc, build , VPack 0.1.33, RocksDB 5.16.0, ICU 58.1, V8 5.7.492.77, OpenSSL 1.0.2r  26 Feb 2019)
Copyright (c) ArangoDB GmbH

Command-line history will be persisted when the shell is exited.
Connected to ArangoDB 'http+ssl://matroid.mathematik.uni-siegen.de:443' version: 3.3.19 [UNKNOWN, server], database: 'MatroidsDB', username: 'matroid'

Type 'tutorial' for a tutorial or 'help' to see common examples

================================================================
[object ArangoDatabase "MatroidsDB"]
gap> ?QueryDatabase
```

## Content of the collection

The database collection `matroids_split_public` contains the values of the following keys:
* Rank
* NumberOfAtoms
* Characteristic
* Exponents
* AutomorphismGroup
* AutomorphismGroupSize
* AutomorphismGroupSizeFactors
* CharacteristicSet
* CoordinateRingOfModuliSpace
* DimensionOverZ
* DressWenzelCondition
* InequalitiesOfModuliSpace
* IsBalanced
* IsCharPolyIntegrallySplitting
* IsDivisionallyFree
* IsEssentiallyUniquelyRepresentableOverZ
* IsInductivelyFree
* IsRepresentable
* IsSimplicial
* IsSupersolvable
* IsTutteUnique
* IsUniquelyRepresentableOverZ
* IsStronglyBalanced
* ListOfCoatoms
* MatrixOfVectorMatroid
* MultiplicityVector
* TuttePolynomial

## Verifying Terao's freeness conjecture for rank 3 matroids with 14 atoms

The first intended use case is to verify Terao's freeness conjecture for rank 3 matroids with 14 atoms.
This can be either done by a query in the web interface or in GAP.

For details see our paper "[On the generation of rank 3 simple matroids with an application to Terao's freeness conjecture]()".

### in the web interface using filters
After choosing the collection `COLLECTION > matroids_split_public` press filter button
and enter the following filter values (which will be combined with the AND connective)
```
Rank == 3
NumberOfAtoms == 14
IsRepresentable == true
IsUniquelyRepresentableOverZ == false
IsInductivelyFree == false
IsStronglyBalanced == true
```
and then press ENTER. The result will be `No documents`.

<p>
<img src="doc/matroid5.png" alt="Login" style="float: center; margin-right: 10px;" width="700"/>
</p>

### in the web interface using a query
There should be a predefined query `QUERIES > Queries > Check_Terao_14` which upon execution
returns an empty list.
Here is its content, also in case it was accidentally deleted or modified by another user:
```
FOR d IN matroids_split_public
  FILTER d.Rank == 3 &&
         d.NumberOfAtoms == 14 &&
         d.IsRepresentable == true &&
         d.IsUniquelyRepresentableOverZ == false &&
         d.IsInductivelyFree == false &&
	 d.IsStronglyBalanced == true
  SORT d.NumberOfAtoms, d.Characteristic, d.DimensionOverZ DESC
  RETURN { NumberOfAtoms : d.NumberOfAtoms,
           Characteristic: d.Characteristic,
           DimensionOverZ : d.DimensionOverZ,
           CoordinateRingOfModuliSpace : d.CoordinateRingOfModuliSpace,
           InequalitiesOfModuliSpace: d.InequalitiesOfModuliSpace,
           Exponents: d.Exponents,
           MultiplicityVector : d.MultiplicityVector,
          _key : d._key }
```
<p>
<img src="doc/matroid6.png" alt="Login" style="float: center; margin-right: 10px;" width="700"/>
</p>
<p>
<img src="doc/matroid7.png" alt="Login" style="float: center; margin-right: 10px;" width="700"/>
</p>

### in GAP
```gap
gap> LoadPackage( "MatroidGeneration" );
true
gap> db := AttachMatroidsDatabase();
[object ArangoDatabase "MatroidsDB"]
gap> q := QueryDatabase( rec(
>      	  Rank := 3,
>      	  NumberOfAtoms := 14,
>      	  IsRepresentable := true,
>	  IsUniquelyRepresentableOverZ := false,
>	  IsInductivelyFree := false,
>	  IsStronglyBalanced := true ),
> db.matroids_split_public );
[ArangoQueryCursor in [object ArangoDatabase "MatroidsDB"]]
gap> q.count();
0
```
