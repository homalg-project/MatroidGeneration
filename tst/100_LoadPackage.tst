# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidGeneration: Generate low-rank matroids
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "Digraphs", false );
true
gap> LoadPackage( "ZariskiFrames", false );
true
gap> LoadPackage( "IO_ForHomalg", false );
true
gap> LoadPackage( "MatroidGeneration", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "Digraphs" );
true
gap> LoadPackage( "ZariskiFrames" );
true
gap> LoadPackage( "IO_ForHomalg" );
true
gap> LoadPackage( "MatroidGeneration" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
gap> HOMALG_IO.show_banners := false;;
