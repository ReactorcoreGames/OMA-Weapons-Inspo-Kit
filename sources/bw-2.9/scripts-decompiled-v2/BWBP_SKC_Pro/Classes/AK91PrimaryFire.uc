class AK91PrimaryFire extends BallisticInstantFire;

simulated event ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x7E
	if(int(Weapon.SoundPitch) != 56)
	{
		// End:0x4A
		if(Instigator.DrivenVehicle != none)
		{
			Weapon.SoundPitch = 56;			
		}
		else
		{
			Weapon.SoundPitch = byte(Max(56, int(float(Weapon.SoundPitch) - (float(8) * dt))));
		}
	}
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	Weapon.SoundPitch = byte(Min(150, int(Weapon.SoundPitch) + 8));
	AK91ChargeRifle(BW).AddHeat(HeatPerShot);
	//return;	
}

function Supercharger_ChargeControl GetChargeControl()
{
	return AK91ChargeRifle(Weapon).GetChargeControl();
	//return;	
}

function DoFireEffect()
{
	local Vector Start, Dir, End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local float dist;
	local int i;

	Start = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	DoTrace(Start, Aim);
	Dir = Vector(Aim);
	End = Start + (Dir * (MaxRange()));
	Weapon.bTraceWater = true;
	i = 0;
	J0x9B:

	// End:0x18A [Loop If]
	if(i < 20)
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x14B
		if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// [Explicit Break]
			goto J0x18A;
		}
		Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
		i++;
		// [Loop Continue]
		goto J0x9B;
	}
	J0x18A:

	Weapon.bTraceWater = false;
	// End:0x1B1
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x1F3
	if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
	{
		Other = none;
	}
	dist = VSize(HitLocation - Start);
	// End:0x273
	if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
	{
		GetChargeControl().FireShot(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, 2);		
	}
	else
	{
		GetChargeControl().FireShot(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, 2);
	}
	SendFireEffect(Other, HitLocation, HitNormal, 0);
	super(BallisticFire).DoFireEffect();
	// End:0x2F5
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		AK91ChargeRifle(Weapon).AddHeat(HeatPerShot);
	}
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x7B:

	// End:0x302 [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x120
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x302;
		}
		// End:0x2F1
		if(Other != none)
		{
			// End:0x18A
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				// [Explicit Break]
				goto J0x302;
			}
			LastHitLoc = HitLocation;
			// End:0x26F
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0);
				// End:0x20B
				if(Vehicle(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);					
				}
				else
				{
					// End:0x26F
					if(Mover(Other) == none)
					{
						bHitWall = true;
						// End:0x256
						if(HitMaterial != none)
						{
							SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));							
						}
						else
						{
							SendFireEffect(Other, HitLocation, HitNormal, 0);
						}
						// [Explicit Break]
						goto J0x302;
					}
				}
			}
			// End:0x2EB
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				Weapon.bTraceWater = true;
				// [Explicit Continue]
				goto J0x2FF;
			}
			// [Explicit Break]
			goto J0x302;			
		}
		else
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x302;
		}
		J0x2FF:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x302:

	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super.ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x4F
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		AK91ChargeRifle(BW).AddHeat(0.5700000);
	}
	//return;	
}

defaultproperties
{
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	KickForce=22000
	PenetrateForce=180
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	XInaccuracy=3.2000000
	YInaccuracy=3.2000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.rpk940.RPK-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=0.4500000
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1400000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_AK762mm'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
