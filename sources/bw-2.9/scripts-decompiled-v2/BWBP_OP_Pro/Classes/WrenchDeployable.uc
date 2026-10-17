class WrenchDeployable extends DECO_Smashable;

var Sound DamagedSounds[4];
var bool bWarpOut;
var byte Team;
var byte TeamSkinIndex;
var Material TeamSkins[2];
var Controller OwningController;
var WrenchWarpDevice Master;
var byte MasterDeployableIndex;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Team, bWarpOut;
}

function PostBeginPlay()
{
	local WrenchDeployable D;

	// End:0x27
	foreach RadiusActors(Class'BWBP_OP_Pro.WrenchDeployable', D, 256.0000000)
	{
		// End:0x26
		if(D != self)
		{
			Destroy();			
			return;
		}		
	}	
	OwningController = Instigator.Controller;
	// End:0x84
	if(Instigator.PlayerReplicationInfo.Team != none)
	{
		Team = byte(Instigator.PlayerReplicationInfo.Team.TeamIndex);		
	}
	else
	{
		Team = byte(255);
	}
	//return;	
}

function Initialize(byte deployable_index)
{
	MasterDeployableIndex = deployable_index;
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x39
	if((int(Team) != 255) && int(TeamSkinIndex) != 255)
	{
		Skins[int(TeamSkinIndex)] = TeamSkins[int(Team)];
	}
	//return;	
}

function AddHealth(int Amount)
{
	Health = int(FMin(float(default.Health), float(Health + Amount)));
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function TornOff()
{
	// End:0x5E
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		// End:0x3D
		if(!bWarpOut)
		{
			Spawn(EffectWhenDestroyed, Owner,, Location);			
		}
		else
		{
			Spawn(Class'BWBP_OP_Pro.WrenchWarpEndEmitter', Owner,, Location);
			PlaySound(Sound'BWBP_OP_Sounds.Wrench.Teleport',, 1.0000000);
		}
	}
	Destroy();
	//return;	
}

simulated function Destroyed()
{
	// End:0x52
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x3E
		if(Master == none)
		{
			Log("NO MASTER - WrenchDeployable");			
		}
		else
		{
			Master.LostDeployable(MasterDeployableIndex);
		}
	}
	super(Decoration).Destroyed();
	//return;	
}

auto state Working
{
	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		// End:0x0D
		if(Health < 1)
		{
			return;
		}
		// End:0x8B
		if(((((Instigator != none) && instigatedBy.Controller != none) && Instigator.Controller != none) && Instigator.Controller != OwningController) && instigatedBy.Controller.SameTeamAs(Instigator.Controller))
		{
			return;
		}
		PlaySound(DamagedSounds[Rand(4)], 2);
		Damage *= DamageType.default.VehicleDamageScaling;
		Health -= Damage;
		// End:0xCD
		if(Health < 0)
		{
			GotoState('Destroying');
		}
		//return;		
	}

	singular function BaseChange()
	{
		//return;		
	}

	function Bump(Actor Other)
	{
		//return;		
	}

	function bool EncroachingOn(Actor Other)
	{
		// End:0x17
		if(Decoration(Other) != none)
		{
			GotoState('Destroying');
		}
		return false;
		//return;		
	}

	event EncroachedBy(Actor Other)
	{
		// End:0x17
		if(Decoration(Other) != none)
		{
			GotoState('Destroying');
		}
		return;
		//return;		
	}
	stop;	
}

state Destroying
{Begin:

	bHidden = true;
	bTearOff = true;
	bAlwaysRelevant = true;
	SetCollision(false, false, false);
	// End:0x7C
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		// End:0x5B
		if(!bWarpOut)
		{
			Spawn(EffectWhenDestroyed, Owner,, Location);			
		}
		else
		{
			Spawn(Class'BWBP_OP_Pro.WrenchWarpEndEmitter', Owner,, Location);
			PlaySound(Sound'BWBP_OP_Sounds.Wrench.Teleport',, 1.0000000);
		}
	}
	Sleep(0.5000000);
	Destroy();
	stop;					
}

defaultproperties
{
	DamagedSounds[0]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletMetal1'
	DamagedSounds[1]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletMetal2'
	DamagedSounds[2]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletMetal3'
	DamagedSounds[3]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletMetal4'
	TeamSkinIndex=255
	EffectWhenDestroyed=Class'UT2k4Assault.FX_SpaceFighter_Explosion'
	Health=250
	DrawType=8
	CullDistance=0.0000000
	NetUpdateFrequency=10.0000000
	bGameRelevant=true
	SoundVolume=150
	TransientSoundVolume=0.7500000
	TransientSoundRadius=256.0000000
	CollisionRadius=50.0000000
	CollisionHeight=8.0000000
	bBlockPlayers=true
	bBlockProjectiles=true
	bProjTarget=true
	bUseCylinderCollision=false
}
