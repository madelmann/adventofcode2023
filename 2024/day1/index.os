#!/usr/local/bin/webscript

import FileReader.Scanner;
import System.Collections.Map;
import System.Collections.Set;
import System.Collections.Vector;
import System.String;


public void Main( int argc, string args )
{
	print( "<h1>Day 1</h1>" );
	print( "<pre>" );

	print( "Loading input:" );

	var input = new String( new Scanner( "input" ).getText() );
	//print( cast<string>( input ) );

	print( "Parsing levels:" );

	var countOf = new Map<int, int>();
	var set1 = new Set<int>( true );
	var set2 = new Set<int>( true );

	foreach ( string line : input.SplitBy( LINEBREAK ) ) {
		if ( !line ) {
			continue;
		}

		//print( line );

		var lineIt = new String( line ).SplitBy( "   " );
		assert( lineIt.hasNext() );

		var int1 = cast<int>( lineIt.next() );
		var int2 = cast<int>( lineIt.next() );
		print( "" << int1 << " " << int2 );

		set1.insert( int1 );
		set2.insert( int2 );

		var found = false;
		foreach ( Pair<int, int> p : countOf ) {
			if ( p.first == int1 ) {
				p.second += 1;
				found = true;
				break;
			}
		}

		if ( !found ) {
			countOf.insert( int1, 0 );
		}
	}

	print( "Calculating distances:" );

	int sumDistances;
	var set1It = set1.getIterator();
	var set2It = set2.getIterator();

	while ( set1It.hasNext() && set2It.hasNext() ) {
		var distance = abs( set1It.next() - set2It.next() );

		sumDistances += distance;
	}

	print( "Distance: " + sumDistances );
	print( "End of part 1." );

	print( "Part 2: counting" );

	int similarityScore;
	foreach ( Pair<int, int> p : countOf ) {
		print( "" << p.first << " " << powl( cast<int64>( p.first ), cast<int64>( p.second ) ) );
		similarityScore += powl( cast<int64>( p.first ), cast<int64>( p.second ) );
	}

	print( "Similarity score: " + similarityScore );

	print( "<pre>" );
}
