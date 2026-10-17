class Mut_ShieldRegeneration extends Mutator
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bUseShieldRegen;
var globalconfig float RegenRate;
var globalconfig int RegenAmount;
var globalconfig float RegenDelay;
var globalconfig int ShieldCap;

event Timer()
{
	local int i, MaxShield;
	local Controller C;
	local xPawn P;

	// End:0x0D
	if(!bUseShieldRegen)
	{
		return;
	}
	i = 0;
	J0x14:

	// End:0x164 [Loop If]
	if(i < Level.GRI.PRIArray.Length)
	{
		// End:0x5C
		if(Level.GRI.PRIArray[i] == none)
		{
			// [Explicit Continue]
			goto J0x15A;
		}
		C = Controller(Level.GRI.PRIArray[i].Owner);
		// End:0x9B
		if(C == none)
		{
			// [Explicit Continue]
			goto J0x15A;
		}
		P = xPawn(C.Pawn);
		// End:0xF1
		if((P == none) || BallisticPawn(P).LastDamagedTime > (Level.TimeSeconds - RegenDelay))
		{
			// [Explicit Continue]
			goto J0x15A;
		}
		MaxShield = int(FMin(float(ShieldCap), P.ShieldStrengthMax));
		// End:0x15A
		if(float(MaxShield) > P.ShieldStrength)
		{
			P.AddShieldStrength(Clamp(int(float(MaxShield) - P.ShieldStrength), 0, RegenAmount));
		}
		J0x15A:

		i++;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x43
	if(bUseShieldRegen)
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
	bUseShieldRegen=true
	RegenRate=1.0000000
	RegenAmount=10
	RegenDelay=4.0000000
	ShieldCap=100
	FriendlyName="BallisticPro: Shield Regeneration"
	Description="Players will periodically regenerate shields.||http://www.runestorm.com"
}
