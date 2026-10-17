class APodSecondaryFire extends BallisticMeleeFire;

event ModeDoFire()
{
	local Vector Start, HitLoc, HitNorm, End;
	local Actor t;

	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(120));
	t = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xE9
	if((t != none) && ((xPawn(t) != none) && Instigator.GetTeamNum() == xPawn(t).GetTeamNum()) && Level.Game.bTeamGame)
	{
		FireAnim = 'UseOnAlly';		
	}
	else
	{
		FireAnim = 'UseOnSelf';
	}
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

	// End:0x120 [Loop If]
	if(i < SwipeHits.Length)
	{
		GiveAdrenaline(SwipeHits[i].Victim, SwipeHits[i].HitLoc, StartTrace, SwipeHits[i].HitDir, 0, 0);
		Log(string(SwipeHits[i].Victim));
		i++;
		// [Loop Continue]
		goto J0xB5;
	}
	SwipeHits.Length = 0;
	//return;	
}

function GiveAdrenaline(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
{
	local xPawn Victim;

	Log("At start of GiveAdrenaline");
	Victim = xPawn(Other);
	Log("Victim is: " $ string(Victim));
	// End:0x9A
	if(Victim == none)
	{
		Log("GIve adrenaline to self");
		Instigator.Controller.AwardAdrenaline(APodCapsule(BW).AdrenalineAmount);		
	}
	else
	{
		Log("Victim adrenaline before: " $ string(Victim.Controller.Adrenaline));
		Victim.Controller.AwardAdrenaline(APodCapsule(BW).AdrenalineAmount);
		Log("Victim adrenaline after: " $ string(Victim.Controller.Adrenaline));
	}
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
{
	//return;	
}

defaultproperties
{
	bAISilent=true
	FireAnim="UseOnSelf"
	FireAnimRate=1.5000000
	FireRate=2.5500000
	AmmoClass=Class'BWBP_SWC_Pro.Ammo_APod'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
}
