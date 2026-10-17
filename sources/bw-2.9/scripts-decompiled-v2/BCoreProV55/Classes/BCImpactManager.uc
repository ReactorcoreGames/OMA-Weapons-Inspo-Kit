class BCImpactManager extends Effects;

const HF_NoEffects = 1;
const HF_NoSounds = 2;
const HF_NoDecals = 4;
const HF_NoVShake = 8;

var() array< Class<Actor> > HitEffects;
var() array< Class<Projector> > HitDecals;
var() float DecalScale;
var() array<Sound> HitSounds;
var() float HitSoundVolume;
var() float HitSoundRadius;
var() float HitSoundPitch;
var() float HitDelay;
var() float EffectBackOff;
var Vector HitNorm;
var int HitSurf;
var byte HitFlags;
var() bool bOptimize;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() float ShakeRadius;
var() bool bShakeOnWaterHit;

simulated function PostNetBeginPlay()
{
	local Actor t;
	local Vector HitLocation;
	local Material HitMat;

	super(Actor).PostNetBeginPlay();
	// End:0x21
	if(HitDelay >= LifeSpan)
	{
		LifeSpan += HitDelay;
	}
	// End:0xA5
	if(int(Role) < int(ROLE_Authority))
	{
		t = Trace(HitLocation, HitNorm, Location - (Vector(Rotation) * float(5)), Location, false,, HitMat);
		// End:0xA5
		if(t.bWorldGeometry && t.bProjTarget)
		{
			Initialize(int(HitMat.SurfaceType), HitNorm);
		}
	}
	//return;	
}

simulated function Initialize(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	HitSurf = HitSurfaceType;
	HitNorm = Norm;
	HitFlags = Flags;
	// End:0x3C
	if(HitDelay > 0.0000000)
	{
		SetTimer(HitDelay, false);		
	}
	else
	{
		SpawnEffects(HitSurf, HitNorm, Flags);
	}
	//return;	
}

simulated event Timer()
{
	SpawnEffects(HitSurf, HitNorm, HitFlags);
	//return;	
}

simulated function SpawnEffects(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	local Projector P;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x9C
	if((HitSounds.Length > 0) && (int(Flags) & 2) == 0)
	{
		// End:0x6A
		if(HitSurfaceType >= HitSounds.Length)
		{
			PlaySound(HitSounds[0], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);			
		}
		else
		{
			// End:0x9C
			if(HitSounds[HitSurfaceType] != none)
			{
				PlaySound(HitSounds[HitSurfaceType], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);
			}
		}
	}
	// End:0xDB
	if(((ShakeRadius > float(0)) && (int(Flags) & 8) == 0) && (HitSurfaceType != 9) || bShakeOnWaterHit)
	{
		DoViewShake();
	}
	// End:0x101
	if((int(Level.DetailMode) == int(0)) && bOptimize)
	{
		return;
	}
	// End:0x189
	if((HitEffects.Length > 0) && (int(Flags) & 1) == 0)
	{
		// End:0x15A
		if(HitSurfaceType >= HitEffects.Length)
		{
			Spawn(HitEffects[0], Owner,, Location + (EffectBackOff * Norm), Rotation);			
		}
		else
		{
			// End:0x189
			if(HitEffects[HitSurfaceType] != none)
			{
				Spawn(HitEffects[HitSurfaceType], Owner,, Location, Rotation);
			}
		}
	}
	// End:0x1A4
	if(int(Level.DetailMode) < int(2))
	{
		return;
	}
	// End:0x294
	if((HitDecals.Length > 0) && (int(Flags) & 4) == 0)
	{
		// End:0x1FA
		if(HitSurfaceType >= HitDecals.Length)
		{
			P = Spawn(HitDecals[0], Owner,, Location, Rotator(-Norm));			
		}
		else
		{
			// End:0x233
			if(HitDecals[HitSurfaceType] != none)
			{
				P = Spawn(HitDecals[HitSurfaceType], Owner,, Location, Rotator(-Norm));
			}
		}
		// End:0x294
		if((BallisticDecal(P) != none) && BallisticDecal(P).bWaitForInit)
		{
			P.SetDrawScale(P.DrawScale * DecalScale);
			BallisticDecal(P).InitDecal();
		}
	}
	//return;	
}

simulated function DoViewShake()
{
	local PlayerController PC;
	local float dist, ScaleFactor;

	PC = Level.GetLocalPlayerController();
	// End:0xE2
	if((PC != none) && PC.ViewTarget != none)
	{
		dist = VSize(Location - PC.ViewTarget.Location);
		// End:0xE2
		if(dist < ShakeRadius)
		{
			// End:0x8E
			if(dist < (ShakeRadius / float(3)))
			{
				ScaleFactor = 1.0000000;				
			}
			else
			{
				ScaleFactor = (ShakeRadius - dist) / ShakeRadius;
			}
			PC.ShakeView(ShakeRotMag * ScaleFactor, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * ScaleFactor, ShakeOffsetRate, ShakeOffsetTime);
		}
	}
	//return;	
}

static function StartSpawn(Vector V, Vector Norm, int Surface, Actor OwnedBy, optional byte Flags)
{
	local BCImpactManager EM;

	// End:0x0D
	if(OwnedBy == none)
	{
		return;
	}
	EM = OwnedBy.Spawn(default.Class, OwnedBy,, V, Rotator(Norm));
	// End:0x7F
	if(EM == none)
	{
		Log("Failed to spawn effect manager for class: " $ string(default.Class), 'Warning');
		return;
	}
	EM.Initialize(Surface, Norm, Flags);
	//return;	
}

defaultproperties
{
	DecalScale=1.0000000
	HitSoundVolume=0.5000000
	HitSoundRadius=64.0000000
	HitSoundPitch=1.0000000
	DrawType=0
	bHidden=true
	bNetTemporary=false
	LifeSpan=0.1000000
}
