LoadPackage( "MatroidGeneration" );
db := AttachMatroidsDatabase();
d := db.matroids_split.document("ca2e1d09990857222f37305ab09d9c5e40522af5");
matroid := MatroidByCoatomsNC( d );
#homalgIOMode( "f" );
ZZ := HomalgRingOfIntegersInSingular( );
M := ModuliSpaceOfMatroidByEquationsAndInequations( matroid, ZZ );
LoadPackage( "ZariskiFrames", ">= 2019.04.13" );
m := DistinguishedQuasiAffineSet( M );
