package;

import flash.display.Sprite;
import flash.Lib;
import Wall;
import flash.events.EventDispatcher;
import flash.events.Event;
import Runner;
import Signal;

class WallGenerator extends Sprite {
	private var wall_holder:	Array <Dynamic>;
	private var size_range:		Int;
	private var wall_height:	Int;
	private var gen_width:		Int;
	private var screen_width:	Int;
	private var gap_size:		Int;

	private var char_right:		Int;
	private var char_left:		Int;

	public var next_wall:		Wall;
	private var wall_index:		Int;
	public var points:			Int;

	private var runner:			Runner;

	public var sunshine:		Signal;

	public function new(_runner: Runner) {
		super();

		init();

		runner = _runner;
		
		generate_walls(true);

		sunshine = new Signal();
		sunshine.shout('go');
	}

	private function init() {
		trace('putting together wall generator...');

		var stg_hgt  = Lib.stage.stageHeight;
		screen_width = Lib.stage.stageWidth;

		wall_holder = new Array();
		x 			= Lib.stage.stageWidth;
		size_range 	= Globals.WALL_MAX - Globals.WALL_MIN;
		wall_height = Std.int(stg_hgt * Globals.GROUND);
		gap_size 	= Std.int(stg_hgt * Globals.GAP_SIZE);
		char_right  = Std.int((screen_width / 2) + (Globals.RUNNER_SIZE / 2));
		char_left 	= Std.int((screen_width / 2) - (Globals.RUNNER_SIZE / 2));

		points = 0;
	}

	public function generate_walls(?_init:Bool) {
		trace('creating new walls...');

		gen_width 	 = (_init) ? 0 : find_width();
		var breaker			= 0;
		while(gen_width < screen_width + Globals.WALL_MAX) {
			gen_width += add_wall();
			breaker++;
			if(breaker > 15) break;  //to prevent infinite loops
		}
			trace('completed wall build...');
	}

	private function find_width() :Int {
		var wid = 0;
		var i 	= 0;

		while( i < wall_holder.length) {
			wid += Std.int(wall_holder[i].wall_w + Globals.WALL_SPACE);
			i++;
		}

		return wid;
	}

	private function add_wall() :Int {
		trace('adding wall...');

		var n_wall 	= new Wall(size_range, wall_height, gap_size);
		n_wall.x 	= gen_width + ((wall_holder[0] != null) ? wall_holder[0].left_x() : 0);

		addChild(n_wall);
		wall_holder.push(n_wall);

		return Std.int(n_wall.wall_width());
	}

	public function move() {
		x -= Globals.RUN_SPEED;
		if((wall_holder[0].right_x() + x) < 0) shift_walls();

		if(next_wall == null) next_wall = wall_holder[0];

		if((next_wall.right_x() + x) < char_left) score();
		
	}

	private function score() {
		points += 1;
		find_next_wall();
	}

	public function col_test() : Bool {
		var top_box = next_wall.get_top_box();
		var bot_box = next_wall.get_bot_box();
		if((next_wall.left_x() + x) < char_right && (next_wall.right_x() + x) > char_left) {
			if(runner.y < top_box || (runner.y + Globals.RUNNER_SIZE) > bot_box) return true;
		}
		return false;
	}

	private function shift_walls() {
		trace('removing first wall...');

		removeChild(wall_holder[0]);
		wall_holder.shift();
		
		generate_walls();
	}

	private function find_next_wall() {
		var w_h_len = wall_holder.length;
		for (p in 0...wall_holder.length) {
			var wall_in_qstn:Wall = wall_holder[p];
			if((wall_in_qstn.left_x() + x) > char_right){
				next_wall = wall_in_qstn;
				break;
			}
		}
	}
}