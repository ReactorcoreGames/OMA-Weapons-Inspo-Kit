class UDamageRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ScoreKill(Controller Killer, Controller Killed)
{
	local xPawn Dying;

	// End:0x89
	if(((Killer != none) && Killer != Killed) && HasUDamage(Killed))
	{
		Dying = xPawn(Killed.Pawn);
		// End:0x89
		if((Dying != none) && Dying.UDamageTime > (Level.TimeSeconds + float(3)))
		{
			ThrowUDamage(Killer, Dying);
		}
	}
	super.ScoreKill(Killer, Killed);
	//return;	
}

function bool HasUDamage(Controller Killed)
{
	// End:0x40
	if(((Killed != none) && Killed.Pawn != none) && Killed.Pawn.HasUDamage())
	{
		return true;
	}
	return false;
	//return;	
}

function ThrowUDamage(Controller Killer, xPawn Killed)
{
	local Vector tossdir, X, Y, Z;
	local UDamageReward Reward;

	// End:0x1A
	if((Killer == none) || Killed == none)
	{
		return;
	}
	Reward = Spawn(Class'XGame.UDamageReward',,, Killed.Location);
	// End:0x128
	if(Reward != none)
	{
		tossdir = GetThrowVector(Killer, Killed);
		Killed.GetAxes(Killed.Rotation, X, Y, Z);
		// End:0x128
		if(Reward.SetLocation((Killed.Location + ((0.8000000 * Killed.CollisionRadius) * X)) + ((-0.5000000 * Killed.CollisionRadius) * Y)) && Reward != none)
		{
			Reward.Velocity = tossdir;
			Reward.InitDrop(Killed.UDamageTime - Level.TimeSeconds);
		}
	}
	//return;	
}

function Vector GetThrowVector(Controller Killer, xPawn Killed)
{
	local Vector V;

	// End:0x1E
	if((Killer == none) || Killed == none)
	{
		return V;
	}
	V = Vector(Killed.GetViewRotation());
	V = (V * ((Killed.Velocity Dot V) + float(100))) + vect(0.0000000, 0.0000000, 200.0000000);
	return V;
	//return;	
}

