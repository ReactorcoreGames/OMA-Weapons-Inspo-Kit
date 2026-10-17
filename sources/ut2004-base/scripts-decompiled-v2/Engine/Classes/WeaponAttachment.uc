class WeaponAttachment extends InventoryAttachment
	native
	nativereplication
	notplaceable;

var byte FlashCount;
var byte FiringMode;
var byte SpawnHitCount;
var bool bAutoFire;
var float FiringSpeed;
var Vector mHitLocation;
var bool bMatchWeapons;
var Color BeaconColor;
var Class<Actor> SplashEffect;

replication
{
	// Pos:0x000
	reliable if((bNetDirty && (!bNetOwner || bDemoRecording) || bRepClientDemo) && int(Role) == int(ROLE_Authority))
		FiringMode, FlashCount, 
		bAutoFire;

	// Pos:0x03B
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		SpawnHitCount, mHitLocation;
}

simulated event ThirdPersonEffects()
{
	// End:0x4D
	if(Instigator != none)
	{
		// End:0x34
		if(int(FiringMode) == 1)
		{
			Instigator.PlayFiring(1.0000000, '1');			
		}
		else
		{
			Instigator.PlayFiring(1.0000000, '0');
		}
	}
	//return;	
}

simulated function CheckForSplash()
{
	local Actor HitActor;
	local Vector HitNormal, HitLocation;

	// End:0xE9
	if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && SplashEffect != none) && !Instigator.PhysicsVolume.bWaterVolume)
	{
		bTraceWater = true;
		HitActor = Trace(HitLocation, HitNormal, mHitLocation, Instigator.Location, true);
		bTraceWater = false;
		// End:0xE9
		if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
		{
			Spawn(SplashEffect,,, HitLocation, rot(16384, 0, 0));
		}
	}
	//return;	
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	//return;	
}

defaultproperties
{
	FiringSpeed=1.0000000
	BeaconColor=(R=0,G=255,B=0,A=255)
	CullDistance=4000.0000000
	bActorShadows=true
	bReplicateInstigator=true
	NetUpdateFrequency=8.0000000
}
