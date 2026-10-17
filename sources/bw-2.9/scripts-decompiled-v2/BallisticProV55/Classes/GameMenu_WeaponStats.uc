class GameMenu_WeaponStats extends UT2K4GUIPage
	editinlinenew
	instanced;

var float BaselineDPS;
var float BaselineTTK;
var float BaselineRPS;
var() automated GUIImage MyBack;
var() automated GUIImage Box_WeaponList;
var() automated GUIImage Box_Desc;
var() automated GUIImage Box_WeaponIcon;
var() automated GUIImage WeaponIcon;
var() automated GUISectionBackground GenBack;
var() automated GUISectionBackground PriBack;
var() automated GUISectionBackground AltBack;
var() automated GUIButton bDone;
var() automated GUIHeader MyHeader;
var() automated GUIListBox lb_Weapons;
var() automated GUILabel l_WeaponCaption;
var() automated GUILabel lb_DShot;
var() automated GUILabel lb_DPS;
var() automated GUILabel lb_TTK;
var() automated GUILabel lb_RPM;
var() automated GUILabel lb_Recoil;
var() automated GUILabel lb_RPS;
var() automated GUILabel lb_DShotAlt;
var() automated GUILabel lb_DPSAlt;
var() automated GUILabel lb_TTKAlt;
var() automated GUILabel lb_RPMAlt;
var() automated GUILabel lb_RecoilAlt;
var() automated GUILabel lb_RPSAlt;
var() automated GUILabel lb_Raise;
var() automated GUILabel lb_ViewRecoilFactor;
var() automated GUILabel lb_Mag;
var() automated GUILabel lb_DPM;
var() automated GUILabel lb_Range;
var() automated GUILabel lb_RangeAlt;
var() automated GUILabel lb_ADSMultiplier;
var() automated GUILabel lb_CrouchMultiplier;
var() automated GUILabel lb_MoveSpeed;
var() automated GUILabel lb_ADSMoveSpeed;
var() automated GUILabel lb_Displacement;
var() automated GUILabel db_Dshot;
var() automated GUILabel db_HeadMult;
var() automated GUILabel db_LimbMult;
var() automated GUILabel db_RPM;
var() automated GUILabel db_Recoil;
var() automated GUILabel db_DshotAlt;
var() automated GUILabel db_HeadMultAlt;
var() automated GUILabel db_LimbMultAlt;
var() automated GUILabel db_RPMAlt;
var() automated GUILabel db_RecoilAlt;
var() automated GUILabel db_Mag;
var() automated GUILabel db_RangeOpt;
var() automated GUILabel db_RangeOptAlt;
var() automated GUILabel db_RangeDecayed;
var() automated GUILabel db_RangeDecayedAlt;
var() automated GUILabel db_RangeMax;
var() automated GUILabel db_RangeMaxAlt;
var() automated GUILabel db_ADSMultiplier;
var() automated GUILabel db_CrouchMultiplier;
var() automated moComboBox cb_Display;
var() automated GUIScrollTextBox sb_Desc;
var() automated GUIProgressBar pb_DPS;
var() automated GUIProgressBar pb_TTK;
var() automated GUIProgressBar pb_RPS;
var() automated GUIProgressBar pb_DPSAlt;
var() automated GUIProgressBar pb_TTKAlt;
var() automated GUIProgressBar pb_RPSAlt;
var() automated GUIProgressBar pb_Raise;
var() automated GUIProgressBar pb_ViewRecoilFactor;
var() automated GUIProgressBar pb_DPM;
var() automated GUIProgressBar pb_MoveSpeed;
var() automated GUIProgressBar pb_ADSMoveSpeed;
var() automated GUIProgressBar pb_Displacement;
var InterpCurve RedCurve;
var InterpCurve GreenCurve;
var InterpCurve BlueCurve;
var bool bInitialized;
var bool bAltStatsVisible;
var bool bShowTextBox;
var Class<BallisticWeapon> BaselineClass;
var() localized string Headings[10];

