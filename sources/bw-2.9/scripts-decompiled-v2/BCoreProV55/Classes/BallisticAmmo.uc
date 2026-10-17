class BallisticAmmo extends Ammunition;

var AmmoParams Params[4];

static final function bool ResuppliesFromPack()
{
	return default.Params[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].bResuppliesFromPack;
	//return;	
}

static final function float GetKillInitialAmmoMult()
{
	return default.Params[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].KillInitialAmmoMult;
	//return;	
}

static final function int GetKillResupplyAmmo()
{
	// End:0x1D
	if(default.InitialAmount > 0)
	{
		return int(float(default.InitialAmount) * GetKillInitialAmmoMult());
	}
	return int((float(default.MaxAmmo) * GetKillInitialAmmoMult()) * 0.5000000);
	//return;	
}

function bool AddAmmo(int AmmoToAdd)
{
	// End:0x7C
	if((((Pawn(Owner) != none) && Pawn(Owner).DrivenVehicle != none) && BallisticTurret(Pawn(Owner).DrivenVehicle) != none) && !BallisticTurret(Pawn(Owner).DrivenVehicle).DriverGetAmmo(self, AmmoToAdd))
	{
		return true;
	}
	return super.AddAmmo(AmmoToAdd);
	//return;	
}

defaultproperties
{
	// Ref[0]erence: AmmoParams'BCoreProV55.BallisticAmmo.Def_ArenaParams'
	begin object name="Def_ArenaParams" class=BCoreProV55.AmmoParams
	end object
	Params=Def_ArenaParams
	// Reference: AmmoParams'BCoreProV55.BallisticAmmo.Def_ClassicParams'
	begin object name="Def_ClassicParams" class=BCoreProV55.AmmoParams
	end object
	Params=Def_ClassicParams
	// Reference: AmmoParams'BCoreProV55.BallisticAmmo.Def_RealismParams'
	begin object name="Def_RealismParams" class=BCoreProV55.AmmoParams
	end object
	Params=Def_RealismParams
	// Reference: AmmoParams'BCoreProV55.BallisticAmmo.Def_TacticalParams'
	begin object name="Def_TacticalParams" class=BCoreProV55.AmmoParams
	end object
	Params=Def_TacticalParams
	MaxAmmo=180
	InitialAmount=30
	PickupClass=Class'BCoreProV55.BallisticAmmoPickup'
	ItemName="Ballistic Ammo"
}
