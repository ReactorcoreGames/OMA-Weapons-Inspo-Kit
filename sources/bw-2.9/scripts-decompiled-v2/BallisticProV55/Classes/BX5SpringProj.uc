class BX5SpringProj extends BallisticProjectile;

var bool bDetonate;
var BX5TeamLight TeamLight;
var byte TeamLightColor;
var bool bAntiLameMode;
var Pawn OriginalPlacer;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x113
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x44
		if(Instigator != none)
		{
			TeamLightColor = byte(Instigator.Controller.GetTeamNum());			
		}
		else
		{
			TeamLightColor = byte(255);
		}
		// End:0x113
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x113
			if((int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum()) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
			{
				TeamLight = Spawn(Class'BallisticProV55.BX5TeamLight', self,, Location, Rotation);
				// End:0xF0
				if(Instigator.Controller == Level.GetLocalPlayerController())
				{
					TeamLight.SetTeamColor(2);					
				}
				else
				{
					TeamLight.SetTeamColor(int(TeamLightColor));
				}
				TeamLight.SetBase(self);
			}
		}
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x21
	if(bDetonate)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	// End:0x136
	if(int(TeamLightColor) != int(default.TeamLightColor))
	{
		// End:0x136
		if(((int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum()) || Level.GetLocalPlayerController().GetTeamNum() == 255) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
		{
			TeamLight = Spawn(Class'BallisticProV55.BX5TeamLight', self,, Location, Rotation);
			// End:0xDF
			if(Instigator.Controller == Level.GetLocalPlayerController())
			{
				TeamLight.SetTeamColor(2);				
			}
			else
			{
				// End:0x129
				if((Level.GetLocalPlayerController().GetTeamNum() != 255) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
				{
					TeamLight.SetTeamColor(int(TeamLightColor));
				}
			}
			TeamLight.SetBase(self);
		}
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x67
	if(bAntiLameMode && OriginalPlacer != none)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(OriginalPlacer, 666.0000000, Instigator, HitLocation, MomentumTransfer * vect(0.0000000, 0.0000000, 1.0000000), Class'BallisticProV55.DT_TeleportLamer');		
	}
	else
	{
		// End:0x98
		if(DamageRadius > float(0))
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated event Timer()
{
	// End:0x1E
	if(bDetonate)
	{
		Explode(Location, Vector(Rotation));		
	}
	else
	{
		super.Timer();
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x24
	if((BX5SpringMine(Other) != none) || BX5VehicleMine(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function SpringOff()
{
	SetLocation(Location + (Vector(Rotation) * float(4)));
	bCollideWorld = true;
	SetCollision(true, default.bBlockActors, default.bBlockPlayers);
	SetPhysics(2);
	Velocity = Vector(Rotation) * float(400 + Rand(200));
	bDetonate = true;
	SetTimer(0.7000000, false);
	InitEffects();
	// End:0xA3
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		bTearOff = true;
	}
	//return;	
}

simulated function InitEffects()
{
	// End:0x0F
	if(bDetonate)
	{
		super.InitEffects();
	}
	//return;	
}

simulated function Destroyed()
{
	super.Destroyed();
	// End:0x1D
	if(TeamLight != none)
	{
		TeamLight.Destroy();
	}
	//return;	
}

defaultproperties
{
	TeamLightColor=128
	WeaponClass=Class'BallisticProV55.BX5Mine'
	ImpactManager=Class'BallisticProV55.IM_AirMine'
	TrailClass=Class'BallisticProV55.NRP57Trail'
	bRandomStartRotation=false
	bTearOnExplode=false
	NetTrappedDelay=0.2000000
	MyRadiusDamageType=Class'BallisticProV55.DTBX5SpringRadius'
	ShakeRadius=1024.0000000
	Speed=500.0000000
	Damage=100.0000000
	DamageRadius=256.0000000
	MomentumTransfer=80000.0000000
	MyDamageType=Class'BallisticProV55.DTBX5SpringRadius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MineSProj2'
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.2000000
	bUnlit=false
	SoundVolume=192
	SoundRadius=128.0000000
	bCollideActors=false
	bCollideWorld=false
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
