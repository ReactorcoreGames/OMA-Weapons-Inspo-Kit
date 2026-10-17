class RaygunAttachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	// End:0x60
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetEffectStart();
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlash'
	AltMuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlashAlt'
	ImpactManager=Class'BWBP_OP_Pro.IM_Raygun'
	FlashScale=2.0000000
	BrassMode=3
	TracerMode=1
	InstantMode=1
	FlashMode=2
	LightMode=1
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_Raygun'
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.9000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.Raygun_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=7.0000000)
	DrawScale=0.3500000
	SoundRadius=256.0000000
}
