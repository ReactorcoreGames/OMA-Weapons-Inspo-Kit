class xHeavyWallHitEffect extends Effects;

var Sound ImpactSounds[10];

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x29
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x29
		if(Instigator != none)
		{
			MakeNoise(0.3000000);
		}
	}
	// End:0x48
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SpawnEffects();
	}
	//return;	
}

simulated function SpawnEffects()
{
	local PlayerController P;
	local bool bViewed;

	PlaySound(ImpactSounds[Rand(10)]);
	P = Level.GetLocalPlayerController();
	// End:0xE4
	if((((P != none) && P.ViewTarget != none) && VSize(P.ViewTarget.Location - Location) < (float(1600) * P.FOVBias)) && (Vector(P.Rotation) Dot (Location - P.ViewTarget.Location)) > float(0))
	{
		Spawn(Class'XEffects.BulletDecal', self,, Location, Rotator(float(-1) * Vector(Rotation)));
		bViewed = true;
	}
	// End:0xF8
	if(PhysicsVolume.bWaterVolume)
	{
		return;
	}
	// End:0x151
	if((int(Level.DetailMode) == int(0)) || Level.bDropDetail)
	{
		// End:0x147
		if(bViewed && FRand() < 0.2500000)
		{
			Spawn(Class'XEffects.pclImpactSmoke');			
		}
		else
		{
			Spawn(Class'XEffects.WallSparks');
		}
		return;
	}
	// End:0x170
	if(bViewed && FRand() < 0.5000000)
	{
		Spawn(Class'XEffects.pclImpactSmoke');
	}
	Spawn(Class'XEffects.WallSparks');
	//return;	
}

defaultproperties
{
	ImpactSounds[0]=Sound'XEffects.Impact1Snd'
	ImpactSounds[1]=Sound'XEffects.Impact2Snd'
	ImpactSounds[2]=Sound'XEffects.Impact3Snd'
	ImpactSounds[3]=Sound'XEffects.Impact4Snd'
	ImpactSounds[4]=Sound'XEffects.Impact5Snd'
	ImpactSounds[5]=Sound'XEffects.Impact6Snd'
	ImpactSounds[6]=Sound'XEffects.Impact7Snd'
	ImpactSounds[7]=Sound'XEffects.Impact3'
	ImpactSounds[8]=Sound'XEffects.Impact1'
	ImpactSounds[9]=Sound'XEffects.Impact2'
	DrawType=0
	CullDistance=7000.0000000
	LifeSpan=0.1000000
	Style=6
}
