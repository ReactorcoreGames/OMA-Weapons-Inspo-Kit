class DTX4KnifeTox extends DT_BWBlade
	config(BallisticProV55);

static function IncrementKills(Controller Killer)
{
	Killer.AwardAdrenaline(10.0000000);
	//return;	
}

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	super(BallisticDamageType).Hurt(Victim, Damage, Instigator, HitLocation, Momentum, dt);
	DoKnifeEffect(Victim, Instigator);
	//return;	
}

static function DoKnifeEffect(Actor Victim, Pawn Instigator)
{
	local int i;
	local X4KnifeViewMesser vm;
	local X4KnifePoisoner DP;

	// End:0x69
	if((((Pawn(Victim) == none) || Vehicle(Victim) != none) || Pawn(Victim).Health <= 0) || Pawn(Victim).GetTeamNum() == Instigator.GetTeamNum())
	{
		return;
	}
	// End:0x19F
	if(PlayerController(Pawn(Victim).Owner) != none)
	{
		i = 0;
		J0x8E:

		// End:0x11C [Loop If]
		if(i < Pawn(Victim).Owner.Attached.Length)
		{
			// End:0x112
			if(X4KnifeViewMesser(Pawn(Victim).Owner.Attached[i]) != none)
			{
				vm = X4KnifeViewMesser(Pawn(Victim).Owner.Attached[i]);
				// [Explicit Break]
				goto J0x11C;
			}
			i++;
			// [Loop Continue]
			goto J0x8E;
		}
		J0x11C:

		// End:0x179
		if(vm == none)
		{
			vm = Victim.Level.Spawn(Class'BallisticProV55.X4KnifeViewMesser', Pawn(Victim).Owner);
			vm.SetBase(Pawn(Victim).Owner);
		}
		vm.SetupTimer();
		vm.AddImpulse(1.0000000);		
	}
	else
	{
		// End:0x1EE
		if(AIController(Pawn(Victim).Owner) != none)
		{
			Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(Pawn(Victim).Owner), 2.0000000, 12.0000000);
		}
	}
	DP = Victim.Level.Spawn(Class'BallisticProV55.X4KnifePoisoner', Pawn(Victim).Owner);
	DP.Instigator = Instigator;
	// End:0x28E
	if(((int(Victim.Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		DP.InstigatorController = Instigator.Controller;
	}
	DP.Initialize(Victim);
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%k cut up %o like a paper-shredder with %kh X4 knife."
	DeathStrings[1]="%o pounced onto %k's X4, and disembowelled %vs."
	DeathStrings[2]="%k jammed and jabbed %kh X4 knife into %o's staggering body."
	DeathStrings[3]="%o was stabbed to death by an enraged %k and %kh X4."
	DamageDescription=",Slash,Stab,"
	WeaponClass=Class'BallisticProV55.X4Knife'
	DeathString="%k cut up %o like a paper-shredder with %kh X4 knife."
	FemaleSuicide="%o fell on her X4 knife."
	MaleSuicide="%o fell on his X4 knife."
	bArmorStops=false
	bNeverSevers=true
	KDamageImpulse=1000.0000000
}
