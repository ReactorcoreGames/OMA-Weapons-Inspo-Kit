class ONSPowerCoreShield extends Actor
	notplaceable;

var Material TeamSkins[2];
var Sound ShieldHitSound;
var float ImmediateWarningEndTime;
var int DamageCounter;
var PlayerController LastDamagedBy;

simulated function SetTeam(byte Team)
{
	ImmediateWarningEndTime = Level.TimeSeconds + float(5);
	// End:0x3D
	if(int(Team) < 2)
	{
		Skins[0] = TeamSkins[int(Team)];
	}
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local PlayerController PC;

	// End:0x35
	if(((Damage <= 0) || EventInstigator == none) || int(EventInstigator.Role) < int(ROLE_Authority))
	{
		return;
	}
	Owner.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);
	PC = PlayerController(EventInstigator.Controller);
	// End:0x10D
	if(PC != none)
	{
		// End:0xB0
		if(Level.TimeSeconds < ImmediateWarningEndTime)
		{
			PC.ClientPlaySound(ShieldHitSound);			
		}
		else
		{
			// End:0xD8
			if(PC != LastDamagedBy)
			{
				DamageCounter = Damage;
				LastDamagedBy = PC;				
			}
			else
			{
				DamageCounter += Damage;
			}
			// End:0x10D
			if(DamageCounter > 200)
			{
				PC.ClientPlaySound(ShieldHitSound);
				DamageCounter -= 200;
			}
		}
	}
	//return;	
}

simulated function bool TeamLink(int TeamNum)
{
	// End:0x20
	if(Owner != none)
	{
		return Owner.TeamLink(TeamNum);
	}
	return false;
	//return;	
}

simulated function Touch(Actor Other)
{
	// End:0x85
	if(Projectile(Other) != none)
	{
		TakeDamage(1, Other.Instigator, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), Projectile(Other).MyDamageType);
		Projectile(Other).Explode(Other.Location, Normal(Other.Velocity));
	}
	//return;	
}

function bool BlocksShotAt(Actor Other)
{
	// End:0x30
	if((Other == Owner) || Other == ONSPowerCore(Owner).ShootTarget)
	{
		return false;
	}
	return true;
	//return;	
}

defaultproperties
{
	TeamSkins[1]=FinalBlend'AW-ShieldShaders.Shaders.BlueShieldFinal'
	ShieldHitSound=Sound'ONSVehicleSounds-S.ShieldHit'
	DrawType=8
	StaticMesh=StaticMesh'AW-ShieldShaders.ONS.EnergonShield'
	bHidden=true
	bStasis=true
	bAcceptsProjectors=false
	bIgnoreEncroachers=true
	RemoteRole=0
	DrawScale3D=(X=2.0000000,Y=2.0000000,Z=1.0000000)
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	bMovable=false
	CollisionRadius=215.0000000
	CollisionHeight=190.0000000
	bProjTarget=true
	bUseCylinderCollision=true
}
