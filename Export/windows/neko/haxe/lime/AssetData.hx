package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/pixelated.ttf", "assets/pixelated.ttf");
			type.set ("assets/pixelated.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/run.ass", "assets/run.ass");
			type.set ("assets/run.ass", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/runner_sprite.png", "assets/runner_sprite.png");
			type.set ("assets/runner_sprite.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
