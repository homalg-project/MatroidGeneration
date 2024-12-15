# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "MatroidGeneration",
Subtitle := "Generate low-rank matroids",
Version := "2024.12-01",

Date := "2024-12-15",
Date := "2024-12-15",
License := "GPL-2.0-or-later",


Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Mohamed",
    LastName := "Barakat",
    WWWHome := "https://mohamed-barakat.github.io/",
    Email := "mohamed.barakat@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Lukas",
    LastName := "Kühne",
    WWWHome := "https://github.com/lukaskuehne",
    Email := "lf.kuehne@gmail.com",
           PostalAddress := Concatenation(
               "Inselstr. 22\n",
               "04103 Leipzig\n",
               "Germany" ),
    Place := "Leipzig",
    Institution := "Max Planck Institute for Mathematics in the Sciences",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/MatroidGeneration",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/MatroidGeneration",
PackageInfoURL  := "https://homalg-project.github.io/MatroidGeneration/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/MatroidGeneration/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/MatroidGeneration/releases/download/v", ~.Version, "/MatroidGeneration-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz .zip",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "MatroidGeneration",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Generate low-rank matroids",
),

Dependencies := rec(
  GAP := ">= 4.12.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "images", ">= 1.1.0" ],
                   [ "ParallelizedIterators", ">= 2018.12.09" ],
                   [ "ArangoDBInterface", ">= 2018.12.09" ],
                   [ "alcove", ">= 2019-03-11" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "matroid generation, low-rank matroids" ],

));
