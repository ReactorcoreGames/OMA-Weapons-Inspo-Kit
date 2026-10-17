class PS9mMedDart extends BallisticProjectile;

function DoDamage(Actor Victim, Vector HitLocation)
{
	local PS9mDartHeal HP;

	super.DoDamage(Victim, HitLocation);
	// End:0x4F
	if(((Pawn(Victim) == none) || Vehicle(Victim) != none) || Pawn(Victim).Health <= 0)
	{
		return;
	}
	// End:0x13A
	if((Pawn(Victim).Controller != none) && Pawn(Victim).Controller.SameTeamAs(Instigator.Controller))
	{
		HP = Spawn(Class'BWBP_SKC_Pro.PS9mDartHeal', Pawn(Victim).Owner);
		HP.Instigator = Instigator;
		// End:0x126
		if(((int(Victim.Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
		{
			HP.InstigatorController = Instigator.Controller;
		}
		HP.Initialize(Victim);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.PineappleTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_PS9mMedDart'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=6500.0000000
	Damage=5.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_PS9mMedDart'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	LifeSpan=1.5000000
}
