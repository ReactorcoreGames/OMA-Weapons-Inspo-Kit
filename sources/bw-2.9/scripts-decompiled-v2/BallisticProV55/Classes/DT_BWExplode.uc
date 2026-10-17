class DT_BWExplode extends BallisticDamageType
	config(BallisticProV55);

static function DoBloodEffects(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x88
	if(((((BallisticPawn(Victim) == none) && Victim.Health < 1) && !Victim.PhysicsVolume.bWaterVolume) && !default.bCantLoadBlood) && (GetBloodManager()) != none)
	{
		static.GetBloodManager().StartSpawnBlood(Victim.Location, Momentum, Victim);
	}
	//return;	
}

defaultproperties
{
	EffectChance=1.0000000
	BloodManagerName="BallisticProV55.BloodMan_Exploded"
	DamageBasis=4
	bIgniteFires=true
	DamageDescription=",Explode,Hazard,NonSniper,"
	bLocationalHit=false
	bThrowRagdoll=true
	GibModifier=2.0000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.BulletFlesh'
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	TransientSoundVolume=2.0000000
}
