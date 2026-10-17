class CryoLanceLauncherAttatchment extends BallisticAttachment;

var Vector SpawnOffset;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z, loc;

	// End:0xBF
	if(Instigator.IsFirstPerson())
	{
		// End:0x9E
		if(CryoLanceLauncher(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			loc = ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-10));			
		}
		else
		{
			loc = Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	return loc;
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.CryoLanceLauncher'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.2500000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9000000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.CryoCannon_TPm'
	RelativeLocation=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	DrawScale=1.0000000
}
