class BallisticWeaponParams extends Object;

var() editinline array<editinline WeaponParams> Layouts;
var() array<WeaponCamo> Camos;

static final simulated function Initialize(BallisticWeapon BW)
{
	SetWeaponParams(BW);
	SetFireParams(BW);
	SetRecoilParams(BW);
	SetAimParams(BW);
	OnInitialize(BW);
	//return;	
}

static final simulated function SetWeaponParams(BallisticWeapon BW)
{
	BW.WeaponParams = default.Layouts[int(BW.LayoutIndex)];
	// End:0x61
	if(int(BW.CamoIndex) != 255)
	{
		BW.WeaponCamo = default.Camos[int(BW.CamoIndex)];
	}
	BW.OnWeaponParamsChanged();
	//return;	
}

static final simulated function SetFireParams(BallisticWeapon BW)
{
	// End:0xBD
	if(default.Layouts[int(BW.LayoutIndex)].FireParams.Length > 0)
	{
		BW.bFireMode[0].Params = default.Layouts[int(BW.LayoutIndex)].FireParams[Min(int(BW.CurrentWeaponMode), default.Layouts[int(BW.LayoutIndex)].FireParams.Length - 1)];
		BW.bFireMode[0].OnFireParamsChanged(BW.AmmoIndex);
	}
	// End:0x17A
	if(default.Layouts[int(BW.LayoutIndex)].AltFireParams.Length > 0)
	{
		BW.bFireMode[1].Params = default.Layouts[int(BW.LayoutIndex)].AltFireParams[Min(int(BW.CurrentWeaponMode), default.Layouts[int(BW.LayoutIndex)].AltFireParams.Length - 1)];
		BW.bFireMode[1].OnFireParamsChanged(BW.AmmoIndex);
	}
	//return;	
}

static final simulated function SetRecoilParams(BallisticWeapon BW)
{
	BW.RcComponent.Params = default.Layouts[int(BW.LayoutIndex)].RecoilParams[int(BW.GetRecoilParamsIndex())];
	BW.RcComponent.Recalculate();
	//return;	
}

static final simulated function SetAimParams(BallisticWeapon BW)
{
	BW.AimComponent.Params = default.Layouts[int(BW.LayoutIndex)].AimParams[int(BW.GetAimParamsIndex())];
	BW.AimComponent.DisplaceDurationMult = default.Layouts[int(BW.LayoutIndex)].DisplaceDurationMult;
	BW.AimComponent.Recalculate();
	//return;	
}

static final simulated function SetProjectileParams(BallisticProjectile proj)
{
	// End:0x16
	if(!proj.bApplyParams)
	{
		return;
	}
	// End:0xC7
	if(proj.ModeIndex == 0)
	{
		// End:0xC4
		if(default.Layouts[int(proj.LayoutIndex)].FireParams.Length > 0)
		{
			proj.ApplyParams(ProjectileEffectParams(default.Layouts[int(proj.LayoutIndex)].FireParams[Min(int(proj.CurrentWeaponMode), default.Layouts[int(proj.LayoutIndex)].FireParams.Length - 1)].FireEffectParams[0]));
		}		
	}
	else
	{
		// End:0x161
		if(default.Layouts[int(proj.LayoutIndex)].AltFireParams.Length > 0)
		{
			proj.ApplyParams(ProjectileEffectParams(default.Layouts[int(proj.LayoutIndex)].AltFireParams[Min(int(proj.CurrentWeaponMode), default.Layouts[int(proj.LayoutIndex)].AltFireParams.Length - 1)].FireEffectParams[0]));
		}
	}
	//return;	
}

static final simulated function OverrideFireParams(BallisticWeapon BW, int NewIndex)
{
	// End:0xB2
	if(default.Layouts[int(BW.LayoutIndex)].FireParams.Length > 0)
	{
		BW.bFireMode[0].Params = default.Layouts[int(BW.LayoutIndex)].FireParams[Min(NewIndex, default.Layouts[int(BW.LayoutIndex)].FireParams.Length - 1)];
		BW.bFireMode[0].OnFireParamsChanged(BW.AmmoIndex);
	}
	// End:0x164
	if(default.Layouts[int(BW.LayoutIndex)].AltFireParams.Length > 0)
	{
		BW.bFireMode[1].Params = default.Layouts[int(BW.LayoutIndex)].AltFireParams[Min(NewIndex, default.Layouts[int(BW.LayoutIndex)].AltFireParams.Length - 1)];
		BW.bFireMode[1].OnFireParamsChanged(BW.AmmoIndex);
	}
	//return;	
}

static final simulated function OverrideProjectileParams(BallisticProjectile proj, int NewIndex)
{
	// End:0xA6
	if(proj.ModeIndex == 0)
	{
		// End:0xA3
		if(default.Layouts[int(proj.LayoutIndex)].FireParams.Length > 0)
		{
			proj.ApplyParams(ProjectileEffectParams(default.Layouts[int(proj.LayoutIndex)].FireParams[Min(NewIndex, default.Layouts[int(proj.LayoutIndex)].FireParams.Length - 1)].FireEffectParams[0]));
		}		
	}
	else
	{
		// End:0x135
		if(default.Layouts[int(proj.LayoutIndex)].AltFireParams.Length > 0)
		{
			proj.ApplyParams(ProjectileEffectParams(default.Layouts[int(proj.LayoutIndex)].AltFireParams[Min(NewIndex, default.Layouts[int(proj.LayoutIndex)].AltFireParams.Length - 1)].FireEffectParams[0]));
		}
	}
	//return;	
}

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	//return;	
}

static simulated function OnInitialize(BallisticWeapon BW)
{
	//return;	
}

static function FireModeStats GetFireStats()
{
	return default.Layouts[0].super(BallisticWeaponParams).GetFireStats();
	//return;	
}

static function FireModeStats GetAltFireStats()
{
	return default.Layouts[0].super(BallisticWeaponParams).GetAltFireStats();
	//return;	
}

