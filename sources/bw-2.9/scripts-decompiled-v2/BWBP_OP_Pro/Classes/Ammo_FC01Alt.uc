class Ammo_FC01Alt extends BallisticAmmo;

var FC01SmartGun Gun;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x2A
	if(super(Ammunition).HandlePickupQuery(Item))
	{
		// End:0x28
		if(Gun != none)
		{
			Gun.PhotonPickedUp();
		}
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	MaxAmmo=100
	InitialAmount=40
	IconFlashMaterial=Shader'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DBFlash'
	PickupClass=Class'BWBP_OP_Pro.AP_FC01Alt'
	IconMaterial=Texture'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DB'
	IconCoords=(X1=0,Y1=0,X2=63,Y2=63)
	ItemName="S1W Photon Rounds"
}
