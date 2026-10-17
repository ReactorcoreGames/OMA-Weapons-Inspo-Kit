class GibBotHand extends Gib
	notplaceable;

defaultproperties
{
	GibGroupClass=Class'XEffects.xBotGibGroup'
	TrailClass=Class'XEffects.BotSparks'
	HitSounds[0]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	HitSounds[1]=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	DrawType=8
	StaticMesh=StaticMesh'XEffects.GibBotHand'
	DrawScale=0.6500000
	Skins[0]=Texture'XEffects.GibBot'
	CollisionRadius=4.0000000
	CollisionHeight=1.5000000
}
