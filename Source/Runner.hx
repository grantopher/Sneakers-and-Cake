package;

import flash.display.Sprite;
import flash.Lib;
import Globals;

class Runner extends Sprite {
		var r_width:Int;
		var r_speed:Int;
	
	public function new() {
		super();
		get_globals();
		place_runner();
		build_runner();
	}

	private function get_globals() {
		r_width = RUNNER_SIZE;
		r_speed = RUN_SPEED;
	}

	private function place_runner() {
		x = Lib.stage.stageWidth/2 - 25;
		y = Lib.stage.stageHeight/2;
	}

	private function build_runner() {
		graphics.beginFill(0x112233);
		graphics.drawRect(0,0,50,50);

	}
}