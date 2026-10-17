class BallisticGrenadeAttachment extends BallisticAttachment;

var() Class<BCImpactManager> ExplodeManager;
var bool HandExplodeNotify;
var bool HandSmokeNotify;
var() Class<Emitter> GrenadeSmokeClass;
var Emitter GrenadeSmoke;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		HandExplodeNotify, HandSmokeNotify;
}

simulated event ThirdPersonEffects()
{
	// End:0x24
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PlayPawnFiring(FiringMode);
	}
	// End:0x43
	if(GrenadeSmoke != none)
	{
		Class'BCoreProV55.BallisticEmitter'.static.StopParticles(GrenadeSmoke);
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(HandExplodeNotify != default.HandExplodeNotify)
	{
		default.HandExplodeNotify = HandExplodeNotify;
		HandExplodeEffects();
	}
	// End:0x48
	if(HandSmokeNotify != default.HandSmokeNotify)
	{
		default.HandSmokeNotify = HandSmokeNotify;
		HandSmokeEffects();
	}
	super.PostNetReceive();
	//return;	
}

simulated function HandExplodeEffects()
{
	local Vector V;

	// End:0x5A
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		V = Instigator.Weapon.Location;		
	}
	else
	{
		V = Location;
	}
	// End:0xA8
	if((ExplodeManager != none) && EffectIsRelevant(V, false))
	{
		ExplodeManager.static.StartSpawn(V, vect(0.0000000, 0.0000000, 1.0000000), 0, Instigator);
	}
	//return;	
}

function HandExplode()
{
	HandExplodeNotify = !HandExplodeNotify;
	HandExplodeEffects();
	//return;	
}

simulated function HandSmokeEffects()
{
	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x5E
	if(GrenadeSmoke != none)
	{
		Class'BCoreProV55.BallisticEmitter'.static.ResumeParticles(GrenadeSmoke);		
	}
	else
	{
		GrenadeSmoke = Spawn(GrenadeSmokeClass, Instigator,, Location + (vect(0.0000000, 0.0000000, 1.0000000) * float(3)), Rotation);
		// End:0xD6
		if(GrenadeSmoke != none)
		{
			GrenadeSmoke.SetBase(self);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(GrenadeSmoke, 0.4000000);
			DGVEmitter(GrenadeSmoke).InitDGV();
		}
	}
	//return;	
}

function HandSmoke()
{
	return;
	HandSmokeNotify = !HandSmokeNotify;
	HandSmokeEffects();
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GrenadeSmoke != none)
	{
		GrenadeSmoke.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function PlayPawnFiring(byte Mode)
{
	// End:0x12
	if(xPawn(Instigator) == none)
	{
		return;
	}
	// End:0x29
	if(int(Mode) == 2)
	{
		PlayMeleeFiring();		
	}
	else
	{
		// End:0x86
		if(((int(TrackAnimMode) == int(2)) || (int(TrackAnimMode) == int(0)) && int(Mode) == 0) || (int(TrackAnimMode) == int(1)) && int(Mode) == 1)
		{
			PlayPawnTrackAnim(1);			
		}
		else
		{
			// End:0xD8
			if(int(FiringMode) == 0)
			{
				// End:0xBA
				if(bIsAimed)
				{
					xPawn(Instigator).StartFiring(false, bRapidFire);					
				}
				else
				{
					xPawn(Instigator).StartFiring(true, bRapidFire);
				}				
			}
			else
			{
				// End:0xFF
				if(bIsAimed)
				{
					xPawn(Instigator).StartFiring(false, bAltRapidFire);					
				}
				else
				{
					xPawn(Instigator).StartFiring(true, bAltRapidFire);
				}
			}
			SetTimer(WeaponLightTime, false);
		}
	}
	//return;	
}

defaultproperties
{
	BrassMode=3
	InstantMode=3
	FlashMode=3
	LightMode=3
	TrackAnimMode=2
	IdleHeavyAnim="Blade_Idle"
	IdleRifleAnim="Blade_Idle"
	SingleFireAnim="Blade_Swing"
	SingleAimedFireAnim="Blade_Swing"
	RapidFireAnim="Blade_Swing"
	RapidAimedFireAnim="Blade_Swing"
}
