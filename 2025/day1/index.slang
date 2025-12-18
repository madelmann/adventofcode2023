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
		var dir   = (substr( direction, 0, 1 ) == "L") ? -1 : 1;
		var count = cast<int>( substr( direction, 1, strlen( direction ) - 1 ) );

		Position += dir * count;

		if ( Position < 0 ) {
			Position += 100;
		}
		else if ( Position >= 100 ) {
			Position -= 100;
		}

		writeln( " => " + Position );

		if ( Position == 0 ) {
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
			write( str );
			dial.turn( str );
		}
	}

	print( "Final position " + dial.position() + " with " + dial.turnover() + " turnovers");
}

