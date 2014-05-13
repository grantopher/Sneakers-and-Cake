package;

import flash.Lib;
import flash.geom.Point;

class Globals {
	// runner variables ::

	public static var RUNNER_SIZE 		= .10;
	public static var RUN_SPEED 		= 10;
	public static var JUMP_VELOCITY 	= 22;

	// world variables ::

	public static var GRAV 				= 2;
	public static var GROUND 			= .66666;

	// wall variables ::

	public static var WALL_SPACE 		= 80;
	public static var WALL_MAX 			= 275;
	public static var WALL_MIN 			= 225;

	// gap variables :: 

	public static var GAP_SIZE 			= .32;

	public static var PAUSE:Point 		= new Point(.85,0);
	public static var OPTIONS:Point 	= new Point(.75,0);

	public static var BUTTON_WID		= .12;


	public static function get_runner_size() : Int {
		return Std.int(RUNNER_SIZE * Lib.stage.stageWidth);
	}

	public static function pause_btn() : Point {
		var r_x = Std.int(PAUSE.x * Lib.stage.stageWidth);
		var r_y = Std.int(PAUSE.y * Lib.stage.stageWidth);
		return new Point(r_x, r_y);
	}

	public static function get_dyn_var(variable : Float, wid_or_hght : Bool) : Int return Std.int(variable * ((wid_or_hght) ? Lib.stage.stageWidth : Lib.stage.stageHeight));


	public static function get_dyn_pnt(point : Point) : Point {
		return new Point(get_dyn_var(point.x, true), get_dyn_var(point.y, false));
	}

}