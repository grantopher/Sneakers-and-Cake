package;

import flash.display.Sprite;
import Game;

class Main extends Sprite {
	
	public function new() {
		super();
		var game = new Game();
		addChild(game);
	}
}