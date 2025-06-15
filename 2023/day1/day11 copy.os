#!/usr/bin/env slang

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
	digits.insert("zero", 0);

	var DIGITS const = new String("0123456789");
	int sum;
	int sum2;

	var str = new String( file );
	var listIt = str.SplitBy( LINEBREAK );
	while ( listIt.hasNext() ) {
		var line = new String( listIt.next() );
		//print( cast<string>( line ) );

		int firstIndex = 1000000;
		int secondIndex;
                string first;
		string second;

		string first2;
		string second2;
		var charIt = new CharacterIterator( line );
		while ( charIt.hasNext() ) {
			var ch = charIt.next();
			//print( "ch: " + ch );

			if( ch && ch != LINEBREAK && DIGITS.Contains( ch ) ) {
				//print( "ch: " + ch );
				if( !first2 ) {
					first2 = ch;
				}
				else second2 = ch;
			}
		}

		if( !second2 ) second2 = first2;

		foreach (Pair<string, int> pair : digits) {
			var firstIdx = line.IndexOf(pair.first);
			if (firstIdx != -1 && firstIdx < firstIndex) {
				firstIndex = firstIdx;
				first = pair.second;
			}

			var lastIdx = line.LastIndexOf(pair.first);
			if (lastIdx != -1 && lastIdx > secondIndex) {
				secondIndex = lastIdx;
				second = pair.second;
			}
		}		

		//print( "first: " + first );
		//print( "second: " + second );
		var number1 = first + second;
		var number2 = first2 + second2;
		sum += cast<int>( first + second );
		sum2 += cast<int>( first2 + second2 );
		if (number1 != number2) {
			print( cast<string>( line ) );
			print( "number 1: " + number1);
			print( "number 2: " + number2);
			print( "first: " + first);
			print( "second: " + second);	
		}
		print( "sum: " + sum );
	}

	print( "sum: " + sum );
}

