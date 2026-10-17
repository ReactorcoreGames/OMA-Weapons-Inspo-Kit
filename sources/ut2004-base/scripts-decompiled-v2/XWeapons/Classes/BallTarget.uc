class BallTarget extends WeaponFire;

var() float AimCone;
var() float MaxDist;

simulated function bool AllowFire()
{
	return true;
	//return;	
}

function DoFireEffect()
{
	local UnrealPawn P;
	local Pawn bestP;
	local float bestWt;
	local Vector toPawn, eyeDir;
	local float cosdot, curwt, curdist, curdot;

	// End:0x50
	if(((int(Instigator.Role) < int(ROLE_Authority)) || Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none)
	{
		return;
	}
	bestP = none;
	cosdot = Cos((AimCone * 3.1415930) / float(180));
	eyeDir = Vector(Instigator.Controller.Rotation);
	bestWt = 0.0000000;
	// End:0x1CD
	foreach Instigator.VisibleActors(Class'UnrealGame.UnrealPawn', P, MaxDist)
	{
		// End:0x117
		if(((P == Instigator) || P.PlayerReplicationInfo == none) || P.PlayerReplicationInfo.Team != Instigator.PlayerReplicationInfo.Team)
		{
			continue;			
		}
		toPawn = P.Location - Instigator.Location;
		curdot = Normal(toPawn) Dot eyeDir;
		curdist = VSize(toPawn);
		// End:0x16F
		if(curdot < cosdot)
		{
			continue;			
		}
		// End:0x182
		if(curdist > MaxDist)
		{
			continue;			
		}
		curwt = 1.0000000 - (curdist / MaxDist);
		curwt *= curdot;
		// End:0x1CC
		if(curwt > bestWt)
		{
			bestWt = curwt;
			bestP = P;
		}		
	}	
	BallLauncher(Weapon).SetPassTarget(bestP);
	//return;	
}

defaultproperties
{
	AimCone=20.0000000
	MaxDist=4000.0000000
	bFireOnRelease=true
	FireRate=0.2500000
	AmmoClass=Class'XWeapons.BallAmmo'
}
