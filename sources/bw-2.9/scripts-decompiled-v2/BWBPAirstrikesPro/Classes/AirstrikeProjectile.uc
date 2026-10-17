class AirstrikeProjectile extends Projectile;

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x225
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x224
		if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0xCA
			if(((Pawn(Victims) != none) && Pawn(Victims).Controller != none) && Pawn(Victims).Controller.SameTeamAs(Instigator.Controller))
			{
				continue;				
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x224
			if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

