class M46Attachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xD7
	if((Instigator != none) && Instigator.IsFirstPerson())
	{
		// End:0xBB
		if(BallisticWeapon(Instigator.Weapon).bScopeView && int(BallisticWeapon(Instigator.Weapon).ZoomType) != int(0))
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			return Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		return GetBoneCoords('tip').Origin;
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_M46AR'
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9750000
	CockAnimRate=0.9250000
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M46A1_TPm'
	DrawScale=0.2750000
}
