#!/usr/bin/env slang

import FileReader.Scanner;
import System.CharacterIterator;
import System.String;
import System.Collections.List;

public void Main( int argc, string args) modify {
	var file = new Scanner( "input" ).getText();

	var DIGITS const = new String("0123456789");
	int sum;

	var str = new String( file );
	var listIt = str.SplitBy( LINEBREAK );
	while ( listIt.hasNext() ) {
		var line = listIt.next();

		string first;
		string second;

		var charIt = new CharacterIterator( line );
		while ( charIt.hasNext() ) {
			var ch = charIt.next();
			//print( "ch: " + ch );

			if( ch && ch != LINEBREAK && DIGITS.Contains( ch ) ) {
				//print( "ch: " + ch );
				if( !first ) {
					first = ch;
				}
				else second = ch;
			}
		}

		if( !second )
			second = first;

		print( line + ": " + first + second );
		//print( "first: " + first );
		//print( "second: " + second );
		sum += cast<int>( first + second );
		//print( "sum: " + sum );
	}

	print( "sum: " + sum );
}

