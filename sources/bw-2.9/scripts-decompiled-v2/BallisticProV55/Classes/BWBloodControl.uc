class BWBloodControl extends Actor
	config(BallisticProV55)
	notplaceable;

var xPawn Corpse;
var Vector LastDragLocation;
var float LastImpactTime;
var BallisticDecal BloodPool;
var Emitter WaterBlood;
var() float MinDragDistance;
var() float LowImpactVelocity;
var() float HighImpactVelocity;
var() float MaxPoolVelocity;
var() Class<BallisticBloodSet> BloodSet;
var Class<DamageType> DamageType;
var bool bInitialized;
var() globalconfig bool bUseBloodDrags;
var() globalconfig bool bUseBloodImpacts;
var() globalconfig bool bUseBloodPools;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		DamageType;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1E
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		Destroy();		
	}
	else
	{
		SetTimer(0.0500000, false);
	}
	//return;	
}

simulated function FindCorpse()
{
	local xPawn P;

	// End:0x5E
	foreach DynamicActors(Class'XGame.xPawn', P)
	{
		// End:0x5D
		if((P.Health < 1) && P.Tag != 'BloodyCorpse')
		{
			P.Tag = 'BloodyCorpse';
			Corpse = P;
		}		
	}	
	//return;	
}

simulated function Initialize(Class<DamageType> dt)
{
	DamageType = dt;
	// End:0x22
	if(!dt.default.bCausesBlood)
	{
		Destroy();
	}
	//return;	
}

simulated function Class<BallisticBloodSet> GetBloodSet(Pawn Victim)
{
	return Class'BallisticProV55.BWBloodSetHunter'.static.GetBloodSetFor(Victim);
	//return;	
}

simulated function Timer()
{
	// End:0x30
	if((Owner != none) && xPawn(Owner) != none)
	{
		Corpse = xPawn(Owner);		
	}
	else
	{
		FindCorpse();
	}
	BloodSet = GetBloodSet(Corpse);
	// End:0x6C
	if(int(Level.DetailMode) < int(2))
	{
		MinDragDistance *= 1.5000000;
	}
	bInitialized = true;
	//return;	
}

simulated function Destroyed()
{
	// End:0x1A
	if(WaterBlood != none)
	{
		WaterBlood.Kill();
	}
	// End:0x34
	if(BloodPool != none)
	{
		BloodPool.StopExpanding();
	}
	super.Destroyed();
	//return;	
}

simulated function Tick(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm;
	local Rotator R;

	// End:0x10
	if(!bInitialized)
	{
		return;		
	}
	else
	{
		// End:0x34
		if((Corpse == none) || Corpse.bDeRes)
		{
			Destroy();
			return;
		}
	}
	// End:0xD2
	if(bUseBloodPools && Corpse.PhysicsVolume.bWaterVolume)
	{
		// End:0x7B
		if(BloodPool != none)
		{
			BloodPool.StopExpanding();
			BloodPool = none;
		}
		// End:0xD0
		if(WaterBlood == none)
		{
			WaterBlood = Spawn(BloodSet.default.WaterBloodClass, Corpse,, Corpse.Location, Corpse.Rotation);
			WaterBlood.SetBase(Corpse);
		}
		return;
	}
	// End:0xF3
	if(WaterBlood != none)
	{
		WaterBlood.Kill();
		WaterBlood = none;
	}
	// End:0x1F2
	if((bUseBloodDrags && VSize(Corpse.Location - LastDragLocation) > MinDragDistance) && !FastTrace(Corpse.Location - vect(0.0000000, 0.0000000, 30.0000000), Corpse.Location))
	{
		// End:0x175
		if(BloodPool != none)
		{
			BloodPool.StopExpanding();
			BloodPool = none;
		}
		LastDragLocation = Corpse.Location;
		// End:0x1F2
		if(int(Level.DetailMode) > int(0))
		{
			R = Rotator(Corpse.Velocity);
			R.Pitch = -16384;
			Spawn(BloodSet.default.DragDecal, Corpse,, Corpse.Location, R);
		}
	}
	// End:0x31C
	if((bUseBloodImpacts && (Level.TimeSeconds - LastImpactTime) > 1.0000000) && VSize(Corpse.Velocity) > LowImpactVelocity)
	{
		t = Trace(HitLoc, HitNorm, Corpse.Location + (Corpse.Velocity * dt), Corpse.Location, false);
		// End:0x319
		if((t != none) && t.bWorldGeometry)
		{
			LastImpactTime = Level.TimeSeconds;
			// End:0x2F4
			if(VSize(Corpse.Velocity) > HighImpactVelocity)
			{
				Spawn(BloodSet.default.HighImpactDecal, Corpse,, HitLoc, Rotator(-HitNorm));				
			}
			else
			{
				Spawn(BloodSet.default.LowImpactDecal, Corpse,, HitLoc, Rotator(-HitNorm));
			}
		}		
	}
	else
	{
		// End:0x38F
		if(((bUseBloodPools && BloodPool == none) && VSize(Corpse.Velocity) < MaxPoolVelocity) && bInitialized)
		{
			BloodPool = Spawn(BloodSet.default.BloodPool,,, Corpse.Location, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		}
	}
	//return;	
}

defaultproperties
{
	MinDragDistance=50.0000000
	LowImpactVelocity=500.0000000
	HighImpactVelocity=1000.0000000
	MaxPoolVelocity=50.0000000
	bUseBloodDrags=true
	bUseBloodImpacts=true
	bUseBloodPools=true
	bHidden=true
	bNetTemporary=true
	bAlwaysRelevant=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
}
