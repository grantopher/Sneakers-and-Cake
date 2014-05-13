package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.Lib;
import WallGenerator;
import OSTO;
import Runner;
import Button;


class Game extends Sprite {

	public var wall_generator:	WallGenerator;
	public var runner:			Runner;
	public var osto:			OSTO;

	public var pause: 			Bool;
	private var pause_btn:		Button;
	private var options_btn: 	Button;
	
	public function new () {
		
		super ();

		
		runner 			= new Runner();							addChild(runner);
		wall_generator 	= new WallGenerator(runner); 			addChild(wall_generator);
		osto 			= new OSTO(); 							addChild(osto);
		var p_btn_coor  = Globals.get_dyn_pnt(Globals.PAUSE);
		var opt_btn_coor= Globals.get_dyn_pnt(Globals.OPTIONS);
		pause_btn 		= new Button('pause', p_btn_coor);		addChild(pause_btn);
		options_btn		= new Button('options', opt_btn_coor); 	addChild(options_btn);

		Lib.stage.addEventListener(MouseEvent.MOUSE_DOWN, start_game);

		addEventListener('pause', pause_game);
		addEventListener('options', open_options);
		
	}

	private function loaded(e: Event) {
		trace('custom event is working');
	}

	private function start_game(e : Event) {
		pause = false;
		Lib.stage.removeEventListener(MouseEvent.MOUSE_DOWN, start_game);
		trace('starting_game');
		addEventListener(Event.ENTER_FRAME, game_loop);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, action);
		// stage.addEventListener(MouseEvent.MOUSE_MOVE, mouse_move);
	}

	// private function mouse_move(e : MouseEvent) {
	// 	shout(e.stageX+":"+e.stageY+"_"+(runner.x + runner.width));
	// }

	private function game_loop(e : Event) {
		shout(runner.width + "_" + runner.height);
		if(!pause){
			if(runner.jumping) runner.move();
			wall_generator.move(runner.get_bounds());
			switch(wall_generator.col_test(runner.get_bounds())) {
				case 1 : e.currentTarget.dispatchEvent(new Event('restart_game', true));
				case 2 : trace('what?');
			}
			runner.anim();
		}
	}

	private function action( e : MouseEvent) {
		if(!pause){
			if(e.shiftKey) pause_game();
			else runner.jump();
		}
	}

	private function pause_game(?e : Event) {
		pause = (pause) ? false : true;
	}
	public function shout(message : Dynamic, ?_type : Int) {
		message += "";
		if(_type == null) _type = MsgType.DEF;
		osto.reColor(_type);
		osto.text = message;
	}
	

	private function open_options( e : Event) {
		pause_game();
	}
}