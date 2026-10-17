class CrosshairPack extends Object
	abstract
	native
	cacheexempt;

struct native CrosshairItem
{
	var() localized string FriendlyName;
	var() Texture CrosshairTexture;
};

var() protected const cache array<cache CrosshairItem> Crosshair;

