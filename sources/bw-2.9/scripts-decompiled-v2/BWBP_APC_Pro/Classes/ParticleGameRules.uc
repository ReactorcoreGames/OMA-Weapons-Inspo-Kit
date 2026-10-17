class ParticleGameRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<ParticleStreamer> Cannons;

function AddStreamer(ParticleStreamer P)
{
	Cannons[Cannons.Length] = P;
	//return;	
}

function RemoveStreamer(ParticleStreamer P)
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

	// End:0x86
	if(Cannons.Length > 0)
	{
		i = 0;
		J0x13:

		// End:0x86 [Loop If]
		if(i < Cannons.Length)
		{
			// End:0x50
			if(Cannons[i].DrainTarget == instigatedBy)
			{
				Damage *= 0.1000000;
				// [Explicit Break]
				goto J0x86;
			}
			// End:0x7C
			if(Cannons[i].BoostTarget == instigatedBy)
			{
				Damage *= float(2);
				// [Explicit Break]
				goto J0x86;
			}
			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	J0x86:

	// End:0xC4
	if(NextGameRules != none)
	{
		return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	}
	return Damage;
	//return;	
}

