class RX22AAttachment extends BallisticAttachment;

struct FlameHit
{
	var Vector HitLoc;
	var Vector HitNorm;
	var float HitTime;
};

var Actor Ignition;
var bool bIgnited;
var RX22ASpray Flame;
var RX22ATank GasTank;
var RX22AGasSpray GasSpray;
var array<FlameHit> FlameHits;
var Emitter FlameHitFX;
var float KillFlameTime;

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(GasTank != none)
	{
		GasTank.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(GasTank != none)
	{
		GasTank.bHidden = NewbHidden;
	}
	//return;	
}

simulated function DoFlameHit(Vector loc, Vector Norm)
{
	// End:0x2A
	if(FlameHitFX == none)
	{
		FlameHitFX = Spawn(Class'BallisticProV55.RX22AFireHit',,, loc, Rotator(Norm));		
	}
	else
	{
		FlameHitFX.SetLocation(loc);
		FlameHitFX.SetRotation(Rotator(Norm));
	}
	KillFlameTime = Level.TimeSeconds + 0.1200000;
	//return;	
}

simulated function EndFlameHit()
{
	// End:0x21
	if(FlameHitFX != none)
	{
		FlameHitFX.Kill();
		FlameHitFX = none;
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0xCF
	if(int(Role) == int(ROLE_Authority))
	{
		GasTank = Spawn(Class'BallisticProV55.RX22ATank', Instigator,, (Instigator.Location - (Vector(Instigator.Rotation + rot(0, 5000, 0)) * float(14))) + vect(0.0000000, 0.0000000, 24.0000000));
		GasTank.Instigator = Instigator;
		GasTank.Weapon = RX22AFlamer(Instigator.Weapon);
		// End:0xCF
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			GasTank.SetBase(Instigator);
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x0F
	if(int(Mode) != 0)
	{
		return;
	}
	super.FlashMuzzleFlash(Mode);
	// End:0x64
	if((Ignition == none) || Ignition.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Ignition, Class'BallisticProV55.RX22AIgniter', DrawScale * FlashScale, self, 'tip2');
	}
	// End:0x99
	if((Ignition != none) && !bIgnited)
	{
		Ignition.Trigger(self, Instigator);
		bIgnited = true;
	}
	//return;	
}

simulated event Timer()
{
	super.Timer();
	StopSpray();
	bIgnited = false;
	//return;	
}

simulated event Tick(float dt)
{
	local int i;

	super.Tick(dt);
	i = 0;
	J0x12:

	// End:0x88 [Loop If]
	if(i < FlameHits.Length)
	{
		// End:0x7E
		if(Level.TimeSeconds >= FlameHits[i].HitTime)
		{
			DoFlameHit(FlameHits[i].HitLoc, FlameHits[i].HitNorm);
			FlameHits.Remove(i, 1);
			i--;
		}
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	// End:0xB3
	if((FlameHitFX != none) && Level.TimeSeconds >= KillFlameTime)
	{
		EndFlameHit();
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector Dir, End;
	local int i;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x28B
	if(int(Mode) == 0)
	{
		// End:0x5A
		if(GasSpray != none)
		{
			GasSpray.Kill();
			GasSpray.bHidden = false;
			GasSpray = none;
		}
		// End:0x8E
		if(Flame == none)
		{
			Flame = Spawn(Class'BallisticProV55.RX22ASpray', Instigator,, GetModeTipLocation(), Rotator(mHitLocation - (GetModeTipLocation())));
		}
		// End:0xB4
		if(Instigator.IsFirstPerson())
		{
			Flame.bHidden = true;			
		}
		else
		{
			Flame.bHidden = false;
			Flame.SetLocation(GetModeTipLocation());
			Flame.SetRotation(Rotator(mHitLocation - Flame.Location));
		}
		Flame.SetFlameRange(VSize(mHitLocation - Flame.Location));
		// End:0x15B
		if(RX22AFlamer(Instigator.Weapon) != none)
		{
			RX22AFlamer(Instigator.Weapon).Flame = Flame;
		}
		FlyByEffects(Mode, mHitLocation);
		// End:0x1F5
		if(int(Level.NetMode) == int(NM_Client))
		{
			Dir = Normal(mHitLocation - (Instigator.Location + Instigator.EyePosition()));
			End = mHitLocation + (Dir * float(20));
			mHitActor = Trace(mHitLocation, mHitNormal, End, End - (Dir * float(40)), false);
		}
		// End:0x288
		if(mHitActor != none)
		{
			i = FlameHits.Length;
			FlameHits.Length = i + 1;
			FlameHits[i].HitLoc = mHitLocation;
			FlameHits[i].HitNorm = mHitNormal;
			FlameHits[i].HitTime = Level.TimeSeconds + (VSize(Instigator.Location - mHitLocation) / float(3600));
		}		
	}
	else
	{
		// End:0x3CB
		if(int(Mode) == 1)
		{
			// End:0x2CA
			if(Flame != none)
			{
				Flame.Kill();
				Flame.bHidden = false;
				Flame = none;
			}
			// End:0x2FE
			if(GasSpray == none)
			{
				GasSpray = Spawn(Class'BallisticProV55.RX22AGasSpray', Instigator,, GetModeTipLocation(), Rotator(mHitLocation - (GetModeTipLocation())));
			}
			// End:0x324
			if(Instigator.IsFirstPerson())
			{
				GasSpray.bHidden = true;				
			}
			else
			{
				GasSpray.bHidden = false;
				GasSpray.SetLocation(GetModeTipLocation());
				GasSpray.SetRotation(Rotator(mHitLocation - GasSpray.Location));
			}
			GasSpray.SetFlameRange(VSize(mHitLocation - GasSpray.Location));
			// End:0x3CB
			if(RX22AFlamer(Instigator.Weapon) != none)
			{
				RX22AFlamer(Instigator.Weapon).GasSpray = GasSpray;
			}
		}
	}
	//return;	
}

simulated function StopSpray()
{
	// End:0x32
	if(Flame != none)
	{
		Flame.Kill();
		Flame.bHidden = false;
		Flame = none;
	}
	// End:0x71
	if((Instigator != none) && RX22AFlamer(Instigator.Weapon) != none)
	{
		Instigator.Weapon.AmbientSound = none;
	}
	// End:0xA3
	if(GasSpray != none)
	{
		GasSpray.Kill();
		GasSpray.bHidden = false;
		GasSpray = none;
	}
	// End:0xC9
	if(MuzzleFlash != none)
	{
		Emitter(MuzzleFlash).Kill();
		MuzzleFlash = none;
	}
	// End:0xEF
	if(AltMuzzleFlash != none)
	{
		Emitter(AltMuzzleFlash).Kill();
		AltMuzzleFlash = none;
	}
	//return;	
}

simulated event Destroyed()
{
	EndFlameHit();
	// End:0x20
	if(GasTank != none)
	{
		GasTank.AttachmentDestroyed();
	}
	// End:0x37
	if(Ignition != none)
	{
		Ignition.Destroy();
	}
	// End:0x51
	if(Flame != none)
	{
		Flame.Kill();
	}
	// End:0x6B
	if(GasSpray != none)
	{
		GasSpray.Kill();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RX22AFlamer'
	MuzzleFlashClass=Class'BallisticProV55.RX22AMuzzleFlame'
	WeaponLightTime=0.3000000
	FlashScale=2.0000000
	FlyBySound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FlyBy',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.7250000
	bHeavy=true
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.RX22A_TPm'
	DrawScale=0.2500000
}
