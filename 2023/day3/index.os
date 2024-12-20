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

	public string =operator( string ) const {
		return "{" + X + "/" + Y + "}";
	}
}

/*
public object NumberPoint extends Point {
	public string Number;

	public void Constructor( int x, int y ) {
		base.Constructor( x, y );
	}

	public int getNumber() const {
		return cast<int>( Number );
	}

	public bool isInPoint( int x, int y ) {
		return ( x >= X + 1) && ( x <= X + strlen( Number ) ) && ( y >= Y - 1 ) && ( y <= Y + 1 );
	}

	public string toString() const {
		return Number + "{" + X + "," + Y + "}";
	}
}
*/

public object NumberPoint {
	public Point BottomRight;
	public Point TopLeft;
	public string Number;

	public void Constructor( int x, int y ) {
		BottomRight = new Point( x + 1, y + 1 );
		TopLeft = new Point( x - 1, y - 1 );
	}

	public int getNumber() const {
		return cast<int>( Number );
	}

	public bool isInPoint( int x, int y ) {
		return x >= TopLeft.X && x <= BottomRight.X && y >= TopLeft.Y && y <= BottomRight.Y;
	}

	public string toString() const {
		return cast<string>( TopLeft ) + "-" + cast<string>( BottomRight );
	}

	public void operator=( string c ) modify {
		BottomRight.X += 1;
		Number += c;
	}
}

public void Main( int argc, string args) modify {
	var file = new Scanner( "input" ).getText();
	var DIGITS const = new String( "0123456789" );

	var line = new String();
	var lineIdx = 1;
	var listIt = new String( file ).SplitBy( LINEBREAK );
	var numberPoints = new List<NumberPoint>();
	int sum;
	var symbolPositions = new Map<int, int>();

	while ( listIt.hasNext() ) {
		line = listIt.next();

		try {
			var charIt = line.getIterator();
			var columnIdx = 1;
			NumberPoint currentNumber;

			while ( charIt.hasNext() ) {
				var ch = charIt.next();

				if ( DIGITS.Contains( ch ) ) {
					if ( !currentNumber ) {
						currentNumber = new NumberPoint( columnIdx, lineIdx );
					}
					currentNumber.Number += ch;

					write( ch );
				} 
				else {
					if ( ch != "." ) {
						symbolPositions.insert( columnIdx, lineIdx );

						write( ch );
					}
					else {
						write( "." );
					}

					if ( currentNumber ) {
						numberPoints.push_back( currentNumber );
						currentNumber = NumberPoint null;
					}
				}

				columnIdx++;
			}
		}
		catch ( string e ) {
			print( "Exception: " + e );
		}

		lineIdx++;

		writeln();
	}

	// foreach ( Pair<int, int> point : symbolPositions ) {
	// 	print( cast<string>( point ) );
	// }
	foreach ( NumberPoint numberPoint : numberPoints ) {
		print( numberPoint.toString() );
	}

	// foreach ( Pair<int, int> point : symbolPositions ) {
	// 	foreach ( NumberPoint numberPoint : numberPoints ) {
	// 		if( numberPoint.isInPoint( point.first, point.second ) ) {
	// 			print( numberPoint.toString() );

	// 			sum += cast<int>( numberPoint.Number );
	// 		}
	// 	}
	// }

	print( "sum: " + sum );
}

