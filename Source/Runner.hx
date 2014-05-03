package;

import flash.display.Sprite;
import flash.Lib;
import Globals;

class Runner extends Sprite {
	var r_width:Int;
	var r_speed:Int;
	var y_velocity:Int;
	public var jumping:Bool;
	var double_jumping:Bool;
	var ground_y:Int;
	
	public function new() {
		super();
		get_globals();
		place_runner();
		build_runner();
	}

	private function get_globals() {
		r_width = Globals.RUNNER_SIZE;		jumping = false;
		r_speed = Globals.RUN_SPEED;		double_jumping = false;
		ground_y = Std.int(Lib.stage.stageHeight * Globals.GROUND) - r_width;
	}

	private function place_runner() {
		x = Lib.stage.stageWidth/2 - 25;
		y = ground_y;
	}

	private function build_runner() {
		graphics.beginFill(0x112233);
		graphics.drawRect(0,0,50,50);

	}




	public function jump() {
		if(!double_jumping) {
			if(!jumping) jumping = true;
			else double_jumping = true;
			y_velocity = Globals.JUMP_VELOCITY;
		}
	}

	public function move() {
		if(y_velocity > 0) 	y -= y_velocity;
		else if(!col_test()) y -= y_velocity;
		y_velocity -= Globals.GRAV;
	}

	private function col_test () :Bool {
		var test_point = r_width + (-y_velocity) + y;
		if(test_point > ground_y){
			y = ground_y;
			reset_jump();
			return true;
		}
		return false;
	}

	private function reset_jump() {
		jumping = false; double_jumping = false;
	}


	public function get_v() :Int return y_velocity;
}