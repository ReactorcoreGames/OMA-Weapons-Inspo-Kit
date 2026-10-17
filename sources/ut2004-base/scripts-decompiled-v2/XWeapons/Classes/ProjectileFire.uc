class ProjectileFire extends WeaponFire;

var() int ProjPerFire;
var() Vector ProjSpawnOffset;

function DoFireEffect()
{
	local Vector StartProj, StartTrace, X, Y, Z;

	local Rotator R, Aim;
	local Vector HitLocation, HitNormal;
	local Actor Other;
	local int P, SpawnCount;
	local float theta;

	Instigator.MakeNoise(1.0000000);
	Weapon.GetViewAxes(X, Y, Z);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	StartProj = StartTrace + (X * ProjSpawnOffset.X);
	// End:0xC7
	if(!Weapon.WeaponCentered())
	{
		StartProj = (StartProj + ((Weapon.hand * Y) * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
	}
	Other = Weapon.Trace(HitLocation, HitNormal, StartProj, StartTrace, false);
	// End:0x104
	if(Other != none)
	{
		StartProj = HitLocation;
	}
	Aim = AdjustAim(StartProj, aimerror);
	SpawnCount = Max(1, ProjPerFire * int(load));
	switch(SpreadStyle)
	{
		// End:0x1DE
		case 1:
			X = Vector(Aim);
			P = 0;
			J0x151:

			// End:0x1DB [Loop If]
			if(P < SpawnCount)
			{
				R.Yaw = int(Spread * (FRand() - 0.5000000));
				R.Pitch = int(Spread * (FRand() - 0.5000000));
				R.Roll = int(Spread * (FRand() - 0.5000000));
				SpawnProjectile(StartProj, Rotator(X >> R));
				P++;
				// [Loop Continue]
				goto J0x151;
			}
			// End:0x29E
			break;
		// End:0x28B
		case 2:
			P = 0;
			J0x1EA:

			// End:0x288 [Loop If]
			if(P < SpawnCount)
			{
				theta = ((Spread * 3.1415930) / float(32768)) * (float(P) - (float(SpawnCount - 1) / 2.0000000));
				X.X = Cos(theta);
				X.Y = Sin(theta);
				X.Z = 0.0000000;
				SpawnProjectile(StartProj, Rotator(X >> Aim));
				P++;
				// [Loop Continue]
				goto J0x1EA;
			}
			// End:0x29E
			break;
		// End:0xFFFF
		default:
			SpawnProjectile(StartProj, Aim);
			break;
	}
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	// End:0x2E
	if(ProjectileClass != none)
	{
		P = Weapon.Spawn(ProjectileClass,,, Start, Dir);
	}
	// End:0x3B
	if(P == none)
	{
		return none;
	}
	P.Damage *= DamageAtten;
	return P;
	//return;	
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return (((Instigator.Location + Instigator.EyePosition()) + (X * ProjSpawnOffset.X)) + (Y * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
	//return;	
}

defaultproperties
{
	ProjPerFire=1
	ProjSpawnOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	bLeadTarget=true
	bInstantHit=false
	NoAmmoSound=ProceduralSound'WeaponSounds.PReload5.P1Reload5'
	WarnTargetPct=0.5000000
}
