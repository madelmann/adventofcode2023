#!/usr/bin/env webscript

// library imports
import FileReader.Scanner;
import System.Collections.Range;
import System.String;

// project imports


public void Main( int, string )
{
	var input = new String( new Scanner( "input" ).getText() );
	// print( cast<string>( input ) );

	int64 invalidIds;
	var rangeStr = new String();

	foreach ( string str : input.SplitBy( "," ) ) {
		// print( "Range: " + str );

		rangeStr = str;
		var range = rangeStr.SplitBy( "-" );
		assert( range.hasNext() );

		invalidIds += countInvalidIds( cast<int>( range.next() ), cast<int>( range.next() ) );
	}

	print( "Found " + invalidIds + " invalid IDs" );
}

private int64 countInvalidIds( int lower, int higher )
{
	print( "From " + lower + " to " + higher );

	int64 invalid;

	foreach ( int num : lower..higher ) {
		var numStr = cast<string>( num );
		if ( strlen( numStr ) % 2 != 0 ) {
			continue;
		}

		var left  = substr( numStr, 0, strlen( numStr ) / 2 );
		var right = substr( numStr, strlen( left ) );

		if ( left == right ) {
			print( left + right );

			invalid += cast<int64>( left + right );
		}
	}

	return invalid;
}

