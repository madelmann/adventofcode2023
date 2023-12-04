#!/usr/local/bin/webscript

import FileReader.Scanner;
import System.Collections.Map;
import System.String;

public object Point {
	public int X const;
	public int Y const;

	public void Constructor( int x, int y ) {
		X = x;
		Y = y;
	}
}

public object NumberPoint extends Point {
	public string Number;

	public void Constructor( int x, int y ) {
		base.Constructor( x, y );
	}

	public int getNumber() const {
		return cast<int>( Number );
	}

	public bool isInPoint( int x, int y ) {
		return x >= X && x <= ( X + strlen(Number)) && y >= ( Y - 1 ) && y <= ( Y + 1);
	}
}

public void Main( int argc, string args) modify {
	var file = new Scanner( "input" ).getText();
	var DIGITS const = new String("0123456789");

	int sum;
	
	var line = new String();
	var symbolPositions = new Map<int, int>();
	var numberPoints = new List<NumberPoint>();

	var str = new String( file );
	var listIt = str.SplitBy( LINEBREAK );
	var lineIdx = 0;
	while ( listIt.hasNext() ) {
		line = listIt.next();

		try {
			var columnIdx = 0;
			NumberPoint currentNumber;
			var charIt = line.getIterator();
			while ( charIt.hasNext() ) {
				var ch = charIt.next();

				if ( DIGITS.Contains(ch) ) {
					if ( !currentNumber ) {
						currentNumber = new NumberPoint( lineIdx, columnIdx );
					}
					currentNumber.Number += ch;
				} 
				else {
					if ( ch != "." ) {
						symbolPositions.insert( lineIdx, columnIdx );
					}

					if ( currentNumber ) {
						numberPoints.push_back(currentNumber);
						delete currentNumber;
					}
				}

				columnIdx++;
			}

			foreach ( NumberPoint numberPoint : numberPoints ) {
				// TODO 
			}
		}
		catch ( string e ) {
			print( "Exception: " + e );
		}

		lineIdx++;
	}

	print( "sum: " + sum );
}

