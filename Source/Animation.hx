package;

import openfl.display.Tilesheet;
import flash.display.BitmapData;
import flash.display.Graphics;
import flash.geom.Rectangle;
import openfl.Assets;

class Animation extends Tilesheet {

	public var frame_max:		Int;
	public var current_frame:	Int;
	public var animation_list: 	Array <Tileset>;

	private var current_anim: 	Tileset;

	public function new(imageLocation: String, frame_list : Array <Dynamic>) {
		var inImage 	= Assets.getBitmapData('assets/' + imageLocation);
		super(inImage);

		animation_list 	= new Array();
		for(a in 0...frame_list.length) {
			animation_list.push(new Tileset(frame_list[a][0], add_frame_set(frame_list[a][1])));
		}

		current_anim 	= animation_list[0];

	}

	public function add_frame_set(frame_list : Array <Dynamic>) {
		var tile_array = new Array();
		trace(frame_list);	
		for(f in 0...frame_list.length) {
			var tile = frame_list[f][0];
			tile_array.push([addTileRect(tile), frame_list[f][1]]);
		}

		return tile_array;
	}

	public function draw_current_tile(_draw_area : Graphics){
		_draw_area.clear();
		drawTiles(_draw_area, [0,0,current_anim.get_next_frame()]);
	}
	
}

class Tileset {
	public var name:			String;
	public var tiles: 			Array <Dynamic>;

	private var current_frame: 	Int;
	private var frame_timer: 	Int;

	public function new(_name : String, tile_array : Array <Dynamic>) {
		name 		= _name;
		tiles 		= tile_array;
		frame_timer = 0;
		trace(tiles);
	}

	public function get_next_frame() : Int {
		return 0;
		if(current_frame == null) current_frame = 0;
		trace(tiles[current_frame][1]);
		if(frame_timer < tiles[current_frame][1]) frame_timer++;
		else {
			current_frame++; frame_timer = 0;
			if(current_frame >= tiles.length) current_frame = 0;
		}
		return tiles[current_frame][0];
	}
}