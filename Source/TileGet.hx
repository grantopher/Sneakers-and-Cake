package;

import openfl.Assets;
import haxe.Json;
import flash.geom.Rectangle;
import flash.geom.Point;

class TileGet {

	public static function loadAnimation(animation_name:String) {
		var filename = "assets/" + animation_name + ".ass";
		var string = Assets.getText(filename);
		try {
			var json 		= Json.parse(string);
			var animations 	= json.animations;
			json.animations[0]; // << frames need to be initialized before I can access the array length;
			var anim_list 	= new Array();
			for(a in 0...animations.length){
				var frame_list:Array <Dynamic> = new Array();
				json.animations[a].frames[0]; // << frames need to be initialized before I can access the array length;

				for(f in 0...animations[a].frames.length) {
					var frames 		= animations[a].frames;
					var reference 	= frames[f].r_point;
					var ref_point 	= new Point(reference.ref_x, reference.ref_y);
					frame_list.push([new Rectangle(frames[f].x, frames[f].y, frames[f].width, frames[f].height), frames[f].dur, ref_point]);
				}
				anim_list.push([animations[a].name, frame_list, animations[a].loops]);
			}
			return anim_list;

			} catch (msg: String){
				trace("error loading file: " + filename);
				return null;
			}
		}

	}
	// hello my name is ej and i commend you to work in the name of Jesus!!! ok? ok! :]
	// so this game is amazing and will show the world how a kingdom business can be the best business in the planet. Jesus is here and teaching us so much and building us up
	// 5 - 10 - 14 --Ej Wall