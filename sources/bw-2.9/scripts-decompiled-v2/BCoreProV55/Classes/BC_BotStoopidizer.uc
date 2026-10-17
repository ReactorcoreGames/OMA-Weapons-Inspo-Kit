class BC_BotStoopidizer extends Actor
	notplaceable;

var float EndTime;
var float StoopidTime;
var float StoopidFactor;
var bool bNoFade;
var Pawn LastHitPawn;
var AIController Ac;
var float OldSkill;
var float OldAlertness;
var float OldAggresion;
var bool bIsActive;

event PostBeginPlay()
{
	// End:0x2D
	if((Owner != none) && AIController(Owner) != none)
	{
		Ac = AIController(Owner);
	}
	// End:0x3E
	if(Ac == none)
	{
		Destroy();		
	}
	else
	{
		// End:0x89
		if(Bot(Ac) != none)
		{
			OldAlertness = Bot(Ac).Pawn.default.Alertness;
			OldAggresion = Bot(Ac).BaseAggressiveness;
		}
		OldSkill = Ac.Skill;
	}
	//return;	
}

function AddImpulse(float NewIntensity, float NewTime, optional bool bNoFading, optional bool bNoAdd)
{
	// End:0x11
	if(Ac == none)
	{
		Destroy();		
	}
	else
	{
		// End:0x7B
		if(bNoAdd || EndTime < Level.TimeSeconds)
		{
			StoopidFactor = NewIntensity;
			StoopidTime = NewTime;
			EndTime = Level.TimeSeconds + NewTime;
			bNoFade = bNoFading;
			ScrewUpBot();			
		}
		else
		{
			// End:0xE8
			if(((EndTime - Level.TimeSeconds) + NewTime) > float(10))
			{
				StoopidFactor += NewIntensity;
				StoopidTime += NewTime;
				EndTime = Level.TimeSeconds + float(10);
				bNoFade = bNoFading;
				ScrewUpBot();				
			}
			else
			{
				StoopidFactor += NewIntensity;
				StoopidTime += NewTime;
				EndTime += NewTime;
				bNoFade = bNoFading;
				ScrewUpBot();
			}
		}
	}
	//return;	
}

function ScrewUpBot()
{
	// End:0x0D
	if(Ac == none)
	{
		return;
	}
	LastHitPawn = Ac.Pawn;
	Bot(Ac).SetAlertness(-1.0000000);
	Bot(Ac).LoseEnemy();
	bIsActive = true;
	//return;	
}

event Tick(float dt)
{
	local float BA;

	// End:0x0D
	if(!bIsActive)
	{
		return;
	}
	// End:0x13A
	if(Ac != none)
	{
		// End:0x70
		if(((Level.TimeSeconds > EndTime) || Ac.Pawn == none) || Ac.Pawn != LastHitPawn)
		{
			bIsActive = false;
			FixBot();
			return;
		}
		// End:0x8E
		if(bNoFade)
		{
			BA = FMin(1.0000000, StoopidFactor);			
		}
		else
		{
			BA = FMin(1.0000000, StoopidFactor * ((EndTime - Level.TimeSeconds) / StoopidTime));
		}
		Ac.Skill = OldSkill - (BA * OldSkill);
		// End:0x13A
		if(Bot(Ac) != none)
		{
			Bot(Ac).SetAlertness(Lerp(BA, OldAlertness, -1.0000000));
			Bot(Ac).Aggressiveness = Lerp(BA, OldAggresion, -20.0000000);
		}
	}
	//return;	
}

event Destroyed()
{
	FixBot();
	super.Destroyed();
	//return;	
}

function FixBot()
{
	// End:0x75
	if(Ac != none)
	{
		// End:0x61
		if(Bot(Ac) != none)
		{
			// End:0x48
			if(Ac.Pawn != none)
			{
				Bot(Ac).SetAlertness(OldAlertness);
			}
			Bot(Ac).Aggressiveness = OldAggresion;
		}
		Ac.Skill = OldSkill;
	}
	//return;	
}

static function BC_BotStoopidizer DoBotStun(AIController Ac, float NewIntensity, float NewTime, optional bool bNoFading, optional bool bNoAdd)
{
	local BC_BotStoopidizer B;
	local int i;

	// End:0x0D
	if(Ac == none)
	{
		return none;
	}
	i = 0;
	J0x14:

	// End:0x78 [Loop If]
	if(i < Ac.Attached.Length)
	{
		// End:0x6E
		if(BC_BotStoopidizer(Ac.Attached[i]) != none)
		{
			B = BC_BotStoopidizer(Ac.Attached[i]);
			// [Explicit Break]
			goto J0x78;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	J0x78:

	// End:0xCC
	if(B == none)
	{
		B = Ac.Spawn(default.Class, Ac,, Ac.Location);
		// End:0xBB
		if(B == none)
		{
			return none;
		}
		B.SetBase(Ac);
	}
	B.AddImpulse(NewIntensity, NewTime, bNoFading, bNoAdd);
	return B;
	//return;	
}

defaultproperties
{
	bHidden=true
	RemoteRole=0
	LifeSpan=20.0000000
}
