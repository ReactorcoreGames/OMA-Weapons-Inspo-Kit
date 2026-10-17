class DamTypeTankShell extends VehicleDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictimHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	// End:0x28
	if(VictimHealth <= 0)
	{
		HitEffects[1] = Class'XEffects.HitFlameBig';		
	}
	else
	{
		// End:0x41
		if(FRand() < 0.8000000)
		{
			HitEffects[1] = Class'XEffects.HitFlame';
		}
	}
	//return;	
}

static function ScoreKill(Controller Killer, Controller Killed)
{
	// End:0x84
	if((((Killed != none) && Killer != Killed) && Vehicle(Killed.Pawn) != none) && Vehicle(Killed.Pawn).bCanFly)
	{
		// End:0x84
		if(PlayerController(Killer) != none)
		{
			PlayerController(Killer).ReceiveLocalizedMessage(Class'Onslaught.ONSVehicleKillMessage', 5);
		}
	}
	//return;	
}

defaultproperties
{
	VehicleClass=Class'Onslaught.ONSHoverTank'
	DeathString="%k's tank shell blew %o into flaming bits."
	FemaleSuicide="%o fired her rocket prematurely."
	MaleSuicide="%o fired his rocket prematurely."
	ThemSuicide="%o fired their rocket prematurely."
	bDetonatesGoop=true
	bDelayedDamage=true
	bThrowRagdoll=true
	bFlaming=true
	GibPerterbation=0.1500000
	KDamageImpulse=20000.0000000
	VehicleMomentumScaling=1.3000000
}
