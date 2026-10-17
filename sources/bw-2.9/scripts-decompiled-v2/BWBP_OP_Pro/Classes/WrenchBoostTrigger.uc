class WrenchBoostTrigger extends Trigger;

var float ZForce;
var float BoostForce;
var Sound JumpSound;
var byte Team;

event Touch(Actor Other)
{
	// End:0x92
	if((xPawn(Other) != none) && (int(Team) == 255) || (xPawn(Other).PlayerReplicationInfo != none) && xPawn(Other).PlayerReplicationInfo.Team.TeamIndex == int(Team))
	{
		PendingTouch = Other.PendingTouch;
		Other.PendingTouch = self;
	}
	//return;	
}

event PostTouch(Actor Other)
{
	local Vector Dir;

	// End:0xE5
	if(xPawn(Other) != none)
	{
		Dir = Normal(Other.Velocity);
		Dir.Z = 0.0000000;
		// End:0x5D
		if(int(Other.Physics) == int(1))
		{
			Other.SetPhysics(2);
		}
		Other.Velocity.Z = ZForce;
		Other.Velocity += (Dir * BoostForce);
		Other.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		Other.PlaySound(JumpSound);
		// End:0xE5
		if(BallisticPawn(Other) != none)
		{
			Pawn(Other).bDirectHitWall = true;
		}
	}
	//return;	
}

defaultproperties
{
	ZForce=1100.0000000
	JumpSound=Sound'PickupSounds.AdrenelinPickup'
	TransientSoundVolume=1.0000000
	CollisionRadius=64.0000000
	CollisionHeight=32.0000000
}
