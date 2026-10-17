class BallisticPlayerInput extends PlayerInput within PlayerController
	transient
	config(User);

var bool bDodgeHeld;

simulated exec function DodgeOn()
{
	bDodgeHeld = true;
	//return;	
}

simulated exec function DodgeOff()
{
	bDodgeHeld = false;
	//return;	
}

function Actor.EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
	local Actor.EDoubleClickDir DoubleClickMove, OldDoubleClick;

	// End:0x24
	if(int(Outer.DoubleClickDir) == int(5))
	{
		DoubleClickMove = 5;		
	}
	else
	{
		DoubleClickMove = 0;
	}
	// End:0x32B
	if(DoubleClickTime > 0.0000000)
	{
		// End:0xAB
		if(int(Outer.DoubleClickDir) == int(5))
		{
			// End:0xA8
			if((Outer.Pawn != none) && int(Outer.Pawn.Physics) == int(1))
			{
				DoubleClickTimer = 0.0000000;
				Outer.DoubleClickDir = 6;
			}			
		}
		else
		{
			// End:0x262
			if(int(Outer.DoubleClickDir) != int(6))
			{
				OldDoubleClick = Outer.DoubleClickDir;
				Outer.DoubleClickDir = 0;
				// End:0x127
				if(((bEnableDodging && bEdgeForward) || bDodgeHeld) && bWasForward)
				{
					Outer.DoubleClickDir = 3;					
				}
				else
				{
					// End:0x165
					if(((bEnableDodging && bEdgeBack) || bDodgeHeld) && bWasBack)
					{
						Outer.DoubleClickDir = 4;						
					}
					else
					{
						// End:0x1A3
						if(((bEnableDodging && bEdgeLeft) || bDodgeHeld) && bWasLeft)
						{
							Outer.DoubleClickDir = 1;							
						}
						else
						{
							// End:0x1DE
							if(((bEnableDodging && bEdgeRight) || bDodgeHeld) && bWasRight)
							{
								Outer.DoubleClickDir = 2;
							}
						}
					}
				}
				// End:0x20E
				if(int(Outer.DoubleClickDir) == int(0))
				{
					Outer.DoubleClickDir = OldDoubleClick;					
				}
				else
				{
					// End:0x246
					if(int(Outer.DoubleClickDir) != int(OldDoubleClick))
					{
						DoubleClickTimer = DoubleClickTime + (0.5000000 * DeltaTime);						
					}
					else
					{
						DoubleClickMove = Outer.DoubleClickDir;
						bDodgeHeld = false;
					}
				}
			}
		}
		// End:0x2C2
		if(int(Outer.DoubleClickDir) == int(6))
		{
			DoubleClickTimer = FMin(DoubleClickTimer - DeltaTime, 0.0000000);
			// End:0x2BF
			if(DoubleClickTimer < -0.3500000)
			{
				Outer.DoubleClickDir = 0;
				DoubleClickTimer = DoubleClickTime;
			}			
		}
		else
		{
			// End:0x32B
			if((int(Outer.DoubleClickDir) != int(0)) && int(Outer.DoubleClickDir) != int(5))
			{
				DoubleClickTimer -= DeltaTime;
				// End:0x32B
				if(DoubleClickTimer < float(0))
				{
					Outer.DoubleClickDir = 0;
					DoubleClickTimer = DoubleClickTime;
				}
			}
		}
	}
	return DoubleClickMove;
	//return;	
}

