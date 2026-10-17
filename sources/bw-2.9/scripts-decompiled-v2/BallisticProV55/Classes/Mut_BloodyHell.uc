class Mut_BloodyHell extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ModifyPlayer(Pawn Other)
{
	super.ModifyPlayer(Other);
	// End:0x86
	if((xPawn(Other) != none) && BallisticBHPawn(Other) == none)
	{
		xPawn(Other).RagdollLifeSpan = 20.0000000;
		xPawn(Other).DeResTime = 3.0000000;
		KarmaParamsSkel(xPawn(Other).KParams).KVelDropBelowThreshold = -1.0000000;
	}
	//return;	
}

function PostBeginPlay()
{
	local GameRules G;

	super(Actor).PostBeginPlay();
	G = Spawn(Class'BallisticProV55.Rules_BloodyHell');
	// End:0x51
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = G;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(G);
	}
	//return;	
}

simulated function PreBeginPlay()
{
	// End:0x8A
	if(Level.Game != none)
	{
		// End:0x8A
		if((Level.Game.DefaultPlayerClassName ~= "XGame.xPawn") || Class'BallisticProV55.Mut_Ballistic'.default.bForceBallisticPawn)
		{
			Level.Game.DefaultPlayerClassName = "BallisticProV55.BallisticBHPawn";
		}
	}
	super.PreBeginPlay();
	//return;	
}

function PlayerChangedClass(Controller C)
{
	super.PlayerChangedClass(C);
	// End:0x64
	if((Bot(C) != none) && (C.PawnClass == none) || C.PawnClass == Class'XGame.xPawn')
	{
		Bot(C).PawnClass = Class'BallisticProV55.BallisticBHPawn';
	}
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x66
	if((PlayerController(Other) != none) && (Controller(Other).PawnClass == none) || Controller(Other).PawnClass == Class'XGame.xPawn')
	{
		PlayerController(Other).PawnClass = Class'BallisticProV55.BallisticBHPawn';		
	}
	else
	{
		// End:0xC9
		if((Bot(Other) != none) && (Controller(Other).PawnClass == none) || Controller(Other).PawnClass == Class'XGame.xPawn')
		{
			Bot(Other).PreviousPawnClass = Class'BallisticProV55.BallisticBHPawn';
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

defaultproperties
{
	ConfigMenuClassName="BallisticProV55.ConfigMenu_Preferences"
	GroupName="Blood"
	FriendlyName="BallisticPro: Bloody Hell"
	Description="Adds horrific blood effects for dead bodies, including: blood trails, corpse impact marks, blood pools and under water blood. The pinnacle of horrendousness...||http://www.runestorm.com"
}
