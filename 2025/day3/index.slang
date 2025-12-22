#!/usr/bin/env webscript

// library imports
import FileReader.Scanner;
import System.Collections.Set;
import System.String;

// project imports


public void Main( int, string )
{
	var input = new String( new Scanner( "input" ).getText() );
	// print( cast<string>( input ) );

	var Numbers = new Set<int>();
	Numbers.insert( 9 );
	Numbers.insert( 8 );
	Numbers.insert( 7 );
	Numbers.insert( 6 );
	Numbers.insert( 5 );
	Numbers.insert( 4 );
	Numbers.insert( 3 );
	Numbers.insert( 2 );
	Numbers.insert( 1 );

	int count;
	foreach ( string str : input.SplitBy( LINEBREAK ) ) {
		print( str );

		var result = calcJoltage( new String( str ) );
		// print( "Result: " + result );
		count += result;
	}

	print( "Count: " + count );
}

private int calcJoltage( String joltage )
{
	var length = joltage.Length();
	var highest       = 0;
	var secondHighest = 0;

	for ( var i = 0; i < length; i++ ) {
		var c = joltage.CharAt( i );
		//print( "CharAt( " + i + " ): " + c );

		var cNum = cast<int>( c );
		if ( cNum > highest && i < length - 1 ) {
			highest       = cNum;
			secondHighest = 0;
		}
		else if ( cNum > secondHighest ) {
			secondHighest = cNum;
		}
	}

	return highest * 10 + secondHighest;
}
