class Rules_Invasion extends Rules_Ballistic
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x74
	if((((Monster(injured) != none) || Class<MonsterController>(injured.ControllerClass) != none) && Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).default.InvasionDamageScaling != float(1))
	{
		Damage *= Class<BallisticDamageType>(DamageType).default.InvasionDamageScaling;
	}
	return super.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

