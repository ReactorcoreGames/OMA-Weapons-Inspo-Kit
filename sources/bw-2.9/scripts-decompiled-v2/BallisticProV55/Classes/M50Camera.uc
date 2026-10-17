class M50Camera extends Actor
	notplaceable;

var int Health;
var bool bBusted;
var Rotator StartRotation;
var Rotator OldRotation;
var Rotator SwitchViewRot;
var M50CameraBase CamBase;
var() Sound NoiseSound;
var() Sound TrackSound;
var() Sound DieSound;
var() Sound PlaceSound;
var() int LastFOV;
var Emitter DeadEffect;
var byte HitCount;
var Weapon Weapon;
var Controller InstigatorController;
var M50CamTrigger MyUseTrigger;
//var delegate<OnCameraDie> __OnCameraDie__Delegate;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Health, Weapon;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	PlaySound(PlaceSound, 1, 0.5000000,, 32.0000000);
	StartRotation = Rotation;
	// End:0x58
	if((Weapon != none) && M50AssaultRifle(Weapon) != none)
	{
		M50AssaultRifle(Weapon).CamStart(self);
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x89
	if(Health == 0)
	{
		bBusted = true;
		default.HitCount = HitCount;
		OnCameraDie();
		// End:0x54
		if(DeadEffect != none)
		{
			DeadEffect.Trigger(self, Weapon.Instigator);			
		}
		else
		{
			DeadEffect = Spawn(Class'BallisticProV55.M50CamDieEmitter', self,, Location);
		}
		AmbientSound = NoiseSound;
		PlaySound(DieSound, 1, 1.0000000,, 64.0000000);
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x45
	if(((InstigatorController != none) && EventInstigator.Controller != none) && EventInstigator.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x7C
	if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).static.IsDamage(",GearSafe,"))
	{
		return;
	}
	// End:0x89
	if(Health == 0)
	{
		return;
	}
	// End:0xA2
	if(Damage > Health)
	{
		Health = 0;		
	}
	else
	{
		Health -= Damage;
	}
	// End:0xCD
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PostNetReceive();
	}
	//return;	
}

simulated function PlayTracking()
{
	// End:0x0B
	if(bBusted)
	{
		return;
	}
	// End:0x21
	if(AmbientSound == none)
	{
		AmbientSound = TrackSound;
	}
	SetTimer(0.1500000, false);
	//return;	
}

simulated event Timer()
{
	AmbientSound = none;
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(MyUseTrigger != none)
	{
		MyUseTrigger.Destroy();
	}
	// End:0x31
	if(DeadEffect != none)
	{
		DeadEffect.Kill();
	}
	// End:0x48
	if(CamBase != none)
	{
		CamBase.Destroy();
	}
	OnCameraDie();
	super.Destroyed();
	//return;	
}

delegate OnCameraDie()
{
	//return;	
}

defaultproperties
{
	Health=200
	NoiseSound=Sound'BW_Core_WeaponSound.M50.M50CamNoise'
	TrackSound=Sound'BW_Core_WeaponSound.M50.M50CamTurn'
	DieSound=Sound'BW_Core_WeaponSound.M50.M50CamDie'
	PlaceSound=Sound'BW_Core_WeaponSound.M50.M50CamPlace'
	LastFOV=90
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M50.M50Camera'
	bAlwaysRelevant=true
	RemoteRole=2
	SoundVolume=192
	SoundRadius=0.1000000
	CollisionRadius=30.0000000
	CollisionHeight=30.0000000
	bCollideActors=true
	bProjTarget=true
	bBlockNonZeroExtentTraces=false
	bNetNotify=true
}
