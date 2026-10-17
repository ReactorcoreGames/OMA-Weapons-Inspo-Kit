class InstantFire extends WeaponFire;

var Class<DamageType> DamageType;
var int DamageMin;
var int DamageMax;
var float TraceRange;
var float Momentum;

function float MaxRange()
{
	// End:0x51
	if(Instigator.Region.Zone.bDistanceFog)
	{
		TraceRange = FClamp(Instigator.Region.Zone.DistanceFogEnd, 8000.0000000, default.TraceRange);		
	}
	else
	{
		TraceRange = default.TraceRange;
	}
	return TraceRange;
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator R, Aim;

	Instigator.MakeNoise(1.0000000);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	Aim = AdjustAim(StartTrace, aimerror);
	R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
	DoTrace(StartTrace, R);
	//return;	
}

function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X, End, HitLocation, HitNormal, RefNormal;

	local Actor Other;
	local int Damage;
	local bool bDoReflect;
	local int ReflectNum;

	MaxRange();
	ReflectNum = 0;
	J0x0D:

	// End:0x33D [Loop If]
	if(true)
	{
		bDoReflect = false;
		X = Vector(Dir);
		End = Start + (TraceRange * X);
		Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x281
		if((Other != none) && (Other != Instigator) || ReflectNum > 0)
		{
			// End:0xFF
			if((bReflective && Other.IsA('xPawn')) && xPawn(Other).CheckReflect(HitLocation, RefNormal, int(float(DamageMin) * 0.2500000)))
			{
				bDoReflect = true;
				HitNormal = vect(0.0000000, 0.0000000, 0.0000000);				
			}
			else
			{
				// End:0x239
				if(!Other.bWorldGeometry)
				{
					Damage = DamageMin;
					// End:0x153
					if((DamageMin != DamageMax) && FRand() > 0.5000000)
					{
						Damage += Rand((1 + DamageMax) - DamageMin);
					}
					Damage = int(float(Damage) * DamageAtten);
					// End:0x1F4
					if((Other.IsA('Vehicle') || !Other.IsA('Pawn') && !Other.IsA('HitScanBlockingVolume')) && WeaponAttachment(Weapon.ThirdPersonActor) != none)
					{
						WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Other, HitLocation, HitNormal);
					}
					Other.TakeDamage(Damage, Instigator, HitLocation, Momentum * X, DamageType);
					HitNormal = vect(0.0000000, 0.0000000, 0.0000000);					
				}
				else
				{
					// End:0x27E
					if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
					{
						WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Other, HitLocation, HitNormal);
					}
				}
			}			
		}
		else
		{
			HitLocation = End;
			HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
			// End:0x2E4
			if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
			{
				WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Other, HitLocation, HitNormal);
			}
		}
		SpawnBeamEffect(Start, Dir, HitLocation, HitNormal, ReflectNum);
		// End:0x337
		if(bDoReflect && ++ReflectNum < 4)
		{
			Start = HitLocation;
			Dir = Rotator(RefNormal);			
		}
		else
		{
			// [Explicit Break]
			goto J0x33D;
		}
		// [Loop Continue]
		goto J0x0D;
	}
	J0x33D:

	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	//return;	
}

defaultproperties
{
	TraceRange=10000.0000000
	Momentum=1.0000000
	NoAmmoSound=ProceduralSound'WeaponSounds.PReload5.P1Reload5'
}
