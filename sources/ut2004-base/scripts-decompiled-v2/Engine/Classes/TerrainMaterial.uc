class TerrainMaterial extends RenderedMaterial
	native
	collapsecategories
	safereplace
	hidecategories(Object);

struct native TerrainMaterialLayer
{
	var Material Texture;
	var BitmapMaterial AlphaWeight;
	var Matrix TextureMatrix;
};

var const array<TerrainMaterialLayer> Layers;
var const byte RenderMethod;
var const bool FirstPass;

defaultproperties
{
	MaterialType=256
}
