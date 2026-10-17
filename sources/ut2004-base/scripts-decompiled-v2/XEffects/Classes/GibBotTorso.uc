class GibBotTorso extends Gib
	notplaceable;

defaultproperties
{
	GibGroupClass=Class'XEffects.xBotGibGroup'
	TrailClass=Class'XEffects.BotSparks'
	HitSounds[0]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	HitSounds[1]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	DrawType=8
	StaticMesh=StaticMesh'XEffects.GibBotTorso'
	DrawScale=0.5000000
	Skins[0]=Texture'XEffects.GibBot'
	CollisionRadius=8.0000000
	CollisionHeight=8.0000000
}
