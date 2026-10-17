class KF8XAttachment extends BallisticAttachment;

const FadeRate = 2;

var byte DestAlpha;
var byte CurAlpha;
var array<Material> OriginalSkins;
var array<Material> Fades;
var bool bTransparencyInitialized;
var bool bTransparencyOn;
var byte CurFade;
var byte lastFade;
var byte Penalty;
var float nextCheckTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		DestAlpha;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		CurAlpha;
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;
	local Vector X, Y, Z;

	// End:0xAB
	if(Instigator.IsFirstPerson())
	{
		// End:0x85
		if(BallisticWeapon(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			C = Instigator.Weapon.GetBoneCoords('tip');
		}		
	}
	else
	{
		C = GetBoneCoords('tip');
	}
	return C.Origin;
	//return;	
}

defaultproperties
{
	Fades[0]=Texture'BW_Core_WeaponTex.Icons.stealth_8'
	Fades[1]=Texture'BW_Core_WeaponTex.Icons.stealth_16'
	Fades[2]=Texture'BW_Core_WeaponTex.Icons.stealth_24'
	Fades[3]=Texture'BW_Core_WeaponTex.Icons.stealth_32'
	Fades[4]=Texture'BW_Core_WeaponTex.Icons.stealth_40'
	Fades[5]=Texture'BW_Core_WeaponTex.Icons.stealth_48'
	Fades[6]=Texture'BW_Core_WeaponTex.Icons.stealth_56'
	Fades[7]=Texture'BW_Core_WeaponTex.Icons.stealth_64'
	Fades[8]=Texture'BW_Core_WeaponTex.Icons.stealth_72'
	Fades[9]=Texture'BW_Core_WeaponTex.Icons.stealth_80'
	Fades[10]=Texture'BW_Core_WeaponTex.Icons.stealth_88'
	Fades[11]=Texture'BW_Core_WeaponTex.Icons.stealth_96'
	Fades[12]=Texture'BW_Core_WeaponTex.Icons.stealth_104'
	Fades[13]=Texture'BW_Core_WeaponTex.Icons.stealth_112'
	Fades[14]=Texture'BW_Core_WeaponTex.Icons.stealth_120'
	Fades[15]=Texture'BW_Core_WeaponTex.Icons.stealth_128'
	WeaponClass=Class'BWBP_OP_Pro.KF8XCrossbow'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="None"
	FlashMode=3
	LightMode=3
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_KF8XCrossbow'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.2750000
	CockAnimRate=1.4000000
	SingleFireAnim="RifleHip_FireCock"
	SingleAimedFireAnim="RifleAimed_FireCock"
	Mesh=SkeletalMesh'BWBP_OP_Anim.KF8X_TPm'
	DrawScale=1.0000000
	Skins[0]=Shader'BWBP_OP_Tex.XBow.XBow_SH1'
}
