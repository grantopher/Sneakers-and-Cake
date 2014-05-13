package;

import flash.display.Sprite;
import flash.events.Event;
import Game;

class Main extends Sprite {

	private var game:Game;
	
	public function new() {
		super();
		game = new Game();
		addChild(game);

		addEventListener('restart_game', restart);
	}

	private function restart(e : Event) {
		removeChild(game);
		game = new Game();
		addChild(game);
	}
}