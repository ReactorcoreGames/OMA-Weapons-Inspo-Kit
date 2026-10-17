class SniperWallHitEffect extends Effects;

var Sound ImpactSounds[6];
var Vector FireStart;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		FireStart;
}

simulated function SpawnEffects()
{
	local Rotator ReverseRot;
	local PlayerController PC;
	local Vector Dir, LinePos, LineDir;
	local bool bViewed;

	PlaySound(ImpactSounds[Rand(6)],, 2.5000000 * TransientSoundVolume,, 200.0000000);
	PC = Level.GetLocalPlayerController();
	// End:0xA4
	if(((PC != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < (float(3000) * PC.FOVBias))
	{
		Spawn(Class'UTClassic.LongBulletDecal');
		bViewed = true;
	}
	// End:0xF9
	if(!PhysicsVolume.bWaterVolume)
	{
		ReverseRot = Rotator(float(-1) * Vector(Rotation));
		// End:0xE9
		if(bViewed)
		{
			Spawn(Class'XEffects.pclImpactSmoke',,,, ReverseRot);
		}
		Spawn(Class'XEffects.WallSparks',,,, ReverseRot);
	}
	// End:0x1E9
	if(FireStart != vect(0.0000000, 0.0000000, 0.0000000))
	{
		// End:0x1E9
		if((PC != none) && PC.Pawn != none)
		{
			Dir = Normal(Location - FireStart);
			LinePos = FireStart + ((Dir Dot (PC.Pawn.Location - FireStart)) * Dir);
			LineDir = PC.Pawn.Location - LinePos;
			// End:0x1E9
			if(VSize(LineDir) < float(150))
			{
				SetLocation(LinePos);
				// End:0x1D9
				if(FRand() < 0.5000000)
				{
					PlaySound(Sound'XEffects.Impact3Snd',,,, 80.0000000);					
				}
				else
				{
					PlaySound(Sound'XEffects.Impact7Snd',,,, 80.0000000);
				}
			}
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x23
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x23
		if(Instigator != none)
		{
			MakeNoise(0.5000000);
		}
	}
	// End:0x4B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SpawnEffects();
		SetTimer(0.0100000, false);
	}
	super(Actor).PostNetBeginPlay();
	//return;	
}

simulated function Timer()
{
	local Actor HitActor;
	local Vector HitLocation, HitNormal;

	// End:0x19
	if(FireStart == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	bTraceWater = true;
	HitActor = Trace(HitLocation, HitNormal, Location, FireStart, true);
	bTraceWater = false;
	// End:0x58
	if(HitLocation == FireStart)
	{
		return;
	}
	// End:0xAF
	if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
	{
		Spawn(Class'XGame.BulletSplash',,, HitLocation, rot(16384, 0, 0));
	}
	//return;	
}

defaultproperties
{
	ImpactSounds[0]=Sound'XEffects.Impact1Snd'
	ImpactSounds[1]=Sound'XEffects.Impact2Snd'
	ImpactSounds[2]=Sound'XEffects.Impact5Snd'
	ImpactSounds[3]=Sound'XEffects.Impact3'
	ImpactSounds[4]=Sound'XEffects.Impact1'
	ImpactSounds[5]=Sound'XEffects.Impact2'
	DrawType=0
	RemoteRole=2
	LifeSpan=0.2000000
}
