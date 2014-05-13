package;

import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.Lib;
import Globals;
import Animation;
import TileGet;

class Runner extends Sprite {
	var r_width:		Int;
	var r_speed:		Int;
	var y_velocity:		Int;
	public var jumping:	Bool;
	var double_jumping:	Bool;
	var ground_y:		Int;
	var pause:			Bool;
	var animation:		Animation;

	
	public function new() {
		super();
		get_globals();
		place_runner();
		draw_runner();
	}

	private function get_globals() {
		r_width 	= Globals.get_runner_size();	jumping 		= false;
		r_speed 	= Globals.RUN_SPEED;	double_jumping 	= false;
		ground_y 	= Std.int(Lib.stage.stageHeight * Globals.GROUND);
		pause 		= false;
		var anim_f  = TileGet.loadAnimation('runner');
		animation 	= new Animation("runner_sprite.png", anim_f, Globals.get_runner_size());
	}

	private function place_runner() {
		x = (Lib.stage.stageWidth / 2);
		y = ground_y;
	}

	private function draw_runner() {
		animation.draw_current_tile(graphics);

		var loc 	= animation.current_tile_loc();
		var scale 	= animation.scale;

		graphics.beginFill(0x00FF00, .5);
		graphics.drawRect(loc.x*scale,loc.y*scale,width*scale,height*scale);
	}

	public function jump() {
		if(!double_jumping) {
			if(!jumping) {
				jumping = true;
				
			}
			else double_jumping  = true;
			y_velocity 			 = Globals.JUMP_VELOCITY;
			animation.switch_animation(1);
		}
	}

	public function move() {
		if(!pause){
			if(y_velocity > 0) 	y 	-= y_velocity;
			else if(!col_test()) y 	-= y_velocity;
			y_velocity 	 			-= Globals.GRAV;
		}
	}
	public function anim() {
		draw_runner();
	}

	public function pause_runner() pause = (pause) ? false : true;

	private function col_test () :Bool {
		var test_point = r_width + (-y_velocity) + y;
		if(test_point > ground_y){
			y = ground_y;
			reset_jump();
			return true;
		}
		return false;
	}

	public function reset_jump() {
		jumping = false; double_jumping = false;
		animation.switch_animation(0);
	}


	public function get_v() :Int return y_velocity;

	public function get_bounds() : Rectangle {
		var loc 	= animation.current_tile_loc();
		var scale 	= animation.scale;
		var b_x 	= (loc.x * scale) + x;
		var b_y 	= (loc.y * scale) + y;
		var b_w 	= (width);
		var b_h 	= (height);

		return new Rectangle(b_x, b_y, b_w, b_h);
	} 
}