class MRDRAttachment extends HandgunAttachment;

simulated function InstantFireEffects(byte Mode)
{
	// End:0x16
	if(int(FiringMode) != 0)
	{
		MeleeFireEffects();		
	}
	else
	{
		super(BallisticAttachment).InstantFireEffects(FiringMode);
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x110
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xD3
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0xF7
		if(HitMat == none)
		{
			mHitSurf = int(mHitActor.SurfaceType);			
		}
		else
		{
			mHitSurf = int(HitMat.SurfaceType);
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x162
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	Class'BallisticProV55.IM_GunHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.MRDRMachinePistol'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	TrackAnimMode=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerChance=0.5000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=1.2500000
	CockAnimRate=0.8000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MRDR_TPm'
	RelativeLocation=(X=-3.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.1400000
}
