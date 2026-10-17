class DT_KF8XBolt extends DT_BWBlunt
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
	local KF8XBoltViewMesser vm;
	local KF8XBoltPoisoner DP;

	// End:0x69
	if((((Pawn(Victim) == none) || Vehicle(Victim) != none) || Pawn(Victim).Health <= 0) || Pawn(Victim).GetTeamNum() == Instigator.GetTeamNum())
	{
		return;
	}
	// End:0xC9
	if(((Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
	{
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Victim), 0.7000000, 1.5000000);
	}
	// End:0x1FF
	if(PlayerController(Pawn(Victim).Owner) != none)
	{
		i = 0;
		J0xEE:

		// End:0x17C [Loop If]
		if(i < Pawn(Victim).Owner.Attached.Length)
		{
			// End:0x172
			if(KF8XBoltViewMesser(Pawn(Victim).Owner.Attached[i]) != none)
			{
				vm = KF8XBoltViewMesser(Pawn(Victim).Owner.Attached[i]);
				// [Explicit Break]
				goto J0x17C;
			}
			i++;
			// [Loop Continue]
			goto J0xEE;
		}
		J0x17C:

		// End:0x1D9
		if(vm == none)
		{
			vm = Victim.Level.Spawn(Class'BWBP_OP_Pro.KF8XBoltViewMesser', Pawn(Victim).Owner);
			vm.SetBase(Pawn(Victim).Owner);
		}
		vm.SetupTimer();
		vm.AddImpulse(1.0000000);		
	}
	else
	{
		// End:0x24E
		if(AIController(Pawn(Victim).Owner) != none)
		{
			Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(Pawn(Victim).Owner), 2.0000000, 12.0000000);
		}
	}
	DP = Victim.Level.Spawn(Class'BWBP_OP_Pro.KF8XBoltPoisoner', Pawn(Victim).Owner);
	DP.Instigator = Instigator;
	// End:0x2EE
	if(((int(Victim.Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		DP.InstigatorController = Instigator.Controller;
	}
	DP.Initialize(Victim);
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was assassinated from the shadows by %k's KF-8X bolt."
	DeathStrings[1]="%k planted a crossbow bolt into %o."
	DeathStrings[2]="%o was discreetly decommissioned by %k's silent bolt."
	SimpleKillString="KF-8X Bolt"
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	FlashF=0.3000000
	WeaponClass=Class'BWBP_OP_Pro.KF8XCrossbow'
	DeathString="%%o was assassinated from the shadows by %k's KF-8X bolt."
	FemaleSuicide="%o dropped her own crossbow."
	MaleSuicide="%o dropped his own crossbow."
	bFastInstantHit=true
	bDelayedDamage=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.VSK.VSK-ImpactFlesh'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.1000000
}
