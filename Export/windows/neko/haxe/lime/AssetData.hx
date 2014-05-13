package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/512px-Cog_font_awesome.svg.png", "assets/512px-Cog_font_awesome.svg.png");
			type.set ("assets/512px-Cog_font_awesome.svg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/character.png", "assets/character.png");
			type.set ("assets/character.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/character.sprites", "assets/character.sprites");
			type.set ("assets/character.sprites", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/options.png", "assets/options.png");
			type.set ("assets/options.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/pause.gif", "assets/pause.gif");
			type.set ("assets/pause.gif", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/pause.png", "assets/pause.png");
			type.set ("assets/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/pixelated.ttf", "assets/pixelated.ttf");
			type.set ("assets/pixelated.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/pulp-fiction-star-wars.jpg", "assets/pulp-fiction-star-wars.jpg");
			type.set ("assets/pulp-fiction-star-wars.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/runner.anim", "assets/runner.anim");
			type.set ("assets/runner.anim", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/runner.ass", "assets/runner.ass");
			type.set ("assets/runner.ass", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/runner_sprite.png", "assets/runner_sprite.png");
			type.set ("assets/runner_sprite.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/star wars awesome.jpg", "assets/star wars awesome.jpg");
			type.set ("assets/star wars awesome.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
