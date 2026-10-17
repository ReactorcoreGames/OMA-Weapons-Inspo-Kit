class Z250Grenade extends BallisticGrenade;

var Z250FireControl FireControl;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0x38
	if(int(Role) == int(ROLE_Authority))
	{
		OilBlowUp(HitLocation, HitNormal);
	}
	// End:0x99
	if(ImpactManager != none)
	{
		// End:0x7A
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x11B
	if(((bTearOnExplode && !bNetTemporary) && int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function OilBlowUp(Vector HitLocation, Vector HitNormal)
{
	local int i, Count;
	local Vector Start, End, HitLoc, HitNorm;
	local Rotator direction;
	local Actor t;
	local Z250GasBurst GF;

	Start = Location + (HitNormal * float(16));
	Count = 0;
	i = 0;
	J0x26:

	// End:0x1B2 [Loop If]
	if((i < 50) && Count < 24)
	{
		// End:0xFC
		if(Count > 0)
		{
			End = VRand();
			// End:0x85
			if(End.Z < 0.2500000)
			{
				End.Z = FMax(Abs(End.Z), 0.2500000);
			}
			direction = Rotator(End);
			End = Start + (End * DamageRadius);
			t = Trace(HitLoc, HitNorm, End, Start);
			// End:0xDF
			if(t == none)
			{
				HitLoc = End;
			}
			GF = Spawn(Class'BWBP_OP_Pro.Z250GasBurst', self,, HitLoc, direction);			
		}
		else
		{
			GF = Spawn(Class'BWBP_OP_Pro.Z250GasBurst', self,, Start, rot(16384, 0, 0));
		}
		// End:0x1A8
		if(GF != none)
		{
			Count++;
			GF.Instigator = Instigator;
			// End:0x194
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				GF.InstigatorController = Instigator.Controller;
			}
			GF.FireControl = FireControl;
		}
		i++;
		// [Loop Continue]
		goto J0x26;
	}
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=2
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	ArmingDelay=0.2000000
	DetonateDelay=1.0000000
	ImpactDamage=20
	ImpactDamageType=Class'BWBP_OP_Pro.DTZ250Grenade'
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	ImpactManager=Class'BWBP_OP_Pro.IM_Z250Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTZ250GrenadeRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=4000.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTZ250GrenadeRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade'
	bIgnoreTerminalVelocity=true
}
