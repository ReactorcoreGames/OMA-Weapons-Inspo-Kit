class Mut_Regeneration extends Mutator
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bUseRegen;
var globalconfig float RegenRate;
var globalconfig int RegenAmount;
var globalconfig float RegenDelay;
var globalconfig int HealthCap;
var globalconfig int HealthBonus;
var globalconfig int HealthBonusCap;
var globalconfig bool VehiclesRegen;

event Timer()
{
	local int i;

	// End:0x4B7
	if(bUseRegen)
	{
		i = 0;
		J0x10:

		// End:0x4B7 [Loop If]
		if(i < Level.GRI.PRIArray.Length)
		{
			// End:0x4AD
			if(((Level.GRI.PRIArray[i] != none) && Controller(Level.GRI.PRIArray[i].Owner) != none) && Controller(Level.GRI.PRIArray[i].Owner).Pawn != none)
			{
				// End:0x2FF
				if((Vehicle(Controller(Level.GRI.PRIArray[i].Owner).Pawn) != none) && VehiclesRegen)
				{
					// End:0x2FC
					if(((Controller(Level.GRI.PRIArray[i].Owner).Pawn.LastPainTime < (Level.TimeSeconds - (RegenDelay * 1.5000000))) && Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health > 0) && float(Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health) < Controller(Level.GRI.PRIArray[i].Owner).Pawn.HealthMax)
					{
						Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health = Clamp(Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health + (RegenAmount * 2), 0, int(Controller(Level.GRI.PRIArray[i].Owner).Pawn.HealthMax));
					}
					// [Explicit Continue]
					goto J0x4AD;
				}
				// End:0x4AD
				if(Vehicle(Controller(Level.GRI.PRIArray[i].Owner).Pawn) == none)
				{
					// End:0x4AD
					if(((Controller(Level.GRI.PRIArray[i].Owner).Pawn.LastPainTime < (Level.TimeSeconds - RegenDelay)) && Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health > 0) && Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health < HealthCap)
					{
						Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health = Clamp(Controller(Level.GRI.PRIArray[i].Owner).Pawn.Health + RegenAmount, 0, HealthCap);
					}
				}
			}
			J0x4AD:

			i++;
			// [Loop Continue]
			goto J0x10;
		}
	}
	//return;	
}

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x43
	if(bUseRegen)
	{
		SetTimer(RegenRate, true);
		// End:0x43
		if(!bDeleteMe)
		{
			Level.Game.AddGameModifier(Spawn(Class'BallisticProV55.Rules_Regen'));
		}
	}
	//return;	
}

defaultproperties
{
	bUseRegen=true
	RegenRate=1.0000000
	RegenAmount=3
	RegenDelay=6.0000000
	HealthCap=100
	HealthBonus=25
	HealthBonusCap=150
	VehiclesRegen=true
	FriendlyName="BallisticPro: Regeneration"
	Description="Periodically restores health to injured players and vehicles, and awards bonus player health for kills...||http://www.runestorm.com"
}
