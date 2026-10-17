class ProtonGameRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<ProtonStreamer> Cannons;

function AddStreamer(ProtonStreamer P)
{
	Cannons[Cannons.Length] = P;
	//return;	
}

function RemoveStreamer(ProtonStreamer P)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x42 [Loop If]
	if(i < Cannons.Length)
	{
		// End:0x38
		if(Cannons[i] == P)
		{
			Cannons.Remove(i, 1);
		}
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int i;

	// End:0x87
	if(Cannons.Length > 0)
	{
		i = 0;
		J0x13:

		// End:0x87 [Loop If]
		if(i < Cannons.Length)
		{
			// End:0x50
			if(Cannons[i].DrainTarget == instigatedBy)
			{
				Damage *= 0.5000000;
				// [Explicit Break]
				goto J0x87;
			}
			// End:0x7D
			if(Cannons[i].BoostTarget == instigatedBy)
			{
				Damage *= 1.5000000;
				// [Explicit Break]
				goto J0x87;
			}
			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	J0x87:

	// End:0xC5
	if(NextGameRules != none)
	{
		return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	}
	return Damage;
	//return;	
}

