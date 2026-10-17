class IonCannonKillVolume extends PhysicsVolume;

var() Class<Pawn> TargetClass;
var() bool bAffectsFlyingPawns;
var() int CountdownTime;
var() Class<IonEffect> IonEffectClass;
var array<Pawn> Targets;
var int TimeRemaining;

event PawnEnteredVolume(Pawn Other)
{
	super.PawnEnteredVolume(Other);
	// End:0xF4
	if((((Other != none) && Other.Controller != none) && ClassIsChildOf(Other.Class, TargetClass)) && !Other.bCanFly || bAffectsFlyingPawns)
	{
		Targets[Targets.Length] = Other;
		// End:0xA2
		if(PainTimer == none)
		{
			TimeRemaining = CountdownTime;
			PainTimer = Spawn(Class'Engine.VolumeTimer', self);			
		}
		else
		{
			TimeRemaining = Min(CountdownTime, Max(3, TimeRemaining));
		}
		// End:0xF4
		if(PlayerController(Other.Controller) != none)
		{
			PlayerController(Other.Controller).ReceiveLocalizedMessage(MessageClass, 0);
		}
	}
	//return;	
}

event PawnLeavingVolume(Pawn Other)
{
	super.PawnLeavingVolume(Other);
	RemoveTarget(Other);
	//return;	
}

function RemoveTarget(Pawn Other)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x5C [Loop If]
	if(i < Targets.Length)
	{
		// End:0x52
		if((Targets[i] == none) || Targets[i] == Other)
		{
			Targets.Remove(i, 1);
			i--;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x81
	if((Targets.Length == 0) && PainTimer != none)
	{
		PainTimer.Destroy();
	}
	//return;	
}

function TimerPop(VolumeTimer t)
{
	local Actor A;
	local Pawn P;
	local bool bFound;

	// End:0x11
	if(t != PainTimer)
	{
		return;
	}
	// End:0x142
	foreach TouchingActors(TargetClass, A)
	{
		P = Pawn(A);
		// End:0x75
		if((P.Controller == none) || P.bCanFly && !bAffectsFlyingPawns)
		{
			RemoveTarget(P);
			continue;			
		}
		// End:0xE9
		if(TimeRemaining > 1)
		{
			// End:0xE6
			if(PlayerController(P.Controller) != none)
			{
				PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, 0);
				PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, TimeRemaining - 1);
			}			
		}
		else
		{
			// End:0x10B
			if(TimeRemaining == 1)
			{
				SpawnEffects(P.Location);				
			}
			else
			{
				// End:0x139
				if(TimeRemaining < 1)
				{
					P.Died(none, Class'XGame.DamTypeIonVolume', P.Location);
				}
			}
		}
		bFound = true;		
	}	
	// End:0x15C
	if(TimeRemaining == 0)
	{
		PlayGlobalSound(Sound'WeaponSounds.Misc.redeemer_explosionsound');		
	}
	else
	{
		// End:0x17D
		if((TimeRemaining == 1) && bFound)
		{
			PlayGlobalSound(Sound'WeaponSounds.TAGRifle.IonCannonBlast');
		}
	}
	// End:0x19A
	if(bFound || TimeRemaining <= 1)
	{
		TimeRemaining--;
	}
	//return;	
}

function SpawnEffects(Vector EffectLoc)
{
	local IonEffect IonBeamEffect;
	local Actor Other;
	local Vector HitLocation, HitNormal, Top, CP;

	Other = Trace(HitLocation, HitNormal, EffectLoc + vect(0.0000000, 0.0000000, 10000.0000000), EffectLoc, false);
	Top = EffectLoc;
	Top.Z = FMax(HitLocation.Z, EffectLoc.Z + float(2000));
	IonBeamEffect = Spawn(IonEffectClass,,, Top);
	// End:0xA3
	if(IonBeamEffect != none)
	{
		IonBeamEffect.AimAt(EffectLoc, vect(0.0000000, 0.0000000, 1.0000000));
	}
	CP = vect(1500.0000000, 0.0000000, 0.0000000);
	Other = Trace(HitLocation, HitNormal, Top + CP, EffectLoc, false);
	// End:0x12E
	if(Other == none)
	{
		IonBeamEffect = Spawn(IonEffectClass,,, Top + CP);
		// End:0x12E
		if(IonBeamEffect != none)
		{
			IonBeamEffect.AimAt(EffectLoc, vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	Other = Trace(HitLocation, HitNormal, Top - CP, EffectLoc, false);
	// End:0x1A6
	if(Other == none)
	{
		IonBeamEffect = Spawn(IonEffectClass,,, Top - CP);
		// End:0x1A6
		if(IonBeamEffect != none)
		{
			IonBeamEffect.AimAt(EffectLoc, vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	//return;	
}

function PlayGlobalSound(Sound S)
{
	local PlayerController C;

	// End:0x39
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x38
		if(C.Player != none)
		{
			C.ClientPlaySound(S);
		}		
	}	
	//return;	
}

defaultproperties
{
	TargetClass=Class'Engine.Pawn'
	CountdownTime=10
	IonEffectClass=Class'XEffects.IonEffect'
	TransientSoundVolume=1.0000000
	TransientSoundRadius=2000.0000000
	MessageClass=Class'XGame.IonCannonKillWarning'
}
