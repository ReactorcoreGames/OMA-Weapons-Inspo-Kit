class MACBeacon extends MACShell;

simulated function PostBeginPlay()
{
	super(BallisticProjectile).PostBeginPlay();
	//return;	
}

simulated function InitEffects()
{
	local Rotator LR;

	super(BallisticProjectile).InitEffects();
	// End:0xBA
	if((Owner != none) && MACWeapon(Owner) != none)
	{
		// End:0x58
		if(Owner.Instigator != none)
		{
			LR = Owner.Instigator.GetViewRotation();			
		}
		else
		{
			LR = Rotation;
		}
		// End:0x9A
		if(Trail != none)
		{
			MACWeapon(Owner).AddBeacon(self, Location, LR, MACBeaconTrail(Trail));			
		}
		else
		{
			MACWeapon(Owner).AddBeacon(self, Location, LR, none);
		}
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local MACExplodeSphere Sphere;

	Sphere = Spawn(Class'BallisticProV55.MACExplodeSphere', self,, HitLocation);
	// End:0x51
	if((Owner != none) && MACWeapon(Owner) != none)
	{
		MACWeapon(Owner).BeaconHit(self, HitLocation, Sphere);
	}
	Destroy();
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x80
	if(Trail != none)
	{
		// End:0x74
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Emitters[0].Disabled = true;
			Emitter(Trail).Emitters[1].Disabled = true;
			Emitter(Trail).Kill();			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

defaultproperties
{
	TrailClass=Class'BallisticProV55.MACBeaconTrail'
	bWarnEnemy=false
	StaticMesh=none
	RemoteRole=0
	bCanBeDamaged=false
	bDisturbFluidSurface=false
}
