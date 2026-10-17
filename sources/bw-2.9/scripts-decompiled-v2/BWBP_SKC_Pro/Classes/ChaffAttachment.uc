class ChaffAttachment extends BallisticGrenadeAttachment;

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

simulated event ThirdPersonEffects()
{
	// End:0x53
	if(int(FiringMode) == 0)
	{
		// End:0x31
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			PlayPawnFiring(FiringMode);
		}
		// End:0x50
		if(GrenadeSmoke != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.StopParticles(GrenadeSmoke);
		}		
	}
	else
	{
		// End:0x8A
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
		{
			MeleeFireEffects();
			PlayPawnFiring(FiringMode);
		}
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x41
	if(((int(Level.NetMode) == int(NM_DedicatedServer)) || Instigator == none) || mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x138
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xFB
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0x11F
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
	// End:0x18A
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x1B8
	if(MeleeImpactManager != none)
	{
		MeleeImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

defaultproperties
{
	ExplodeManager=Class'BWBP_SKC_Pro.IM_ChaffGrenade'
	GrenadeSmokeClass=Class'BWBP_SKC_Pro.ChaffTrail'
	WeaponClass=Class'BWBP_SKC_Pro.ChaffGrenadeWeapon'
	ImpactManager=Class'BallisticProV55.IM_Katana'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	InstantMode=1
	TrackAnimMode=0
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MOAC_TPm'
	RelativeLocation=(X=-2.0000000,Y=-3.0000000,Z=20.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.6500000
}
