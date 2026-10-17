class VSKAttachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;
	local Vector X, Y, Z;

	// End:0xAB
	if(Instigator.IsFirstPerson())
	{
		// End:0x85
		if(VSKTranqRifle(Instigator.Weapon).bScopeView)
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
	WeaponClass=Class'BWBP_SKC_Pro.VSKTranqRifle'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Tranq'
	FlashScale=0.3000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_Tranq'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Tranq'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9650000
	CockAnimRate=0.8000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.VSKS_TPm'
	RelativeLocation=(X=5.0000000,Y=0.0000000,Z=3.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.0000000
}
