#!/usr/bin/env webscript

// library imports
import FileReader.Scanner;
import System.Collections.Vector;
import System.String;

// project imports


public void Main( int, string )
{
	var input = new String( new Scanner( "input" ).getText() );
	// print( cast<string>( input ) );

	int count;
	foreach ( string str : input.SplitBy( LINEBREAK ) ) {
		print( str );

		//count += Part1.calcJoltage( new String( str ) );

		var result = Part2.calcJoltage( new String( str ) );
		print( "Result: " + result );
		count += result;
	}

	print( "Count: " + count );
}

private namespace Part1
{
	public int calcJoltage( String joltage )
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
}

private namespace Part2
{
	public int calcJoltage( String joltage )
	{
		var length = joltage.Length();
		var highest       = 0;
		var secondHighest = 0;

		var numbers = new Vector<int>();
		numbers.push_back( 0 );

		for ( var i = 0; i < length; i++ ) {
			var c = joltage.CharAt( i );
			print( "CharAt( " + i + " ): " + c );

			var cNum = cast<int>( c );

			if ( cNum > numbers.first() && i < length - 12 ) {
				numbers.clear();
				numbers.push_back( cNum );
			}
			// else if ( cNum )

			
		}

		var count = 0;
		var numberIt = numbers.getIterator();
		while ( numberIt.hasNext() ) {
			count += numberIt.next() * exp( 10, numbers.size() );
		}
		return count;
	}
}
