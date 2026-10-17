class Rules_Loadout extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<int> PlayerDamage;
var array<float> SniperKills;
var array<float> ShotgunKills;
var array<float> HazardKills;
var array<int> DeathsHoldingSniper;
var array<int> DeathsHoldingShotgun;
var array<int> DeathsHoldingHazard;
var Class<DamageType> LastDT;

function int GetPlayerDamage(int Index)
{
	// End:0x0D
	if(Index < 0)
	{
		return 0;
	}
	// End:0x2C
	if(Index >= PlayerDamage.Length)
	{
		PlayerDamage.Length = Index + 1;
	}
	return PlayerDamage[Index];
	//return;	
}

function float GetSniperEff(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= SniperKills.Length)
	{
		SniperKills.Length = Index + 1;
	}
	return SniperKills[Index];
	//return;	
}

function float GetShotgunEff(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= ShotgunKills.Length)
	{
		ShotgunKills.Length = Index + 1;
	}
	return ShotgunKills[Index];
	//return;	
}

function float GetHazardEff(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= HazardKills.Length)
	{
		HazardKills.Length = Index + 1;
	}
	return HazardKills[Index];
	//return;	
}

function float GetDeathsHoldingSniper(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= DeathsHoldingSniper.Length)
	{
		DeathsHoldingSniper.Length = Index + 1;
	}
	return float(DeathsHoldingSniper[Index]);
	//return;	
}

function float GetDeathsHoldingShotgun(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= DeathsHoldingShotgun.Length)
	{
		DeathsHoldingShotgun.Length = Index + 1;
	}
	return float(DeathsHoldingShotgun[Index]);
	//return;	
}

