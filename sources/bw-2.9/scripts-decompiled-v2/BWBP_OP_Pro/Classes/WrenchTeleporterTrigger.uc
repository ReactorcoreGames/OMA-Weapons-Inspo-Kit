class WrenchTeleporterTrigger extends Trigger;

var WrenchTeleporterTrigger OtherWarp;
var byte Team;

event UsedBy(Pawn Other)
{
	// End:0x1A
	if((OtherWarp == none) || OtherWarp == self)
	{
		return;
	}
	// End:0xB9
	if((((xPawn(Other) != none) && !xPawn(Other).bJustTeleported) && OtherWarp != none) && (int(Team) == 255) || xPawn(Other).PlayerReplicationInfo.Team.TeamIndex == int(Team))
	{
		PendingTouch = Other.PendingTouch;
		Other.PendingTouch = self;
	}
	//return;	
}

event PostTouch(Actor Other)
{
	local Controller OtherPlayer;

	// End:0x192
	if(xPawn(Other) != none)
	{
		// End:0x59
		if(!Other.SetLocation(OtherWarp.Location + vect(0.0000000, 0.0000000, 32.0000000)))
		{
			Log(string(self) $ " Teleport failed");
			return;
		}
		// End:0x13F
		if(int(Role) == int(ROLE_Authority))
		{
			OtherPlayer = Level.ControllerList;
			J0x7D:

			// End:0xC0 [Loop If]
			if(OtherPlayer != none)
			{
				// End:0xA9
				if(OtherPlayer.Enemy == self)
				{
					OtherPlayer.LineOfSightTo(self);
				}
				OtherPlayer = OtherPlayer.nextController;
				// [Loop Continue]
				goto J0x7D;
			}
			xPawn(Other).SetRotation(OtherWarp.Rotation);
			xPawn(Other).SetViewRotation(OtherWarp.Rotation);
			xPawn(Other).ClientSetRotation(OtherWarp.Rotation);
			Other.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		}
		// End:0x17A
		if(xPawn(Other).Controller != none)
		{
			xPawn(Other).Controller.MoveTimer = -1.0000000;
		}
		xPawn(Other).PlayTeleportEffect(true, true);
		return;
	}
	//return;	
}

defaultproperties
{
	CollisionRadius=64.0000000
	CollisionHeight=48.0000000
}
