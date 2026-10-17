class BallisticShield extends Actor
	notplaceable;

var Sound ShieldHitSound;
var float EffectiveThickness;

function bool BlocksShotAt(Actor Other)
{
	return true;
	//return;	
}

defaultproperties
{
	ShieldHitSound=Sound'ONSVehicleSounds-S.ShieldHit'
	EffectiveThickness=768.0000000
	DrawType=8
	bStasis=true
	bAcceptsProjectors=false
	bIgnoreEncroachers=true
	RemoteRole=2
	bMovable=false
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bCollideActors=true
	bBlockProjectiles=true
	bProjTarget=true
}
