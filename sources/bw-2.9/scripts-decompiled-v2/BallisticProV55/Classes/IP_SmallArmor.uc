class IP_SmallArmor extends ShieldPickup;

var() StaticMesh AlternateMesh;

simulated function PostBeginPlay()
{
	// End:0x17
	if(FRand() > 0.5000000)
	{
		SetStaticMesh(AlternateMesh);
	}
	super(Actor).PostBeginPlay();
	//return;	
}

defaultproperties
{
	AlternateMesh=StaticMesh'BW_Core_WeaponStatic.Armor.SmallArmor2'
	ShieldAmount=50
	MaxDesireability=1.0000000
	InventoryType=Class'BallisticProV55.BallisticArmor'
	bPredictRespawns=true
	PickupMessage="You picked up a vest and helmet +"
	PickupSound=Sound'BW_Core_WeaponSound.Armor.LightArmorPickup'
	PickupForce="ShieldPack"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Armor.SmallArmor'
	DrawScale=0.5000000
	TransientSoundVolume=0.5000000
	TransientSoundRadius=64.0000000
	CollisionRadius=16.0000000
	CollisionHeight=18.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
