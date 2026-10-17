class GibBotHead extends GibHead
	notplaceable;

defaultproperties
{
	GibGroupClass=Class'XEffects.xBotGibGroup'
	TrailClass=Class'XEffects.BotSparks'
	HitSounds[0]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	HitSounds[1]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	DrawType=8
	StaticMesh=StaticMesh'XEffects.GibBotHead'
	DrawScale=0.6000000
	Skins[0]=Texture'XEffects.GibBot'
	CollisionRadius=5.0000000
	CollisionHeight=2.5000000
}
