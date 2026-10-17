class Ammo_M900Grenades extends BallisticAmmo;

var M50AssaultRifle DaM50;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x2A
	if(super(Ammunition).HandlePickupQuery(Item))
	{
		// End:0x28
		if(DaM50 != none)
		{
			DaM50.GrenadePickedUp();
		}
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_M900Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=3
	InitialAmount=2
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BallisticProV55.AP_M900Grenades'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=128,Y1=0,X2=191,Y2=63)
	ItemName="M900 Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M900Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
