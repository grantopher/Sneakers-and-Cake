package;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import openfl.Assets;

class Button extends Sprite {
	
	private var bg_image:Bitmap;
	private var event_name:String;

	public function new(graphic_loc : String, loc : Point) {
		super();
		bg_image 		= new Bitmap(Assets.getBitmapData('assets/' + graphic_loc + '.png'));
		var g_wid 		= Globals.get_dyn_var(Globals.BUTTON_WID, true);
		bg_image.width 	= g_wid;
		bg_image.height = g_wid;
		x 				= loc.x;
		y 				= loc.y;
		addChild(bg_image);

		event_name 		= graphic_loc;
		addEventListener(MouseEvent.MOUSE_DOWN, clicked);
	}

	private function clicked(e : MouseEvent) {
		var click_event = new Event(event_name, true);
		e.currentTarget.dispatchEvent(click_event);
	}
}