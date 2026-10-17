class BallisticCrosshairpack extends Object;

struct BWCrosshair
{
	var() config string FriendlyName;
	var() config Material Image;
	var() config int USize;
	var() config int VSize;
};

var() array<BWCrosshair> Crosshairs;