function InitBaselineParams()
{
	local Class<BallisticWeaponParams> Params;
	local int GameStyleIndex;
	local FireModeStats fire_stats;

	GameStyleIndex = int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle);
	Params = BaselineClass.default.ParamsClasses[GameStyleIndex];
	fire_stats = Params.static.GetFireStats();
	BaselineDPS = float(fire_stats.DPS);
	BaselineTTK = fire_stats.TTK;
	BaselineRPS = float(fire_stats.RPS);
	//return;	
}

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPage).InitComponent(MyController, MyOwner);
	// End:0x1B
	if(bInitialized)
	{
		return;
	}
	InitBaselineParams();
	lb_Weapons.List.__OnChange__Delegate = InternalOnChange;
	lb_DShot.Caption = "Damage";
	lb_DPS.Caption = "DPS";
	lb_TTK.Caption = "Time to Kill (175 HP)";
	lb_RPM.Caption = "Fire Rate";
	lb_Recoil.Caption = "Recoil/Shot";
	lb_RPS.Caption = "Recoil/Second";
	lb_Range.Caption = "Effective Ranges";
	pb_DPS.High = BaselineDPS * float(3);
	pb_TTK.High = BaselineTTK * float(3);
	pb_RPS.High = BaselineRPS * float(3);
	lb_DShotAlt.Caption = "Damage";
	lb_DPSAlt.Caption = "DPS";
	lb_TTKAlt.Caption = "Time to Kill (175 HP)";
	lb_RPMAlt.Caption = "Fire Rate";
	lb_RecoilAlt.Caption = "Recoil/Shot";
	lb_RPSAlt.Caption = "Recoil/Second";
	lb_RangeAlt.Caption = "Effective Ranges";
	pb_DPSAlt.High = BaselineDPS * float(3);
	pb_TTKAlt.High = BaselineTTK * float(3);
	pb_RPSAlt.High = BaselineRPS * float(3);
	lb_Raise.Caption = "ADS Transition Time";
	lb_ViewRecoilFactor.Caption = "Recoil View Bind Factor";
	lb_Mag.Caption = "Capacity";
	lb_DPM.Caption = "Damage/Mag";
	lb_MoveSpeed.Caption = "Movement Multiplier";
	lb_ADSMoveSpeed.Caption = "ADS Movement Multiplier";
	lb_CrouchMultiplier.Caption = "Crouch Recoil Multiplier";
	lb_ADSMultiplier.Caption = "ADS Sway Multiplier";
	lb_Displacement.Caption = "Displacement Factor";
	pb_Raise.High = 0.8000000;
	pb_ViewRecoilFactor.High = 1.0000000;
	pb_Displacement.High = 2.0000000;
	pb_MoveSpeed.High = 1.1500000;
	pb_ADSMoveSpeed.High = 1.1500000;
	pb_DPM.High = 2500.0000000;
	pb_TTK.NumDecimals = 2;
	pb_TTKAlt.NumDecimals = 2;
	PriBack.ManageComponent(lb_DShot);
	PriBack.ManageComponent(db_Dshot);
	PriBack.ManageComponent(db_HeadMult);
	PriBack.ManageComponent(db_LimbMult);
	PriBack.ManageComponent(lb_RPM);
	PriBack.ManageComponent(db_RPM);
	PriBack.ManageComponent(lb_DPS);
	PriBack.ManageComponent(pb_DPS);
	PriBack.ManageComponent(lb_TTK);
	PriBack.ManageComponent(pb_TTK);
	PriBack.ManageComponent(lb_Range);
	PriBack.ManageComponent(db_RangeOpt);
	PriBack.ManageComponent(db_RangeDecayed);
	PriBack.ManageComponent(db_RangeMax);
	PriBack.ManageComponent(lb_Recoil);
	PriBack.ManageComponent(db_Recoil);
	PriBack.ManageComponent(lb_RPS);
	PriBack.ManageComponent(pb_RPS);
	AltBack.ManageComponent(lb_DShotAlt);
	AltBack.ManageComponent(db_DshotAlt);
	AltBack.ManageComponent(db_HeadMultAlt);
	AltBack.ManageComponent(db_LimbMultAlt);
	AltBack.ManageComponent(lb_RPMAlt);
	AltBack.ManageComponent(db_RPMAlt);
	AltBack.ManageComponent(lb_DPSAlt);
	AltBack.ManageComponent(pb_DPSAlt);
	AltBack.ManageComponent(lb_TTKAlt);
	AltBack.ManageComponent(pb_TTKAlt);
	AltBack.ManageComponent(lb_RangeAlt);
	AltBack.ManageComponent(db_RangeOptAlt);
	AltBack.ManageComponent(db_RangeDecayedAlt);
	AltBack.ManageComponent(db_RangeMaxAlt);
	AltBack.ManageComponent(lb_RecoilAlt);
	AltBack.ManageComponent(db_RecoilAlt);
	AltBack.ManageComponent(lb_RPSAlt);
	AltBack.ManageComponent(pb_RPSAlt);
	GenBack.ManageComponent(lb_Mag);
	GenBack.ManageComponent(db_Mag);
	GenBack.ManageComponent(lb_DPM);
	GenBack.ManageComponent(pb_DPM);
	GenBack.ManageComponent(lb_MoveSpeed);
	GenBack.ManageComponent(pb_MoveSpeed);
	GenBack.ManageComponent(lb_ADSMoveSpeed);
	GenBack.ManageComponent(pb_ADSMoveSpeed);
	GenBack.ManageComponent(lb_Raise);
	GenBack.ManageComponent(pb_Raise);
	GenBack.ManageComponent(lb_ADSMultiplier);
	GenBack.ManageComponent(db_ADSMultiplier);
	GenBack.ManageComponent(lb_CrouchMultiplier);
	GenBack.ManageComponent(db_CrouchMultiplier);
	GenBack.ManageComponent(lb_ViewRecoilFactor);
	GenBack.ManageComponent(pb_ViewRecoilFactor);
	GenBack.ManageComponent(lb_Displacement);
	GenBack.ManageComponent(pb_Displacement);
	sb_Desc.bVisible = false;
	Box_Desc.bVisible = false;
	cb_Display.AddItem("Statistics");
	cb_Display.AddItem("Manual");
	cb_Display.bReadOnly = true;
	LoadList();
	bInitialized = true;
	cb_Display.SetIndex(1);
	SwitchDisplay(cb_Display.GetIndex());
	UpdateInfo();
	//return;	
}

