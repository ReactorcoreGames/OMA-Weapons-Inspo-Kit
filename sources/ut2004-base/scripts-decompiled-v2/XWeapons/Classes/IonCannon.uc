class IonCannon extends Actor
	placeable;

var() Sound FireSound;
var() Vector MarkLocation;
var() Class<IonEffect> IonEffectClass;
var() int Damage;
var() float MomentumTransfer;
var() float DamageRadius;
var() Class<DamageType> DamageType;
var Vector BeamDirection;
var Vector DamageLocation;
var AvoidMarker Fear;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;

function PostBeginPlay()
{
	local IonCannon C;

	super.PostBeginPlay();
	// End:0x11
	if(bDeleteMe)
	{
		return;
	}
	// End:0x39
	foreach DynamicActors(Class'XWeapons.IonCannon', C)
	{
		// End:0x38
		if(C != self)
		{
			C.Destroy();
		}		
	}	
	//return;	
}

function bool CheckMark(Pawn Aimer, Vector TestMark, bool bFire)
{
	return false;
	//return;	
}

function RemoveFear()
{
	// End:0x17
	if(Fear != none)
	{
		Fear.Destroy();
	}
	//return;	
}

function bool IsFiring()
{
	return false;
	//return;	
}

auto state Ready
{
	function bool CheckMark(Pawn Aimer, Vector TestMark, bool bFire)
	{
		local Actor Other;
		local Vector HitLocation, HitNormal, Top;

		// End:0x0B
		if(IsFiring())
		{
			return false;
		}
		Top = TestMark;
		Top.Z = Location.Z;
		Other = Trace(HitLocation, HitNormal, Top, TestMark, false);
		// End:0x56
		if(Other != none)
		{
			return false;
		}
		// End:0x7C
		if(bFire)
		{
			Instigator = Aimer;
			MarkLocation = TestMark;
			GotoState('FireSequence');
		}
		return true;
		//return;		
	}
	stop;	
}