function float GetDeathsHoldingHazard(int Index)
{
	// End:0x11
	if(Index < 0)
	{
		return 0.0000000;
	}
	// End:0x30
	if(Index >= DeathsHoldingHazard.Length)
	{
		DeathsHoldingHazard.Length = Index + 1;
	}
	return float(DeathsHoldingHazard[Index]);
	//return;	
}

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int Dmg;

	Dmg = super.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0xD5
	if((((injured != none) && instigatedBy != none) && instigatedBy != injured) && instigatedBy.PlayerReplicationInfo != none)
	{
		// End:0xB1
		if(PlayerDamage.Length <= instigatedBy.PlayerReplicationInfo.PlayerID)
		{
			PlayerDamage.Length = instigatedBy.PlayerReplicationInfo.PlayerID + 1;
		}
		PlayerDamage[instigatedBy.PlayerReplicationInfo.PlayerID] += Dmg;
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
	// End:0x339
	if(((((Killer == none) || Killer == Killed) && Killed != none) && Killed.PlayerReplicationInfo != none) && Class<WeaponDamageType>(LastDT) != none)
	{
		// End:0xB4
		if(SniperKills.Length <= Killed.PlayerReplicationInfo.PlayerID)
		{
			SniperKills.Length = Killed.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0xF7
		if(HazardKills.Length <= Killed.PlayerReplicationInfo.PlayerID)
		{
			HazardKills.Length = Killed.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0x13A
		if(ShotgunKills.Length <= Killed.PlayerReplicationInfo.PlayerID)
		{
			ShotgunKills.Length = Killed.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0x1D2
		if((LastDT.default.bSpecial || Killed.Pawn.Weapon.bSniping) && ClassIsChildOf(Killed.Pawn.Weapon.Class, Class<WeaponDamageType>(LastDT).default.WeaponClass))
		{
			SniperKills[Killed.PlayerReplicationInfo.PlayerID] -= float(1);			
		}
		else
		{
			SniperKills[Killed.PlayerReplicationInfo.PlayerID] -= 0.2000000;
		}
		// End:0x244
		if((BDT != none) && BDT.static.IsDamage(",Hazard,"))
		{
			HazardKills[Killed.PlayerReplicationInfo.PlayerID] -= float(1);			
		}
		else
		{
			HazardKills[Killed.PlayerReplicationInfo.PlayerID] -= 0.2000000;
		}
		// End:0x315
		if(((BallisticWeapon(Killed.Pawn.Weapon) != none) && BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun) && ClassIsChildOf(Killed.Pawn.Weapon.Class, Class<WeaponDamageType>(LastDT).default.WeaponClass))
		{
			ShotgunKills[Killed.PlayerReplicationInfo.PlayerID] -= float(1);			
		}
		else
		{
			ShotgunKills[Killed.PlayerReplicationInfo.PlayerID] -= 0.2000000;
		}
	}
	// End:0x708
	if((Killer != none) && Killer.PlayerReplicationInfo != none)
	{
		// End:0x39D
		if(SniperKills.Length <= Killer.PlayerReplicationInfo.PlayerID)
		{
			SniperKills.Length = Killer.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0x3E0
		if(HazardKills.Length <= Killer.PlayerReplicationInfo.PlayerID)
		{
			HazardKills.Length = Killer.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0x423
		if(ShotgunKills.Length <= Killer.PlayerReplicationInfo.PlayerID)
		{
			ShotgunKills.Length = Killer.PlayerReplicationInfo.PlayerID + 1;
		}
		// End:0x495
		if(((Killed != none) && Killer.Pawn != none) && Killer.Pawn != none)
		{
			dist = VSize(Killer.Pawn.Location - Killed.Pawn.Location);			
		}
		else
		{
			// End:0x4C9
			if(Killed != none)
			{
				dist = VSize(Killer.Location - Killed.Location);				
			}
			else
			{
				dist = 1000.0000000;
			}
		}
		// End:0x508
		if(LastDT.default.bSpecial)
		{
			SniperKills[Killer.PlayerReplicationInfo.PlayerID] += float(1);
		}
		// End:0x5A7
		if(((dist > float(1000)) && LastDT.default.bLocationalHit || LastDT.default.bInstantHit) && (BDT == none) || !BDT.static.IsDamage(",NonSniper,"))
		{
			SniperKills[Killer.PlayerReplicationInfo.PlayerID] += ((dist - float(1000)) / float(8000));
		}
		// End:0x6BD
		if(LastDT.default.bBulletHit || (((Killer.Pawn != none) && Killer.Pawn.Weapon != none) && BallisticWeapon(Killed.Pawn.Weapon) != none) && BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun)
		{
			// End:0x66D
			if(dist <= float(150))
			{
				ShotgunKills[Killer.PlayerReplicationInfo.PlayerID] += float(1);
			}
			// End:0x6BD
			if(dist <= float(1200))
			{
				ShotgunKills[Killer.PlayerReplicationInfo.PlayerID] += (float(1) - FMax(0.0000000, (dist - float(150)) / float(1050)));
			}
		}
		// End:0x708
		if((BDT != none) && BDT.static.IsDamage(",Hazard,"))
		{
			HazardKills[Killer.PlayerReplicationInfo.PlayerID] += float(1);
		}
	}
	// End:0x8BF
	if(((Killed != none) && Killed.Pawn != none) && Killed.Pawn.Weapon != none)
	{
		// End:0x78C
		if(Killed.Pawn.Weapon.bSniping)
		{
			DeathsHoldingSniper[Killed.PlayerReplicationInfo.PlayerID] += 1;
		}
		// End:0x8BF
		if(BallisticWeapon(Killed.Pawn.Weapon) != none)
		{
			// End:0x7FA
			if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Shotgun)
			{
				DeathsHoldingShotgun[Killed.PlayerReplicationInfo.PlayerID] += 1;				
			}
			else
			{
				// End:0x876
				if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Bullet && !BallisticWeapon(Killed.Pawn.Weapon).bSniping)
				{
					DeathsHoldingShotgun[Killed.PlayerReplicationInfo.PlayerID] += int(0.2500000);
				}
			}
			// End:0x8BF
			if(BallisticWeapon(Killed.Pawn.Weapon).bWT_Hazardous)
			{
				DeathsHoldingHazard[Killed.PlayerReplicationInfo.PlayerID] += 1;
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

