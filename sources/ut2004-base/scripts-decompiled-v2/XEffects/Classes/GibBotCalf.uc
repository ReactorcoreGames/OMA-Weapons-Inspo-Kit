class GibBotCalf extends Gib
	notplaceable;

defaultproperties
{
	GibGroupClass=Class'XEffects.xBotGibGroup'
	TrailClass=Class'XEffects.BotSparks'
	HitSounds[0]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	HitSounds[1]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	DrawType=8
	StaticMesh=StaticMesh'XEffects.GibBotCalf'
	DrawScale=0.4000000
	Skins[0]=Texture'XEffects.GibBot'
	CollisionRadius=6.0000000
	CollisionHeight=3.0000000
}
