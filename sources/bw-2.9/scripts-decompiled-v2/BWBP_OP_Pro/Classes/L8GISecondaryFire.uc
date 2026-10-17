class L8GISecondaryFire extends BallisticMeleeFire;

event ModeDoFire()
{
	super.ModeDoFire();
	//return;	
}

function NotifiedDoFireEffect()
{
	local Vector StartTrace;
	local Rotator Aim, PointAim;
	local int i;

	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	i = 0;
	J0x2E:

	// End:0xAE [Loop If]
	if(i < NumSwipePoints)
	{
		// End:0x56
		if(SwipePoints[i].Weight < 0)
		{
			// [Explicit Continue]
			goto J0xA4;
		}
		PointAim = Rotator(Vector(SwipePoints[i].offset) >> Aim);
		MeleeDoTrace(StartTrace, PointAim, i == WallHitPoint, SwipePoints[i].Weight);
		J0xA4:

		i++;
		// [Loop Continue]
		goto J0x2E;
	}
	i = 0;
	J0xB5:

	// End:0xCF [Loop If]
	if(i < SwipeHits.Length)
	{
		i++;
		// [Loop Continue]
		goto J0xB5;
	}
	SwipeHits.Length = 0;
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
{
	//return;	
}

defaultproperties
{
	bAISilent=true
	FireAnim="putaway"
	FireRate=2.8500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_L8GI'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
}
