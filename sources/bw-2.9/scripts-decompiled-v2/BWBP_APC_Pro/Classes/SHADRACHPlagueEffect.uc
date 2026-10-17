class SHADRACHPlagueEffect extends BallisticEmitter;

var Actor Victim;
var float Duration;
var float MaxDuration;
var float Damage;
var Controller InstigatorController;
var SHADRACHPlagueTrigger PlagueTrigger;
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
		SetTimer(0.5000000, true);
	}
	// End:0x87
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;		
	}
	else
	{
		// End:0xD7
		if((xPawn(Victim) != none) && xPawn(Victim).IsLocallyControlled())
		{
			Emitters[1].Disabled = true;
			Emitters[2].Disabled = true;
		}
	}
	SetBase(Victim);
	PlagueTrigger = Spawn(Class'BWBP_APC_Pro.SHADRACHPlagueTrigger', Victim,, Victim.Location);
	PlagueTrigger.Instigator = Instigator;
	PlagueTrigger.InstigatorController = InstigatorController;
	PlagueTrigger.PlagueEffect = self;
	// End:0x15F
	if(BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).bPreventHealing = true;
	}
	//return;	
}

function ExtendDuration(float Amount)
{
	// End:0x0B
	if(bTearOff)
	{
		return;
	}
	Duration = FMin(Duration + Amount, MaxDuration);
	//return;	
}

event Tick(float dt)
{
	// End:0x0B
	if(bTearOff)
	{
		return;
	}
	Duration -= dt;
	// End:0x78
	if((Victim == none) || Duration <= float(0))
	{
		// End:0x70
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
	// End:0xA2
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Duration > float(0))
	{
		// End:0x6D
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x26
	if(BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).bPreventHealing = false;
	}
	super(Actor).Destroyed();
	PlagueTrigger.Destroy();
	//return;	
}

defaultproperties
{
	Duration=8.0000000
	MaxDuration=16.0000000
	Damage=5.0000000
	DamageType=Class'BWBP_APC_Pro.DT_SHADRACHPlague'
	Emitters[0]=SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter0'
	Emitters[1]=SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter1'
	Emitters[2]=SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter2'
	AutoDestroy=true
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-PackBurn'
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
	bNotOnDedServer=false
}
