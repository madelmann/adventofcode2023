#!/usr/local/bin/slang

import FileReader.Scanner;
import System.CharacterIterator;
import System.String;
import System.Collections.List;
import System.Collections.Map;

public void Main( int argc, string args) modify {
	var file = new Scanner( "input" ).getText();

	var digits = new Map<string, int>();
	digits.insert("0", 0);
	digits.insert("1", 1);
	digits.insert("2", 2);
	digits.insert("3", 3);
	digits.insert("4", 4);
	digits.insert("5", 5);
	digits.insert("6", 6);
	digits.insert("7", 7);
	digits.insert("8", 8);
	digits.insert("9", 9);
	digits.insert("one", 1);
	digits.insert("two", 2);
	digits.insert("three", 3);
	digits.insert("four", 4);
	digits.insert("five", 5);
	digits.insert("six", 6);
	digits.insert("seven", 7);
	digits.insert("eight", 8);
	digits.insert("nine", 9);

	int sum;
	var line = new String();

	var str = new String( file );
	var listIt = str.SplitBy( LINEBREAK );
	while ( listIt.hasNext() ) {
		line = listIt.next();

		int firstIndex = 1000000;
		int secondIndex;
		string first;
		string second;

		foreach ( Pair<string, int> pair : digits ) {
			var firstIdx = line.IndexOf( pair.first );
			if ( firstIdx != -1 && firstIdx < firstIndex ) {
				firstIndex = firstIdx;
				first = pair.second;
			}

			var lastIdx = line.LastIndexOf( pair.first );
			if ( lastIdx != -1 && lastIdx > secondIndex ) {
				secondIndex = lastIdx;
				second = pair.second;
			}
		}		

		print( cast<string>( line ) + ": " + first + second );
		// print( "first: " + first );
		// print( "second: " + second );

		sum += cast<int>( first + second );
		//break;
	}

	print( "sum: " + sum );
}