state FireSequence
{
	function bool IsFiring()
	{
		return true;
		//return;		
	}

	function BeginState()
	{
		BeamDirection = vect(0.0000000, 0.0000000, -1.0000000);
		DamageLocation = MarkLocation - (BeamDirection * 200.0000000);
		//return;		
	}

	function SpawnEffect()
	{
		local IonEffect IonBeamEffect;
		local Actor Other;
		local Vector HitLocation, HitNormal, Top, CP;

		Other = Trace(HitLocation, HitNormal, MarkLocation + vect(0.0000000, 0.0000000, 10000.0000000), MarkLocation, false);
		Top = MarkLocation;
		Top.Z = FMax(HitLocation.Z, Location.Z);
		IonBeamEffect = Spawn(IonEffectClass,,, Top);
		// End:0x9A
		if(IonBeamEffect != none)
		{
			IonBeamEffect.AimAt(MarkLocation, vect(0.0000000, 0.0000000, 1.0000000));
		}
		// End:0xD4
		if(Instigator != none)
		{
			CP = Normal(vect(0.0000000, 0.0000000, 1.0000000) Cross (Location - Instigator.Location));			
		}
		else
		{
			CP = vect(1.0000000, 0.0000000, 0.0000000);
		}
		CP *= (0.5000000 * (Location.Z - MarkLocation.Z));
		Other = Trace(HitLocation, HitNormal, Top + CP, MarkLocation, false);
		// End:0x183
		if(Other == none)
		{
			IonBeamEffect = Spawn(IonEffectClass,,, Top + CP);
			// End:0x183
			if(IonBeamEffect != none)
			{
				IonBeamEffect.AimAt(MarkLocation, vect(0.0000000, 0.0000000, 1.0000000));
			}
		}
		Other = Trace(HitLocation, HitNormal, Top - CP, MarkLocation, false);
		// End:0x1FB
		if(Other == none)
		{
			IonBeamEffect = Spawn(IonEffectClass,,, Top - CP);
			// End:0x1FB
			if(IonBeamEffect != none)
			{
				IonBeamEffect.AimAt(MarkLocation, vect(0.0000000, 0.0000000, 1.0000000));
			}
		}
		//return;		
	}

	function ShakeView()
	{
		local Controller C;
		local PlayerController PC;
		local float Dist, Scale;

		C = Level.ControllerList;
		J0x14:

		// End:0x13A [Loop If]
		if(C != none)
		{
			PC = PlayerController(C);
			// End:0x123
			if(((PC != none) && PC.ViewTarget != none) && PC.ViewTarget.Base != none)
			{
				Dist = VSize(DamageLocation - PC.ViewTarget.Location);
				// End:0x123
				if(Dist < (DamageRadius * 2.0000000))
				{
					// End:0xC8
					if(Dist < DamageRadius)
					{
						Scale = 1.0000000;						
					}
					else
					{
						Scale = ((DamageRadius * 2.0000000) - Dist) / DamageRadius;
					}
					C.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
				}
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0x14;
		}
		//return;		
	}

	function PlayGlobalSound(Sound S)
	{
		local PlayerController P;

		// End:0x25
		foreach DynamicActors(Class'Engine.PlayerController', P)
		{
			P.ClientPlaySound(S);			
		}		
		//return;		
	}

	function EndState()
	{
		// End:0x3E
		if((Instigator != none) && Painter(Instigator.Weapon) != none)
		{
			Instigator.Weapon.CheckOutOfAmmo();
		}
		// End:0x55
		if(Fear != none)
		{
			Fear.Destroy();
		}
		//return;		
	}
Begin:

	// End:0x20
	if(Fear == none)
	{
		Fear = Spawn(Class'Engine.AvoidMarker',,, MarkLocation);
	}
	Fear.SetCollisionSize(DamageRadius, 200.0000000);
	// End:0xA7
	if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		Fear.TeamNum = byte(Instigator.PlayerReplicationInfo.Team.TeamIndex);
	}
	Fear.StartleBots();
	Sleep(0.5000000);
	SpawnEffect();
	PlayGlobalSound(FireSound);
	Sleep(0.5000000);
	ShakeView();
	HurtRadius(float(Damage), DamageRadius * 0.1250000, DamageType, MomentumTransfer, DamageLocation);
	Sleep(0.5000000);
	PlayGlobalSound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(float(Damage), DamageRadius * 0.3000000, DamageType, MomentumTransfer, DamageLocation);
	Sleep(0.2000000);
	HurtRadius(float(Damage), DamageRadius * 0.4750000, DamageType, MomentumTransfer, DamageLocation);
	Sleep(0.2000000);
	HurtRadius(float(Damage), DamageRadius * 0.6500000, DamageType, MomentumTransfer, DamageLocation);
	Sleep(0.2000000);
	HurtRadius(float(Damage), DamageRadius * 0.8250000, DamageType, MomentumTransfer, DamageLocation);
	Sleep(0.2000000);
	HurtRadius(float(Damage), DamageRadius * 1.0000000, DamageType, MomentumTransfer, DamageLocation);
	GotoState('Ready');
	stop;					
}

defaultproperties
{
	FireSound=Sound'WeaponSounds.TAGRifle.IonCannonBlast'
	IonEffectClass=Class'XEffects.IonEffect'
	Damage=150
	MomentumTransfer=150000.0000000
	DamageRadius=2000.0000000
	DamageType=Class'XWeapons.DamTypeIonBlast'
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	DrawType=2
	bHidden=true
	RemoteRole=0
	Mesh=SkeletalMesh'Weapons.IonCannon'
	TransientSoundVolume=1.0000000
	TransientSoundRadius=2000.0000000
	bRotateToDesired=true
	RotationRate=(Pitch=15000,Yaw=15000,Roll=15000)
}
