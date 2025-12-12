#!/usr/bin/env webscript

// library imports
import FileReader.Scanner;
import System.String;

// project imports



public object Dial
{
	public void Constructor( int startPos )
	{
		Position = startPos;
	}

	public int position() const
	{
		return Position;
	}

	public void turn( string direction ) modify {
		var dir   = (substr( direction, 1 ) == "L") ? -1 : 1;
		var count = cast<int>( substr( direction, 1, strlen( direction ) - 2 ) );

		Position += dir * count;
		if ( Position > 99 ) {
			Position -= 99;
			TurnOver++;
		}
		else if ( Position < 0 ) {
			Position += 99;
			TurnOver++;
		}
	}

	public int turnover() const {
		return TurnOver;
	}

	private int Position;
	private int TurnOver;
}

public void Main( int, string )
{
	var input = new String( new Scanner( "input" ).getText() );
	//print( cast<string>( input ) );

	var dial = new Dial( 50 );
	foreach ( string str : input.SplitBy( LINEBREAK ) ) {
		if ( str ) {
			print( str );
			dial.turn( str );
		}
	}

	print( "Dial.Position: " + dial.position() );
	print( "Dial.TurnOver: " + dial.turnover() );
}

