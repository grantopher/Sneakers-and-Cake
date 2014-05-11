package;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.geom.Rectangle;

class Wall extends Sprite {
		private var wall_w:		Int;
		private var wall_height:Int;
		private var top_wall:	Int;
		private var bot_wall:	Int;

	public function new(_range, _height, _gap) {
		super();

		wall_w = Std.int((Math.random() * _range) + Globals.WALL_MIN);
		top_wall = Std.int((_height - _gap)/2);
		graphics.beginFill(0x000000);
		graphics.drawRect(0,0,wall_w, top_wall);

		graphics.drawRect(0, top_wall+_gap,wall_w, _height - top_wall - _gap );
		bot_wall = Std.int(top_wall + _gap);
	}
	
	public function wall_width() : Int {
		return Std.int(wall_w + Globals.WALL_SPACE);
	}

	public function right_x() : Int 	return Std.int(x + wall_w);
	public function left_x() : Int 		return Std.int(x);
	public function wid() : Int 		return Std.int(width);
	public function get_top_box() :Int 	return top_wall;
	public function get_bot_box() :Int  return bot_wall;
}