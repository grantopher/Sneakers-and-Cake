package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import WallGenerator;
import OSTO;
import Runner;


class Game extends Sprite {

	public var wall_generator:	WallGenerator;
	public var runner:			Runner;
	public var osto:			OSTO;

	public var pause: 			Bool;
	
	public function new () {
		
		super ();

		addEventListener('go', loaded);
		runner = new Runner();					addChild(runner);
		wall_generator = new WallGenerator(runner); 	addChild(wall_generator);
		osto = new OSTO(); 						addChild(osto);

		addEventListener(MouseEvent.MOUSE_DOWN, start_game);
		
	}

	private function loaded(e: Event) {
		trace('custom event is working');
	}

	private function start_game(e : Event) {
		pause = false;
		removeEventListener(MouseEvent.MOUSE_DOWN, start_game);
		trace('starting_game');
		addEventListener(Event.ENTER_FRAME, game_loop);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, action);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, mouse_move);
	}

	private function mouse_move(e : MouseEvent) {
		shout(e.stageX+":"+e.stageY+"_"+(runner.x + runner.width));
	}

	private function game_loop(e : Event) {
		if(!pause){
			if(runner.jumping) runner.move();
			wall_generator.move();
			if(wall_generator.col_test()) pause_game();
		}
	}

	private function action( e : MouseEvent) {
		if(e.shiftKey) pause_game();
		else runner.jump();
	}

	private function pause_game() {
		pause = (pause) ? false : true;
	}

	public function shout(message : Dynamic, ?_type : Int) {
		message += "";
		if(_type == null) _type = MsgType.DEF;
		osto.reColor(_type);
		osto.text = message;
	}
	
}