function LoadList()
{
	local int i, j, Index[10];
	local array<WeaponInfo> WIRecs;

	lb_Weapons.List.Add(Headings[0],, "MELEE", true);
	lb_Weapons.List.Add(Headings[1],, "SIDEARM", true);
	lb_Weapons.List.Add(Headings[2],, "SMG", true);
	lb_Weapons.List.Add(Headings[3],, "ASSAULT", true);
	lb_Weapons.List.Add(Headings[4],, "ENERGY", true);
	lb_Weapons.List.Add(Headings[5],, "MACHINEGUN", true);
	lb_Weapons.List.Add(Headings[6],, "SHOTGUN", true);
	lb_Weapons.List.Add(Headings[7],, "HEAVY", true);
	lb_Weapons.List.Add(Headings[8],, "SNIPER", true);
	lb_Weapons.List.Add(Headings[9],, "GRENADES", true);
	j = 0;
	J0x1AD:

	// End:0x1D7 [Loop If]
	if(j < 10)
	{
		Index[j] = j + 1;
		j++;
		// [Loop Continue]
		goto J0x1AD;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.GetBWWeps(WIRecs);
	i = 0;
	J0x1F2:

	// End:0x344 [Loop If]
	if(i < WIRecs.Length)
	{
		// End:0x33A
		if(WIRecs[i].ClassName != "")
		{
			// End:0x2D9
			if((WIRecs[i].InventoryGroup > 0) && WIRecs[i].InventoryGroup < 10)
			{
				lb_Weapons.List.Insert(Index[WIRecs[i].InventoryGroup - 1], WIRecs[i].ItemName,, WIRecs[i].ClassName);
				j = WIRecs[i].InventoryGroup - 1;
				J0x2B3:

				// End:0x2D6 [Loop If]
				if(j < 10)
				{
					Index[j]++;
					j++;
					// [Loop Continue]
					goto J0x2B3;
				}
				// [Explicit Continue]
				goto J0x33A;
			}
			// End:0x33A
			if(WIRecs[i].InventoryGroup == 0)
			{
				lb_Weapons.List.Insert(Index[9], WIRecs[i].ItemName,, WIRecs[i].ClassName);
				Index[9]++;
			}
		}
		J0x33A:

		i++;
		// [Loop Continue]
		goto J0x1F2;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	// End:0x402
	if(((lb_Weapons.List.Index == 0) && lb_Weapons.List.IsSection()) || lb_Weapons.List.Index >= lb_Weapons.List.ItemCount)
	{
		lb_Weapons.List.SetIndex(1);
		l_WeaponCaption.Caption = lb_Weapons.List.Get();
	}
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	// End:0x2D
	if((int(Key) == 13) && int(State) == 3)
	{
		return InternalOnClick(bDone);		
	}
	else
	{
		// End:0x57
		if((int(Key) == 27) && int(State) == 3)
		{
			return InternalOnClick(bDone);
		}
	}
	return false;
	//return;	
}

function InternalOnClose(optional bool bCanceled)
{
	OnClose(bCanceled);
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x1E
	if(Sender == bDone)
	{
		Controller.CloseMenu();
	}
	return true;
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	// End:0x2E
	if(Sender == lb_Weapons.List)
	{
		UpdateInfo();		
	}
	else
	{
		// End:0x52
		if(Sender == cb_Display)
		{
			SwitchDisplay(cb_Display.GetIndex());
		}
	}
	//return;	
}

function SwitchDisplay(int Index)
{
	local int i;

	// End:0x147
	if(Index == 0)
	{
		GenBack.bVisible = true;
		i = 0;
		J0x23:

		// End:0x66 [Loop If]
		if(i < GenBack.AlignStack.Length)
		{
			GenBack.AlignStack[i].bVisible = true;
			i++;
			// [Loop Continue]
			goto J0x23;
		}
		PriBack.bVisible = true;
		i = 0;
		J0x7E:

		// End:0xC1 [Loop If]
		if(i < PriBack.AlignStack.Length)
		{
			PriBack.AlignStack[i].bVisible = true;
			i++;
			// [Loop Continue]
			goto J0x7E;
		}
		AltBack.bVisible = true;
		i = 0;
		J0xD9:

		// End:0x11C [Loop If]
		if(i < AltBack.AlignStack.Length)
		{
			AltBack.AlignStack[i].bVisible = true;
			i++;
			// [Loop Continue]
			goto J0xD9;
		}
		sb_Desc.bVisible = false;
		Box_Desc.bVisible = false;
		UpdateInfo();		
	}
	else
	{
		GenBack.bVisible = false;
		i = 0;
		J0x15F:

		// End:0x1A2 [Loop If]
		if(i < GenBack.AlignStack.Length)
		{
			GenBack.AlignStack[i].bVisible = false;
			i++;
			// [Loop Continue]
			goto J0x15F;
		}
		PriBack.bVisible = false;
		i = 0;
		J0x1BA:

		// End:0x1FD [Loop If]
		if(i < PriBack.AlignStack.Length)
		{
			PriBack.AlignStack[i].bVisible = false;
			i++;
			// [Loop Continue]
			goto J0x1BA;
		}
		AltBack.bVisible = false;
		i = 0;
		J0x215:

		// End:0x258 [Loop If]
		if(i < AltBack.AlignStack.Length)
		{
			AltBack.AlignStack[i].bVisible = false;
			i++;
			// [Loop Continue]
			goto J0x215;
		}
		sb_Desc.bVisible = true;
		Box_Desc.bVisible = true;
	}
	//return;	
}

function UpdateInfo()
{
	local Class<BallisticWeapon> BW;
	local Class<BallisticWeaponParams> Params;
	local FireModeStats FS, AFS;
	local int GameStyleIndex;

	GameStyleIndex = int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle);
	BW = Class<BallisticWeapon>(DynamicLoadObject(lb_Weapons.List.GetExtra(), Class'Core.Class', true));
	// End:0x6A
	if(BW != none)
	{
		Params = BW.default.ParamsClasses[GameStyleIndex];
	}
	// End:0xD51
	if(Params != none)
	{
		FS = Params.static.GetFireStats();
		AFS = Params.static.GetAltFireStats();
		WeaponIcon.Image = BW.default.BigIconMaterial;
		l_WeaponCaption.Caption = BW.default.ItemName;
		l_WeaponCaption.TextColor = BW.default.HudColor;
		sb_Desc.SetContent(BW.static.GetManual());
		db_Dshot.Caption = FS.Damage;
		db_HeadMult.Caption = "Head: x" $ string(FS.HeadMult);
		db_LimbMult.Caption = "Limb: x" $ string(FS.LimbMult);
		db_RangeOpt.Caption = FS.RangeOpt;
		db_RangeDecayed.Caption = FS.RangeDecayed;
		db_RangeMax.Caption = FS.RangeMax;
		pb_DPS.Value = FMin(float(FS.DPS), pb_DPS.High);
		pb_DPS.Caption = ((string(FS.DPS) @ "(") $ string(int((float(FS.DPS) / BaselineDPS) * float(100)))) $ "%)";
		pb_DPS.BarColor = ColorBar(pb_DPS.Value / pb_DPS.High);
		pb_TTK.Value = FMin(FS.TTK, pb_TTK.High);
		pb_TTK.Caption = ((string(FS.TTK) @ "(") $ string(int((FS.TTK / BaselineTTK) * float(100)))) $ "%)";
		pb_TTK.BarColor = ColorBar(pb_TTK.Value / pb_TTK.High);
		db_RPM.Caption = FS.RPM;
		db_Recoil.Caption = string(FS.RPShot);
		pb_RPS.Value = FMin(float(FS.RPS), pb_RPS.High);
		pb_RPS.Caption = ((string(FS.RPS) @ "(") $ string(int((float(FS.RPS) / BaselineRPS) * float(100)))) $ "%)";
		pb_RPS.BarColor = ColorBar(pb_RPS.Value / pb_RPS.High);
		// End:0x51A
		if(AFS.DamageInt > 0)
		{
			// End:0x517
			if(!bAltStatsVisible)
			{
				// End:0x4F8
				if(AltBack.bVisible)
				{
					lb_RangeAlt.bVisible = true;
					lb_RecoilAlt.bVisible = true;
					lb_RPSAlt.bVisible = true;
					lb_TTKAlt.bVisible = true;
					lb_DPSAlt.bVisible = true;
					pb_DPSAlt.bVisible = true;
					db_HeadMultAlt.bVisible = true;
					db_LimbMultAlt.bVisible = true;
					pb_TTKAlt.bVisible = true;
					pb_RPSAlt.bVisible = true;
					db_RecoilAlt.bVisible = true;
					db_RangeOptAlt.bVisible = true;
					db_RangeDecayedAlt.bVisible = true;
					db_RangeMaxAlt.bVisible = true;
				}
				lb_DShotAlt.Caption = "Damage";
				bAltStatsVisible = true;
			}			
		}
		else
		{
			// End:0x642
			if(bAltStatsVisible)
			{
				// End:0x63A
				if(AltBack.bVisible)
				{
					lb_DShotAlt.Caption = "Effect";
					db_HeadMultAlt.bVisible = false;
					db_LimbMultAlt.bVisible = false;
					lb_RangeAlt.bVisible = false;
					lb_RecoilAlt.bVisible = false;
					lb_RPSAlt.bVisible = false;
					lb_TTKAlt.bVisible = false;
					lb_DPSAlt.bVisible = false;
					pb_DPSAlt.bVisible = false;
					pb_TTKAlt.bVisible = false;
					pb_RPSAlt.bVisible = false;
					db_RecoilAlt.bVisible = false;
					db_RangeOptAlt.bVisible = false;
					db_RangeDecayedAlt.bVisible = false;
					db_RangeMaxAlt.bVisible = false;
				}
				bAltStatsVisible = false;
			}
		}
		// End:0x66E
		if(AFS.DamageInt > 0)
		{
			db_DshotAlt.Caption = AFS.Damage;			
		}
		else
		{
			db_DshotAlt.Caption = AFS.EffectString;
		}
		db_HeadMultAlt.Caption = "Head: x" $ string(AFS.HeadMult);
		db_LimbMultAlt.Caption = "Limb: x" $ string(AFS.LimbMult);
		db_RangeOptAlt.Caption = AFS.RangeOpt;
		db_RangeDecayedAlt.Caption = AFS.RangeDecayed;
		db_RangeMaxAlt.Caption = AFS.RangeMax;
		pb_DPSAlt.Value = FMin(float(AFS.DPS), pb_DPSAlt.High);
		pb_DPSAlt.Caption = ((string(AFS.DPS) @ "(") $ string(int((float(AFS.DPS) / BaselineDPS) * float(100)))) $ "%)";
		pb_DPSAlt.BarColor = ColorBar(pb_DPSAlt.Value / pb_DPSAlt.High);
		pb_TTKAlt.Value = FMin(AFS.TTK, pb_TTKAlt.High);
		pb_TTKAlt.Caption = ((string(AFS.TTK) @ "(") $ string(int((AFS.TTK / BaselineTTK) * float(100)))) $ "%)";
		pb_TTKAlt.BarColor = ColorBar(pb_TTKAlt.Value / pb_TTKAlt.High);
		db_RPMAlt.Caption = AFS.RPM;
		db_RecoilAlt.Caption = string(AFS.RPShot);
		pb_RPSAlt.Value = FMin(float(AFS.RPS), pb_RPSAlt.High);
		pb_RPSAlt.Caption = ((string(AFS.RPS) @ "(") $ string(int((float(AFS.RPS) / BaselineRPS) * float(100)))) $ "%)";
		pb_RPSAlt.BarColor = ColorBar(pb_RPSAlt.Value / pb_RPSAlt.High);
		pb_Raise.Value = Params.default.Layouts[0].SightingTime;
		pb_Raise.Caption = string(pb_Raise.Value);
		pb_Raise.BarColor = ColorBar(pb_Raise.Value / pb_Raise.High);
		pb_ViewRecoilFactor.Value = Params.default.Layouts[0].RecoilParams[0].ViewBindFactor;
		pb_ViewRecoilFactor.Caption = string(int(Ceil(pb_ViewRecoilFactor.Value * float(100)))) $ "%";
		pb_ViewRecoilFactor.BarColor = ColorBar(pb_ViewRecoilFactor.Value / pb_ViewRecoilFactor.High);
		pb_MoveSpeed.Value = Params.default.Layouts[0].PlayerSpeedFactor;
		pb_MoveSpeed.Caption = string(int(Ceil(pb_MoveSpeed.Value * float(100)))) $ "%";
		pb_MoveSpeed.BarColor = ColorBar(pb_MoveSpeed.Value / pb_MoveSpeed.High);
		pb_ADSMoveSpeed.Value = Params.default.Layouts[0].SightMoveSpeedFactor;
		pb_ADSMoveSpeed.Caption = string(int(Ceil(pb_ADSMoveSpeed.Value * float(100)))) $ "%";
		pb_ADSMoveSpeed.BarColor = ColorBar(pb_ADSMoveSpeed.Value / pb_ADSMoveSpeed.High);
		pb_Displacement.Value = Params.default.Layouts[0].DisplaceDurationMult;
		pb_Displacement.Caption = string(int(Ceil(pb_Displacement.Value * float(100)))) $ "%";
		pb_Displacement.BarColor = ColorBar(pb_Displacement.Value / pb_Displacement.High);
		db_Mag.Caption = string(Params.default.Layouts[0].MagAmmo);
		pb_DPM.Value = FMin(float(Params.default.Layouts[0].MagAmmo * FS.DamageInt), pb_DPM.High);
		pb_DPM.Caption = ((string(int(pb_DPM.Value)) @ "(") $ string(int(pb_DPM.Value / 6.0000000))) $ "%)";
		pb_DPM.BarColor = ColorBar(pb_DPM.Value / pb_DPM.High);
		db_CrouchMultiplier.Caption = string(int(Ceil(100.0000000 * Params.default.Layouts[0].AimParams[0].CrouchMultiplier))) $ "%";
		db_ADSMultiplier.Caption = string(int(float(100) * Params.default.Layouts[0].AimParams[0].ADSMultiplier)) $ "%";
	}
	//return;	
}

function Color ColorBar(float factor)
{
	local Color C;

	C.R = byte(255);
	C.G = byte(float(255) * (float(1) - factor));
	C.B = 0;
	C.A = byte(255);
	return C;
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinHeight=1.0000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBoxWeapons'
	begin object name="ImageBoxWeapons" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.3674970
		WinLeft=0.0350000
		WinWidth=0.2650000
		WinHeight=0.5359370
		RenderWeight=0.0020000
	end object
	Box_WeaponList=ImageBoxWeapons
	// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBoxDesc'
	begin object name="ImageBoxDesc" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0474000
		WinLeft=0.3350000
		WinWidth=0.6350000
		WinHeight=0.8600000
		RenderWeight=0.0020000
	end object
	Box_Desc=ImageBoxDesc
	// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBox_WeaponIcon'
	begin object name="ImageBox_WeaponIcon" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.0350000
		WinWidth=0.2650000
		WinHeight=0.2000000
		RenderWeight=0.0020000
	end object
	Box_WeaponIcon=ImageBox_WeaponIcon
	// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.WeaponIconImage'
	begin object name="WeaponIconImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=2
		WinTop=0.0700000
		WinLeft=0.0500000
		WinWidth=0.2270000
		WinHeight=0.1500000
		RenderWeight=0.0040000
	end object
	WeaponIcon=WeaponIconImage
	// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.GenBackImage'
	begin object name="GenBackImage" class=XInterface.GUISectionBackground
		Caption="General Statistics"
		TopPadding=0.0100000
		BottomPadding=0.0100000
		MaxPerColumn=20
		WinTop=0.0500000
		WinLeft=0.3350000
		WinWidth=0.2000000
		WinHeight=0.8500000
		OnPreDraw=GenBackImage.InternalPreDraw
	end object
	GenBack=GenBackImage
	// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.PriBackImage'
	begin object name="PriBackImage" class=XInterface.GUISectionBackground
		Caption="Primary Fire Statistics"
		TopPadding=0.0100000
		BottomPadding=0.0100000
		MaxPerColumn=20
		WinTop=0.0500000
		WinLeft=0.5525000
		WinWidth=0.2000000
		WinHeight=0.8500000
		OnPreDraw=PriBackImage.InternalPreDraw
	end object
	PriBack=PriBackImage
	// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.AltBackImage'
	begin object name="AltBackImage" class=XInterface.GUISectionBackground
		Caption="Alt Fire Statistics"
		TopPadding=0.0100000
		BottomPadding=0.0100000
		MaxPerColumn=20
		WinTop=0.0500000
		WinLeft=0.7700000
		WinWidth=0.2000000
		WinHeight=0.8500000
		OnPreDraw=AltBackImage.InternalPreDraw
	end object
	AltBack=AltBackImage
	// Reference: GUIButton'BallisticProV55.GameMenu_WeaponStats.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.9250000
		WinLeft=0.4000000
		WinWidth=0.2000000
		TabOrder=0
		OnClick=GameMenu_WeaponStats.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIHeader'BallisticProV55.GameMenu_WeaponStats.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Ballistic Weapon Statistics"
		WinHeight=0.0312500
	end object
	MyHeader=DaBeegHeader
	// Reference: GUIListBox'BallisticProV55.GameMenu_WeaponStats.WeaponList'
	begin object name="WeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=WeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="All the weapons that can become available."
		WinTop=0.4091370
		WinLeft=0.0459770
		WinWidth=0.2450000
		WinHeight=0.4583590
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_Weapons=WeaponList
	// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.WeaponCaption'
	begin object name="WeaponCaption" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=2
		WinTop=0.2500000
		WinLeft=0.0350000
		WinWidth=0.2650000
		WinHeight=0.0650000
	end object
	l_WeaponCaption=WeaponCaption
	// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.myCaption'
	begin object name="myCaption" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinWidth=0.2000000
		WinHeight=0.0300000
	end object
	lb_DShot=myCaption
	lb_DPS=myCaption
	lb_TTK=myCaption
	lb_RPM=myCaption
	lb_Recoil=myCaption
	lb_RPS=myCaption
	lb_DShotAlt=myCaption
	lb_DPSAlt=myCaption
	lb_TTKAlt=myCaption
	lb_RPMAlt=myCaption
	lb_RecoilAlt=myCaption
	lb_RPSAlt=myCaption
	lb_Raise=myCaption
	lb_ViewRecoilFactor=myCaption
	lb_Mag=myCaption
	lb_DPM=myCaption
	lb_Range=myCaption
	lb_RangeAlt=myCaption
	lb_ADSMultiplier=myCaption
	lb_CrouchMultiplier=myCaption
	lb_MoveSpeed=myCaption
	lb_ADSMoveSpeed=myCaption
	lb_Displacement=myCaption
	// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.MyData'
	begin object name="MyData" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinWidth=0.2000000
		WinHeight=0.0300000
	end object
	db_Dshot=MyData
	db_HeadMult=MyData
	db_LimbMult=MyData
	db_RPM=MyData
	db_Recoil=MyData
	db_DshotAlt=MyData
	db_HeadMultAlt=MyData
	db_LimbMultAlt=MyData
	db_RPMAlt=MyData
	db_RecoilAlt=MyData
	db_Mag=MyData
	db_RangeOpt=MyData
	db_RangeOptAlt=MyData
	db_RangeDecayed=MyData
	db_RangeDecayedAlt=MyData
	db_RangeMax=MyData
	db_RangeMaxAlt=MyData
	db_ADSMultiplier=MyData
	db_CrouchMultiplier=MyData
	// Reference: moComboBox'BallisticProV55.GameMenu_WeaponStats.co_DisplayCB'
	begin object name="co_DisplayCB" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Show"
		OnCreateComponent=co_DisplayCB.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Choose the information to show."
		WinTop=0.3100000
		WinLeft=0.0430000
		WinWidth=0.2500000
		OnChange=GameMenu_WeaponStats.InternalOnChange
	end object
	cb_Display=co_DisplayCB
	// Reference: GUIScrollTextBox'BallisticProV55.GameMenu_WeaponStats.WeaponDescription'
	begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
		CharDelay=0.0010000
		EOLDelay=0.2500000
		bVisibleWhenEmpty=true
		OnCreateComponent=WeaponDescription.InternalOnCreateComponent
		FontScale=0
		WinTop=0.0910000
		WinLeft=0.3450000
		WinWidth=0.6150000
		WinHeight=0.7700000
		RenderWeight=0.5100000
		TabOrder=0
		bAcceptsInput=false
		bNeverFocus=true
	end object
	sb_Desc=WeaponDescription
	// Reference: GUIProgressBar'BallisticProV55.GameMenu_WeaponStats.myPB'
	begin object name="myPB" class=XInterface.GUIProgressBar
		BarBack=Texture'2K4Menus.NewControls.NewStatusBar'
		BarTop=Texture'BW_Core_WeaponTex.Stats.StatusFillDesat'
		BarColor=(R=255,G=200,B=0,A=255)
		CaptionWidth=0.5000000
		FontName="UT2SmallFont"
		ValueRightWidth=0.0000000
		bShowValue=false
		FontScale=0
		StyleName="TextLabel"
		WinHeight=0.0300000
		RenderWeight=1.2000000
	end object
	pb_DPS=myPB
	pb_TTK=myPB
	pb_RPS=myPB
	pb_DPSAlt=myPB
	pb_TTKAlt=myPB
	pb_RPSAlt=myPB
	pb_Raise=myPB
	pb_ViewRecoilFactor=myPB
	pb_DPM=myPB
	pb_MoveSpeed=myPB
	pb_ADSMoveSpeed=myPB
	pb_Displacement=myPB
	BaselineClass=Class'BallisticProV55.M50AssaultRifle'
	Headings[0]="Melee"
	Headings[1]="Sidearms"
	Headings[2]="Sub Machineguns"
	Headings[3]="Assault Rifles"
	Headings[4]="Energy Weapons"
	Headings[5]="Heavy Machineguns"
	Headings[6]="Shotguns"
	Headings[7]="Ordnance"
	Headings[8]="Sniper Rifles"
	Headings[9]="Grenades"
	bRenderWorld=true
	bAllowedAsLast=true
	OnClose=GameMenu_WeaponStats.InternalOnClose
	OnKeyEvent=GameMenu_WeaponStats.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.myCaption'
begin object name="myCaption" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinWidth=0.2000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.MyData'
begin object name="MyData" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinWidth=0.2000000
	WinHeight=0.0300000
end object
// Reference: GUIProgressBar'BallisticProV55.GameMenu_WeaponStats.myPB'
begin object name="myPB" class=XInterface.GUIProgressBar
	BarBack=Texture'2K4Menus.NewControls.NewStatusBar'
	BarTop=Texture'BW_Core_WeaponTex.Stats.StatusFillDesat'
	BarColor=(R=255,G=200,B=0,A=255)
	CaptionWidth=0.5000000
	FontName="UT2SmallFont"
	ValueRightWidth=0.0000000
	bShowValue=false
	FontScale=0
	StyleName="TextLabel"
	WinHeight=0.0300000
	RenderWeight=1.2000000
end object
// Reference: GUIScrollTextBox'BallisticProV55.GameMenu_WeaponStats.WeaponDescription'
begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
	CharDelay=0.0010000
	EOLDelay=0.2500000
	bVisibleWhenEmpty=true
	OnCreateComponent=WeaponDescription.InternalOnCreateComponent
	FontScale=0
	WinTop=0.0910000
	WinLeft=0.3450000
	WinWidth=0.6150000
	WinHeight=0.7700000
	RenderWeight=0.5100000
	TabOrder=0
	bAcceptsInput=false
	bNeverFocus=true
end object
// Reference: moComboBox'BallisticProV55.GameMenu_WeaponStats.co_DisplayCB'
begin object name="co_DisplayCB" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Show"
	OnCreateComponent=co_DisplayCB.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Choose the information to show."
	WinTop=0.3100000
	WinLeft=0.0430000
	WinWidth=0.2500000
	OnChange=GameMenu_WeaponStats.InternalOnChange
end object
// Reference: GUIListBox'BallisticProV55.GameMenu_WeaponStats.WeaponList'
begin object name="WeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=WeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="All the weapons that can become available."
	WinTop=0.4091370
	WinLeft=0.0459770
	WinWidth=0.2450000
	WinHeight=0.4583590
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIButton'BallisticProV55.GameMenu_WeaponStats.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.9250000
	WinLeft=0.4000000
	WinWidth=0.2000000
	TabOrder=0
	OnClick=GameMenu_WeaponStats.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.AltBackImage'
begin object name="AltBackImage" class=XInterface.GUISectionBackground
	Caption="Alt Fire Statistics"
	TopPadding=0.0100000
	BottomPadding=0.0100000
	MaxPerColumn=20
	WinTop=0.0500000
	WinLeft=0.7700000
	WinWidth=0.2000000
	WinHeight=0.8500000
	OnPreDraw=AltBackImage.InternalPreDraw
end object
// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.PriBackImage'
begin object name="PriBackImage" class=XInterface.GUISectionBackground
	Caption="Primary Fire Statistics"
	TopPadding=0.0100000
	BottomPadding=0.0100000
	MaxPerColumn=20
	WinTop=0.0500000
	WinLeft=0.5525000
	WinWidth=0.2000000
	WinHeight=0.8500000
	OnPreDraw=PriBackImage.InternalPreDraw
end object
// Reference: GUISectionBackground'BallisticProV55.GameMenu_WeaponStats.GenBackImage'
begin object name="GenBackImage" class=XInterface.GUISectionBackground
	Caption="General Statistics"
	TopPadding=0.0100000
	BottomPadding=0.0100000
	MaxPerColumn=20
	WinTop=0.0500000
	WinLeft=0.3350000
	WinWidth=0.2000000
	WinHeight=0.8500000
	OnPreDraw=GenBackImage.InternalPreDraw
end object
// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinHeight=1.0000000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBoxWeapons'
begin object name="ImageBoxWeapons" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.3674970
	WinLeft=0.0350000
	WinWidth=0.2650000
	WinHeight=0.5359370
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBoxDesc'
begin object name="ImageBoxDesc" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0474000
	WinLeft=0.3350000
	WinWidth=0.6350000
	WinHeight=0.8600000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.ImageBox_WeaponIcon'
begin object name="ImageBox_WeaponIcon" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.0350000
	WinWidth=0.2650000
	WinHeight=0.2000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.GameMenu_WeaponStats.WeaponIconImage'
begin object name="WeaponIconImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=2
	WinTop=0.0700000
	WinLeft=0.0500000
	WinWidth=0.2270000
	WinHeight=0.1500000
	RenderWeight=0.0040000
end object
// Reference: GUIHeader'BallisticProV55.GameMenu_WeaponStats.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Ballistic Weapon Statistics"
	WinHeight=0.0312500
end object
// Reference: GUILabel'BallisticProV55.GameMenu_WeaponStats.WeaponCaption'
begin object name="WeaponCaption" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.2500000
	WinLeft=0.0350000
	WinWidth=0.2650000
	WinHeight=0.0650000
end object
