
using HomalgProject

LoadPackage( "MatroidGeneration" )

db = AttachMatroidsDatabase()

q = QueryDatabase(
  julia_to_gap( Dict(
        "Rank" => 3,
        "NumberOfAtoms" => 14,
        "IsRepresentable" => true,
        "IsInductivelyFree" => false,
        "IsStronglyBalanced" => true,
        "IsUniquelyRepresentableOverZ" => false ) ),
  db.matroids_split_public )

q.count()


