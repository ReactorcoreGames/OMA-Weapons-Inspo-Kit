class ONSRVWebProjectileLeader extends ONSRVWebProjectile
	native
	nativereplication;

var() float SpringLength;
var() float SpringStiffness;
var() float StuckSpringStiffness;
var() float SpringDamping;
var() float SpringMaxForce;
var() float SpringExplodeLength;
var() float ProjVelDamping;
var() float ProjStuckNeighbourVelDamping;
var() InterpCurve ProjGravityScale;
var() bool bEnableSuckTargetForce;
var() bool bSymmetricSuckTarget;
var() bool bSuckFriendlyActor;
var() bool bNoSuckFromBelow;
var() bool bOnlySuckToDriven;
var() array< Class<Vehicle> > SuckTargetClasses;
var() float SuckTargetRange;
var() float SuckTargetForce;
var() Vector SuckTargetOffset;
var() float SuckReduceVelFactor;
var byte ProjTeam;
var float FireTime;
var array<ONSRVWebProjectile> Projectiles;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		ProjTeam;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	FireTime = Level.TimeSeconds;
	//return;	
}

event DetonateWeb()
{
	local int i;

	i = 1;
	J0x07:

	// End:0x6F [Loop If]
	if(i < Projectiles.Length)
	{
		// End:0x65
		if(Projectiles[i] != none)
		{
			Projectiles[i].Explode(Projectiles[i].Location, Projectiles[i].StuckNormal);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	self.Explode(self.Location, self.StuckNormal);
	//return;	
}

simulated function NotifyStuck()
{
	SpringStiffness = StuckSpringStiffness;
	//return;	
}

defaultproperties
{
	SpringLength=50.0000000
	SpringStiffness=5.0000000
	StuckSpringStiffness=50.0000000
	SpringDamping=6.0000000
	SpringMaxForce=4500.0000000
	SpringExplodeLength=1250.0000000
	ProjStuckNeighbourVelDamping=2.0000000
	ProjGravityScale=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=4.0000000,OutVal=0.0000000),(InVal=5.0000000,OutVal=0.5000000),(InVal=1000000.0000000,OutVal=0.5000000)))
	bEnableSuckTargetForce=true
	bSymmetricSuckTarget=true
	bOnlySuckToDriven=true
	SuckTargetClasses[0]=Class'Onslaught.ONSHoverBike'
	SuckTargetRange=275.0000000
	SuckTargetForce=6500.0000000
	SuckTargetOffset=(X=25.0000000,Y=80.0000000,Z=-10.0000000)
	SuckReduceVelFactor=0.9000000
}
