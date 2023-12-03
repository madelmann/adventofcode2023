#!/usr/local/bin/webscript

import FileReader.Scanner;
import System.Collections.Vector;
import System.String;


public string BLUE const = "blue";
public string GREEN const = "green";
public string RED const = "red";


public object CubeSet
{
	public int Blue;
	public int Green;
	public int Red;

	public void parse( String set ) modify {
		//print( cast<string>( set ) );

		foreach ( string cube : set.SplitBy( "," ) ) {
			//print( "cube: " + cube );

			var spacePos = strfind( cube, " " );

			var value = cast<int>( substr( cube, 0, spacePos ) );
			var color = substr( cube, spacePos + 1, strlen( cube ) - spacePos );

			assign( color, value );
		}

		//print( toString() );
	}

	public void Constructor( int blue, int green, int red ) {
		Blue  = blue;
		Green = green;
		Red   = red;
	}

	public void assign( string color, int value ) modify throws {
		//print( color + " " + value );

		if ( color == BLUE ) {
			Blue = value;
		}
		else if ( color == GREEN ) {
			Green = value;
		}
		else if ( color == RED ) {
			Red = value;
		}
		else {
			throw "invalid color '" + color + "'!";
		}
	}

	public string toString() const {
		return "Blue: " + Blue + ", Green: " + Green + ", Red: " + Red;
	}

	public bool operator<( CubeSet other const ) const {
		return Blue < other.Blue && Green < other.Green && Red < other.Red;
	}

	public bool operator<=( CubeSet other const ) const {
		return Blue <= other.Blue && Green <= other.Green && Red <= other.Red;
	}
}

public object Game
{
	public int Id;
	public Vector<CubeSet> Sets;

	public static Game parse( String line ) {
		//print( cast<string>( line ) );

		// parse game id
		var colonPos = line.IndexOf( ":" );
		var id = line.SubString( 4, colonPos );

		// remove Game prefix
		line = line.SubString( colonPos + 2 );
		print( cast<string>( line ) );

		line.ReplaceAll( ", ", "," );

		// parse cube sets
		var sets = new Vector<CubeSet>();
		var str = new String();
		foreach ( string set : line.SplitBy( ";" ) ) {
			str = strtrim( set );

			var cube = new CubeSet();
			cube.parse( str );

			sets.push_back( cube );
		}

		return new Game( cast<int>( id ), sets );
	}

	public void Constructor( int id, Vector<CubeSet> sets ) {
		Id = id;
		Sets = sets;
	}

	public bool isValid( CubeSet compare ) const {
		foreach ( CubeSet set : Sets ) {
			//print( set.toString() );
			if ( !( set <= compare ) ) {
				return false;
			}
		}

		return true;
	}

	public int getPower() const {
		int maxRed;
		int maxGreen;
		int maxBlue;

		foreach (CubeSet set : Sets) {
			if (set.Red > maxRed) {
				maxRed = set.Red;
			}
			if (set.Green > maxGreen) {
				maxGreen = set.Green;
			}
			if (set.Blue > maxBlue) {
				maxBlue = set.Blue;
			}
		}

		return maxRed * maxGreen * maxBlue;
	}

	public string toString() const {
		return "ID: " + Id + ", Sets{" + Sets.size() + "}";
	}
}


public void Main( int argc, string args) modify {
	var file = new Scanner( "input" ).getText();

	int sumOfValidSetIndices;
	int sumOfSetPowers;
	var line = new String();
	var compareSet = new CubeSet(14, 13, 12);

	var str = new String( file );
	var listIt = str.SplitBy( LINEBREAK );
	while ( listIt.hasNext() ) {
		line = listIt.next();

		try {
			if ( line.Length() < 2 ) 
				break;

			var game = Game.parse( line );
			if ( game.isValid( compareSet ) ) {
				//print( game.toString() );

				sumOfValidSetIndices += game.Id;
			}

			var power = game.getPower();
			sumOfSetPowers += power;
		}
		catch ( string e ) {
			print( "Exception: " + e );
		}
	}

	print( "sumOfValidSetIndices: " + sumOfValidSetIndices );
	print( "sumOfSetPowers: " + sumOfSetPowers );
}

