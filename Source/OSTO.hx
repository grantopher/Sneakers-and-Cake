package;

import flash.text.TextField;
import flash.text.TextFormat;

class OSTO extends TextField {

	private var format:TextFormat;

	public function new() {
		super();
		this.x = 0;
		this.y = 0;

	
	}

	public function reColor(color : Int ) {
		format = new TextFormat();
		format.color = color;
		defaultTextFormat = format;
	}
	
}

class MsgType {
	public static var ERR:Int = 0xFF0000;
	public static var WARN:Int = 0xFFFF00;
	public static var INFO:Int = 0x0000DD;
	public static var GOOD:Int = 0x00DD00;
	public static var DEF:Int = 0x000000;
}