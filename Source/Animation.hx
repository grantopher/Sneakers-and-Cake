package;

import openfl.display.Tilesheet;
import flash.display.BitmapData;
import flash.display.Graphics;
import flash.geom.Rectangle;
import flash.geom.Point;
import openfl.Assets;

class Animation extends Tilesheet {

	public var frame_max:		Int;
	public var current_frame:	Int;
	public var animation_list: 	Array <Tileset>;

	private var current_anim: 	Tileset;

	public var scale:			Int;

	public function new(imageLocation: String, frame_list : Array <Dynamic>, _size : Int) {
		var inImage 	= Assets.getBitmapData('assets/' + imageLocation);
		super(inImage);

		animation_list 	= new Array();
		for(a in 0...frame_list.length) {
			animation_list.push(new Tileset(frame_list[a][0], add_frame_set(frame_list[a][1]), frame_list[a][2]));
		}

		current_anim 	= animation_list[0];

		find_scale(_size, frame_list);

	}

	public function add_frame_set(frame_list : Array <Dynamic>) {
		var tile_array = new Array();
		for(f in 0...frame_list.length) {
			var tile = frame_list[f][0];
			tile_array.push([addTileRect(tile, frame_list[f][2]), frame_list[f][1]]);
		}

		return tile_array;
	}

	public function draw_current_tile(_draw_area : Graphics){
		_draw_area.clear();
		var frm = current_anim.get_next_frame();
		drawTiles(_draw_area, [0,0,frm, scale], Tilesheet.TILE_SCALE);
	}
	
	public function switch_animation(index : Int) {
		current_anim = animation_list[index];
		current_anim.reset();
	}

	private function find_scale(_size : Int, frame_list : Array <Dynamic>) {
		var cur_size = frame_list[0][1][0][0].height;
		scale = Std.int(_size / cur_size);
	}

	public function current_tile_loc() : Point {
		var cur_f 		= current_anim.get_current_frame();

		var tile_center = getTileCenter(cur_f);
		var tile_rect 	= getTileRect(cur_f);

		var n_x 		= -(tile_center.x * tile_rect.width);
		var n_y 		= -(tile_center.y * tile_rect.height);

		return new Point(n_x, n_y);
	};
}

class Tileset {
	public var name:			String;
	public var tiles: 			Array <Dynamic>;

	private var current_frame: 	Int;
	private var frame_timer: 	Int;
	private var loops:			Bool;

	public function new(_name : String, tile_array : Array <Dynamic>, _loops : Bool) {
		name 		= _name;
		tiles 		= tile_array;
		frame_timer = 0;
		loops 		= _loops;
		trace(_loops);
	}

	public function get_next_frame() : Int {
		if(current_frame == null) current_frame = 0;
		if(frame_timer < tiles[current_frame][1]) frame_timer++;
		else {
			if(current_frame + 1 >= tiles.length) {
				current_frame = (loops) ? 0 : current_frame;
			}
			else current_frame++; frame_timer = 0;
		}
		return tiles[current_frame][0];
	}

	public function reset() {
		current_frame 	= 0;
		frame_timer 	= 0;
	}

	public function get_current_frame() : Int return tiles[current_frame][0];
}