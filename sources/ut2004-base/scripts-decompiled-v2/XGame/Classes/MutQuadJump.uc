class MutQuadJump extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ModifyPlayer(Pawn Other)
{
	local xPawn X;

	X = xPawn(Other);
	// End:0x4E
	if(X != none)
	{
		X.MaxMultiJump = 3;
		X.MultiJumpRemaining = 3;
		X.MultiJumpBoost = 50;
	}
	super.ModifyPlayer(Other);
	//return;	
}

defaultproperties
{
	GroupName="Jumping"
	FriendlyName="QuadJump"
	Description="When double jump just isn't enough."
}
