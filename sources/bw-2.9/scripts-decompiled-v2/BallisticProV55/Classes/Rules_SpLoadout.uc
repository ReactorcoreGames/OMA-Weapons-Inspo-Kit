class Rules_SpLoadout extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Class<DamageType> LastDT;

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int Dmg;

	Dmg = super.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0xA0
	if((((injured != none) && instigatedBy != none) && instigatedBy != injured) && instigatedBy.PlayerReplicationInfo != none)
	{
		ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(instigatedBy.PlayerReplicationInfo)).PlayerDamage += Dmg;
	}
	return Dmg;
	//return;	
}

function ScoreKill(Controller Killer, Controller Killed)
{
	local float dist;
	local Class<BallisticDamageType> BDT;

	super.ScoreKill(Killer, Killed);
	BDT = Class<BallisticDamageType>(LastDT);
	// End:0x2C4
	if(((((Killer == none) || Killer == Killed) && Killed != none) && Killed.PlayerReplicationInfo != none) && Class<WeaponDamageType>(LastDT) != none)
	{
		// End:0x117
		if((LastDT.default.bSpecial || Killed.Pawn.Weapon.bSniping) && ClassIsChildOf(Killed.Pawn.Weapon.Class, Class<WeaponDamageType>(LastDT).default.WeaponClass))
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).SniperKills -= float(1);			
		}
		else
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).SniperKills -= 0.2000000;
		}
		// End:0x1A5
		if((BDT != none) && BDT.static.IsDamage(",Hazard,"))
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).HazardKills -= float(1);			
		}
		else
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).HazardKills -= 0.2000000;
		}
		// End:0x292
		if(((BallisticWeapon(Killed.Pawn.Weapon) != none) && BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun) && ClassIsChildOf(Killed.Pawn.Weapon.Class, Class<WeaponDamageType>(LastDT).default.WeaponClass))
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).ShotgunKills -= float(1);			
		}
		else
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).ShotgunKills -= 0.2000000;
		}
	}
	// End:0x610
	if((Killer != none) && Killer.PlayerReplicationInfo != none)
	{
		// End:0x357
		if(((Killed != none) && Killer.Pawn != none) && Killer.Pawn != none)
		{
			dist = VSize(Killer.Pawn.Location - Killed.Pawn.Location);			
		}
		else
		{
			// End:0x38B
			if(Killed != none)
			{
				dist = VSize(Killer.Location - Killed.Location);				
			}
			else
			{
				dist = 1000.0000000;
			}
		}
		// End:0x3D8
		if(LastDT.default.bSpecial)
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killer.PlayerReplicationInfo)).SniperKills += float(1);
		}
		// End:0x485
		if(((dist > float(1000)) && LastDT.default.bLocationalHit || LastDT.default.bInstantHit) && (BDT == none) || !BDT.static.IsDamage(",NonSniper,"))
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killer.PlayerReplicationInfo)).SniperKills += ((dist - float(1000)) / float(8000));
		}
		// End:0x5B7
		if(LastDT.default.bBulletHit || (((Killer.Pawn != none) && Killer.Pawn.Weapon != none) && BallisticWeapon(Killed.Pawn.Weapon) != none) && BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun)
		{
			// End:0x559
			if(dist <= float(150))
			{
				ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killer.PlayerReplicationInfo)).ShotgunKills += float(1);
			}
			// End:0x5B7
			if(dist <= float(1200))
			{
				ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killer.PlayerReplicationInfo)).ShotgunKills += (float(1) - FMax(0.0000000, (dist - float(150)) / float(1050)));
			}
		}
		// End:0x610
		if((BDT != none) && BDT.static.IsDamage(",Hazard,"))
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killer.PlayerReplicationInfo)).HazardKills += float(1);
		}
	}
	// End:0x7FF
	if(((Killed != none) && Killed.Pawn != none) && Killed.Pawn.Weapon != none)
	{
		// End:0x6A2
		if(Killed.Pawn.Weapon.bSniping)
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).DeathsHoldingSniper += 1;
		}
		// End:0x7FF
		if(BallisticWeapon(Killed.Pawn.Weapon) != none)
		{
			// End:0x71E
			if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun)
			{
				ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).DeathsHoldingShotgun += 1;				
			}
			else
			{
				// End:0x7A8
				if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Bullet && !BallisticWeapon(Killed.Pawn.Weapon).bSniping)
				{
					ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).DeathsHoldingShotgun += int(0.2500000);
				}
			}
			// End:0x7FF
			if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Hazardous)
			{
				ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Killed.PlayerReplicationInfo)).DeathsHoldingHazard += 1;
			}
		}
	}
	//return;	
}

function bool PreventDeath(Pawn Killed, Controller Killer, Class<DamageType> dt, Vector HitLocation)
{
	LastDT = dt;
	// End:0x2A
	if(super.PreventDeath(Killed, Killer, dt, HitLocation))
	{
		return true;
	}
	return false;
	//return;	
}

