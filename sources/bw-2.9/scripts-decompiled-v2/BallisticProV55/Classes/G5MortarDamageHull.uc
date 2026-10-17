class G5MortarDamageHull extends Triggers;

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x3B
	if(Projectile(Base) != none)
	{
		Base.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);		
	}
	else
	{
		// End:0x73
		if(Projectile(Owner) != none)
		{
			Owner.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);
		}
	}
	//return;	
}

defaultproperties
{
	bCanBeDamaged=true
	bHardAttach=true
	CollisionRadius=8.0000000
	CollisionHeight=8.0000000
	bProjTarget=true
}
