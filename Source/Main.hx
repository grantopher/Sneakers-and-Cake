package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import WallGenerator;
import OSTO;
import Runner;


class Main extends Sprite {

	public var wall_generator:WallGenerator;
	public var runner:Runner;
	public var osto:OSTO;
	
	public function new () {
		
		super ();

		wall_generator = new WallGenerator(); 	addChild(wall_generator);
		runner = new Runner();					addChild(runner);
		osto = new OSTO(); 						addChild(osto);

		addEventListener(Event.ENTER_FRAME, game_loop);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, action);

	}


	private function game_loop(e : Event) {
		if(runner.jumping) runner.move();
		shout(runner.get_v());
	}

	private function action( e : MouseEvent) {
		runner.jump();
	}



	public function shout(message : Dynamic, ?_type : Int) {
		message += "";
		if(_type == null) { _type = MsgType.DEF; }
		osto.reColor(_type);
		osto.text = message;
	}
	
}