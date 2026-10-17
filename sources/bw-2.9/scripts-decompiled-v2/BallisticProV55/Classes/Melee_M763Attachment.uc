class Melee_M763Attachment extends M763Attachment;

simulated function InstantFireEffects(byte Mode)
{
	MeleeFireEffects();
	//return;	
}

defaultproperties
{
	BrassMode=3
	FlashMode=3
	LightMode=3
}
