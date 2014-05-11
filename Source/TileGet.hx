package;

import openfl.Assets;
import haxe.Json;
import flash.geom.Rectangle;

class TileGet {

	public static function loadAnimation(animation_name:String) {
		var filename = "assets/" + animation_name + ".ass";
		var string = Assets.getText(filename);
		try {
			var json 		= Json.parse(string);
			var animations 	= json.animations;
			json.animations[0]; // << frames need to be initialized before I can access the array length;
			var anim_list = new Array();
			for(a in 0...animations.length){
				var frame_list = new Array();
				json.animations[a].frames[0];
				for(f in 0...animations[a].frames.length) {
					var frames = animations[a].frames;
					frame_list.push([new Rectangle(frames[f].x, frames[f].y, frames[f].width, frames[f].height), frames[f].duration]);
				}
				anim_list.push([animations[a].name, frame_list]);
			}
			return anim_list;

			} catch (msg: String){
				trace("error loading file: " + filename);
				return null;
			}
		}

	}