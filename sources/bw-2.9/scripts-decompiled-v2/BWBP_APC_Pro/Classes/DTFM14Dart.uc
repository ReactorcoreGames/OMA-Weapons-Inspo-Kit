class DTFM14Dart extends DT_BWBlunt
	config(BallisticProV55);

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	super(BallisticDamageType).Hurt(Victim, Damage, Instigator, HitLocation, Momentum, dt);
	DoDartEffect(Victim, Instigator);
	//return;	
}

static function DoDartEffect(Actor Victim, Pawn Instigator)
{
	local int i;
	local FM14DartViewMesser vm;
	local FM14DartPoisoner DP;

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
			if(FM14DartViewMesser(Pawn(Victim).Owner.Attached[i]) != none)
			{
				vm = FM14DartViewMesser(Pawn(Victim).Owner.Attached[i]);
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
			vm = Victim.Level.Spawn(Class'BWBP_APC_Pro.FM14DartViewMesser', Pawn(Victim).Owner);
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
	DP = Victim.Level.Spawn(Class'BWBP_APC_Pro.FM14DartPoisoner', Pawn(Victim).Owner);
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
	DeathStrings[0]="%o was nailed by %k's FM14 stun dart."
	DeathStrings[1]="%o was drilled by %k's FM14 dart."
	DeathStrings[2]="%o was implanted with %k's FM14 dart."
	SimpleKillString="FM14 Dart"
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	DeathString="%o was nailed by %k's FM14 stun dart."
	FemaleSuicide="%o became her own FM14 dartboard."
	MaleSuicide="%o became his own FM14 dartboard."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
