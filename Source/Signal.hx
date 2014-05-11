package;

import flash.events.EventDispatcher;
import flash.events.Event;

class Signal extends EventDispatcher {
	
	public function new() {
	super();
	}

	public function shout(event : String) {
		this.dispatchEvent(new Event(event, true));
	}
}