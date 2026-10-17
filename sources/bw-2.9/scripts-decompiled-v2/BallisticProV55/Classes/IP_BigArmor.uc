class IP_BigArmor extends ShieldPickup;

defaultproperties
{
	ShieldAmount=100
	InventoryType=Class'BallisticProV55.BallisticArmor'
	bPredictRespawns=true
	RespawnTime=60.0000000
	PickupMessage="You picked up heavy combat armor +"
	PickupSound=Sound'BW_Core_WeaponSound.Armor.BigArmorPickup'
	PickupForce="LargeShieldPickup"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Armor.BigArmor'
	DrawScale=0.5000000
	TransientSoundVolume=0.5000000
	TransientSoundRadius=64.0000000
	CollisionRadius=16.0000000
	CollisionHeight=20.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
