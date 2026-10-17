class RX22ASecondaryFire extends BallisticFire;

function RX22AFireControl GetFireControl()
{
	return RX22AFlamer(Weapon).GetFireControl();
	//return;	
}

function float MaxRange()
{
	return 800.0000000;
	//return;	
}

function bool HookFire(Vector Start, Vector Dir, float dist, out Vector HitLoc)
{
	local int i;
	local bool bFoundFire;
	local float NodeDist, DR;
	local Vector hl;

	hl = HitLoc;
	i = 0;
	J0x12:

	// End:0x1F1 [Loop If]
	if(i < GetFireControl().GasNodes.Length)
	{
		// End:0x4A
		if(GetFireControl().GasNodes[i] == none)
		{
			// [Explicit Continue]
			goto J0x1E7;
		}
		// End:0xB1
		if(((RX22AGasCloud(GetFireControl().GasNodes[i]) != none) || RX22AGasPatch(GetFireControl().GasNodes[i]) != none) || RX22AGasSoak(GetFireControl().GasNodes[i]) != none)
		{
			// [Explicit Continue]
			goto J0x1E7;
		}
		NodeDist = VSize(GetFireControl().GasNodes[i].Location - Start);
		// End:0xF0
		if(NodeDist > dist)
		{
			// [Explicit Continue]
			goto J0x1E7;
		}
		DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - Start);
		// End:0x136
		if(DR < 0.7500000)
		{
			// [Explicit Continue]
			goto J0x1E7;
		}
		hl = Start + (Dir * NodeDist);
		NodeDist = VSize(GetFireControl().GasNodes[i].Location - (Start + (Dir * (DR * NodeDist))));
		// End:0x1A2
		if(NodeDist > float(96))
		{
			// [Explicit Continue]
			goto J0x1E7;
		}
		HitLoc = Start + (Dir * NodeDist);
		GetFireControl().GasNodes[i].AddFuel(1.0000000);
		bFoundFire = true;
		J0x1E7:

		i++;
		// [Loop Continue]
		goto J0x12;
	}
	HitLoc = hl;
	return bFoundFire;
	//return;	
}

function DoFireEffect()
{
	local Vector Start, Dir, End, HitLoc, HitNorm;

	local Actor t;
	local int i;

	Start = Instigator.Location + Instigator.EyePosition();
	Dir = Vector(Rotator((GetFireSpread()) >> (GetFireAim(Start))));
	End = Start + (Dir * (MaxRange()));
	Weapon.bTraceWater = true;
	i = 0;
	J0x75:

	// End:0x11A [Loop If]
	if(i < 20)
	{
		t = Trace(HitLoc, HitNorm, End, Start, true);
		// End:0xDB
		if((t == none) || (t != Instigator) && t.Base != Instigator)
		{
			// [Explicit Break]
			goto J0x11A;
		}
		Start = HitLoc + (Dir * FMax(32.0000000, (t.CollisionRadius * float(2)) + float(4)));
		i++;
		// [Loop Continue]
		goto J0x75;
	}
	J0x11A:

	Weapon.bTraceWater = false;
	// End:0x184
	if(t == none)
	{
		HitLoc = End;
		// End:0x181
		if(!HookFire(Start, Dir, (MaxRange()) + float(128), HitLoc))
		{
			GetFireControl().SprayAir(HitLoc, Instigator);
		}		
	}
	else
	{
		// End:0x1D9
		if(Pawn(t) != none)
		{
			// End:0x1D6
			if(!HookFire(Start, Dir, VSize(HitLoc - Start), HitLoc))
			{
				GetFireControl().SpraySoak(t, Instigator);
			}			
		}
		else
		{
			// End:0x225
			if(!HookFire(Start, Dir, VSize(HitLoc - Start), HitLoc))
			{
				GetFireControl().SprayWall(HitLoc, HitNorm, Instigator, t);
			}
		}
	}
	SendFireEffect(t, HitLoc, HitNorm, 0);
	//return;	
}

function PlayFiring()
{
	BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	Weapon.AmbientSound = BallisticFireSound.Sound;
	//return;	
}

function ServerPlayFiring()
{
	Weapon.AmbientSound = BallisticFireSound.Sound;
	//return;	
}

function StopFiring()
{
	RX22AFlamer(Weapon).AmbientSound = none;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x6F
	if((!super.AllowFire() || Instigator.HeadVolume.bWaterVolume) || Weapon.GetFireMode(0).NextFireTime > (Level.TimeSeconds - 0.2000000))
	{
		// End:0x6D
		if(IsFiring())
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

defaultproperties
{
	FireRecoil=32.0000000
	XInaccuracy=128.0000000
	YInaccuracy=128.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FuelLoop',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1000000
	AmmoClass=Class'BallisticProV55.Ammo_FlamerGas'
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=64.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.5000000
}
