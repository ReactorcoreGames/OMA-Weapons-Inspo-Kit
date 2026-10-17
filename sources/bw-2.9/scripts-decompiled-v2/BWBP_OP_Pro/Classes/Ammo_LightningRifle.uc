class Ammo_LightningRifle extends BallisticAmmo;

defaultproperties
{
	MaxAmmo=40
	InitialAmount=20
	bTryHeadShot=true
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BWBP_OP_Pro.AP_LightningClip'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=64,Y1=64,X2=127,Y2=127)
	ItemName=".42 Rifle Rounds"
}
