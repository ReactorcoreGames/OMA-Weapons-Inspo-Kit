class SK410ActorFire extends BallisticEmitter;

var Actor Victim;
var float Fuel;
var float MaxFuel;
var float Damage;
var Controller InstigatorController;
var Class<DamageType> DamageType;

function Reset()
{
	Destroy();
	//return;	
}

simulated event TornOff()
{
	Kill();
	//return;	
}

simulated function Initialize(Actor V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	// End:0x31
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(0.7500000, true);
	}
	// End:0xAC
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
	}
	SetBase(Victim);
	//return;	
}

function AddFuel(float Amount)
{
	// End:0x13
	if(Fuel == float(-1))
	{
		return;
	}
	Fuel = FMin(Fuel + Amount, MaxFuel);
	//return;	
}

event Tick(float dt)
{
	// End:0x13
	if(Fuel == float(-1))
	{
		return;
	}
	Fuel -= dt;
	// End:0xD5
	if((((Victim == none) || Fuel <= float(0)) || Victim.PhysicsVolume.bWaterVolume) || (Pawn(Victim) != none) && Pawn(Victim).Health < 1)
	{
		Fuel = -1.0000000;
		// End:0xCD
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;			
		}
		else
		{
			Kill();
		}
		return;
	}
	//return;	
}

event Timer()
{
	// End:0x0C
	if(bTearOff)
	{
		Destroy();
	}
	// End:0x1F
	if(Fuel == float(-1))
	{
		return;
	}
	// End:0xB5
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Fuel > float(0))
	{
		// End:0x80
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x57
	if(NewVolume.bWaterVolume)
	{
		// End:0x51
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;			
		}
		else
		{
			Kill();
		}
	}
	//return;	
}

defaultproperties
{
	Fuel=0.5000000
	MaxFuel=6.0000000
	Damage=4.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Immolation'
	Emitters[0]=SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter11'
	Emitters[1]=SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter0'
	Emitters[2]=SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter1'
	Emitters[3]=SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter6'
	Emitters[4]=SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter3'
	AutoDestroy=true
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	bFullVolume=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}
