class UDamageReward extends UDamagePack;

var() float FadeTime;

function InitDrop(float RemainingCharge)
{
	FadeTime = RemainingCharge + Level.TimeSeconds;
	SetPhysics(2);
	GotoState('FallingPickup');
	bAlwaysRelevant = false;
	bDropped = true;
	bIgnoreEncroachers = false;
	bIgnoreVehicles = true;
	MaxDesireability *= (RemainingCharge / float(30));
	NetUpdateFrequency = RemainingCharge;
	bUpdateSimulatedPosition = true;
	bOnlyReplicateHidden = false;
	LifeSpan = RemainingCharge * float(2);
	//return;	
}

auto state Pickup
{
	function Touch(Actor Other)
	{
		local Pawn P;
		local float NewTime;

		// End:0x9F
		if(ValidTouch(Other))
		{
			NewTime = FadeTime - Level.TimeSeconds;
			P = Pawn(Other);
			// End:0x7A
			if(xPawn(P) != none)
			{
				NewTime += float(Max(int(xPawn(P).UDamageTime - Level.TimeSeconds), 0));
			}
			P.EnableUDamage(NewTime);
			AnnouncePickup(P);
			SetRespawn();
		}
		//return;		
	}

	function BeginState()
	{
		// End:0x28
		if(bDropped)
		{
			AddToNavigation();
			SetTimer(FadeTime - Level.TimeSeconds, false);
		}
		//return;		
	}
	stop;	
}

state FallingPickup
{
	function BeginState()
	{
		SetTimer(FadeTime - Level.TimeSeconds, false);
		//return;		
	}
	stop;	
}

defaultproperties
{
	RespawnTime=0.0000000
}
