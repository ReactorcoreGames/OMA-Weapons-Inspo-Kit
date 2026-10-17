class BallisticProMenuPanel extends MidGamePanel
	editinlinenew
	instanced;

var() automated KeyBindEdit e_ADSEdit;
var() automated KeyBindEdit e_ReloadEdit;
var() automated KeyBindEdit e_WpnSpcEdit;
var() automated KeyBindEdit e_SprintEdit;
var() automated KeyBindEdit e_FireModeEdit;
var() automated KeyBindEdit e_DualSelectEdit;
var() automated KeyBindEdit e_LoadoutEdit;
var() automated KeyBindEdit e_StreakEdit;
var() automated KeyBindEdit e_MeleeEdit;
var() automated KeyBindEdit e_PreferencesEdit;
var() automated GUILabel l_ADSLabel;
var() automated GUILabel l_ReloadLabel;
var() automated GUILabel l_WpnSpcLabel;
var() automated GUILabel l_SprintLabel;
var() automated GUILabel l_FireModeLabel;
var() automated GUILabel l_DualSelectLabel;
var() automated GUILabel l_LoadoutLabel;
var() automated GUILabel l_StreakLabel;
var() automated GUILabel l_MeleeLabel;
var() automated GUILabel l_PreferencesLabel;
var() automated GUIEditBox b_Caption;
var localized string ADSText;
var localized string ReloadText;
var localized string WpnSpcText;
var localized string SprintText;
var localized string DualSelectText;
var localized string LoadoutText;
var localized string FireModeText;
var localized string StreakText;
var localized string MeleeText;
var localized string PreferencesText;
var localized string CaptionText;

function InitComponent(GUIController InController, GUIComponent InOwner)
{
	b_Caption.Caption = CaptionText;
	l_ADSLabel.Caption = ADSText;
	l_ReloadLabel.Caption = ReloadText;
	l_WpnSpcLabel.Caption = WpnSpcText;
	l_SprintLabel.Caption = SprintText;
	l_FireModeLabel.Caption = FireModeText;
	l_DualSelectLabel.Caption = DualSelectText;
	l_LoadoutLabel.Caption = LoadoutText;
	l_StreakLabel.Caption = StreakText;
	l_MeleeLabel.Caption = MeleeText;
	l_PreferencesLabel.Caption = PreferencesText;
	super(GUIPanel).InitComponent(InController, InOwner);
	//return;	
}

function ADSKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.ADSKey;
	//return;	
}

function ReloadKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.ReloadKey;
	//return;	
}

function WpnSpcKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.WpnSpcKey;
	//return;	
}

function SprintKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.SprintKey;
	//return;	
}

function FireModeKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.FireModeKey;
	//return;	
}

function DualSelectKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.DualSelectKey;
	//return;	
}

function LoadoutKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.LoadoutKey;
	//return;	
}

function StreakKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.StreakKey;
	//return;	
}

function MeleeKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.MeleeKey;
	//return;	
}

function PreferencesKeyInit(out byte keyCode)
{
	keyCode = Class'BWInteractions3.BallisticProInteractions'.default.PreferencesKey;
	//return;	
}

function ADSKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.ADSKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function ReloadKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.ReloadKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function WpnSpcKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.WpnSpcKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function SprintKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.SprintKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function FireModeKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.FireModeKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function DualSelectKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.DualSelectKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function LoadoutKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.LoadoutKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function StreakKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.StreakKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function MeleeKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.MeleeKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

function PreferencesKeyChanged(byte keyCode)
{
	Class'BWInteractions3.BallisticProInteractions'.default.PreferencesKey = keyCode;
	Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
	//return;	
}

defaultproperties
{
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.ADSEdit'
	begin object name="ADSEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.ADSKeyInit
		OnKeyChanged=BallisticProMenuPanel.ADSKeyChanged
		WinTop=0.0900000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=ADSEdit.InternalActivate
		OnDeActivate=ADSEdit.InternalDeactivate
		OnClick=ADSEdit.MouseClick
		OnKeyType=ADSEdit.InternalOnKeyType
		OnKeyEvent=ADSEdit.InternalOnKeyEvent
	end object
	e_ADSEdit=ADSEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.ReloadEdit'
	begin object name="ReloadEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.ReloadKeyInit
		OnKeyChanged=BallisticProMenuPanel.ReloadKeyChanged
		WinTop=0.1550000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=ReloadEdit.InternalActivate
		OnDeActivate=ReloadEdit.InternalDeactivate
		OnClick=ReloadEdit.MouseClick
		OnKeyType=ReloadEdit.InternalOnKeyType
		OnKeyEvent=ReloadEdit.InternalOnKeyEvent
	end object
	e_ReloadEdit=ReloadEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.WpnSpcEdit'
	begin object name="WpnSpcEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.WpnSpcKeyInit
		OnKeyChanged=BallisticProMenuPanel.WpnSpcKeyChanged
		WinTop=0.2200000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=WpnSpcEdit.InternalActivate
		OnDeActivate=WpnSpcEdit.InternalDeactivate
		OnClick=WpnSpcEdit.MouseClick
		OnKeyType=WpnSpcEdit.InternalOnKeyType
		OnKeyEvent=WpnSpcEdit.InternalOnKeyEvent
	end object
	e_WpnSpcEdit=WpnSpcEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.SprintEdit'
	begin object name="SprintEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.SprintKeyInit
		OnKeyChanged=BallisticProMenuPanel.SprintKeyChanged
		WinTop=0.2900000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=SprintEdit.InternalActivate
		OnDeActivate=SprintEdit.InternalDeactivate
		OnClick=SprintEdit.MouseClick
		OnKeyType=SprintEdit.InternalOnKeyType
		OnKeyEvent=SprintEdit.InternalOnKeyEvent
	end object
	e_SprintEdit=SprintEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.FireModeEdit'
	begin object name="FireModeEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.FireModeKeyInit
		OnKeyChanged=BallisticProMenuPanel.FireModeKeyChanged
		WinTop=0.3600000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=FireModeEdit.InternalActivate
		OnDeActivate=FireModeEdit.InternalDeactivate
		OnClick=FireModeEdit.MouseClick
		OnKeyType=FireModeEdit.InternalOnKeyType
		OnKeyEvent=FireModeEdit.InternalOnKeyEvent
	end object
	e_FireModeEdit=FireModeEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.DualSelectEdit'
	begin object name="DualSelectEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.DualSelectKeyInit
		OnKeyChanged=BallisticProMenuPanel.DualSelectKeyChanged
		WinTop=0.4300000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=DualSelectEdit.InternalActivate
		OnDeActivate=DualSelectEdit.InternalDeactivate
		OnClick=DualSelectEdit.MouseClick
		OnKeyType=DualSelectEdit.InternalOnKeyType
		OnKeyEvent=DualSelectEdit.InternalOnKeyEvent
	end object
	e_DualSelectEdit=DualSelectEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.LoadoutEdit'
	begin object name="LoadoutEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.LoadoutKeyInit
		OnKeyChanged=BallisticProMenuPanel.LoadoutKeyChanged
		WinTop=0.5000000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=LoadoutEdit.InternalActivate
		OnDeActivate=LoadoutEdit.InternalDeactivate
		OnClick=LoadoutEdit.MouseClick
		OnKeyType=LoadoutEdit.InternalOnKeyType
		OnKeyEvent=LoadoutEdit.InternalOnKeyEvent
	end object
	e_LoadoutEdit=LoadoutEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.StreakEdit'
	begin object name="StreakEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.StreakKeyInit
		OnKeyChanged=BallisticProMenuPanel.StreakKeyChanged
		WinTop=0.5700000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=StreakEdit.InternalActivate
		OnDeActivate=StreakEdit.InternalDeactivate
		OnClick=StreakEdit.MouseClick
		OnKeyType=StreakEdit.InternalOnKeyType
		OnKeyEvent=StreakEdit.InternalOnKeyEvent
	end object
	e_StreakEdit=StreakEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.MeleeEdit'
	begin object name="MeleeEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.MeleeKeyInit
		OnKeyChanged=BallisticProMenuPanel.MeleeKeyChanged
		WinTop=0.6400000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=MeleeEdit.InternalActivate
		OnDeActivate=MeleeEdit.InternalDeactivate
		OnClick=MeleeEdit.MouseClick
		OnKeyType=MeleeEdit.InternalOnKeyType
		OnKeyEvent=MeleeEdit.InternalOnKeyEvent
	end object
	e_MeleeEdit=MeleeEdit
	// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.PreferencesEdit'
	begin object name="PreferencesEdit" class=BWInteractions3.KeyBindEdit
		OnInitKey=BallisticProMenuPanel.PreferencesKeyInit
		OnKeyChanged=BallisticProMenuPanel.PreferencesKeyChanged
		WinTop=0.7100000
		WinLeft=0.5500000
		WinWidth=0.1500000
		WinHeight=0.0400000
		OnActivate=PreferencesEdit.InternalActivate
		OnDeActivate=PreferencesEdit.InternalDeactivate
		OnClick=PreferencesEdit.MouseClick
		OnKeyType=PreferencesEdit.InternalOnKeyType
		OnKeyEvent=PreferencesEdit.InternalOnKeyEvent
	end object
	e_PreferencesEdit=PreferencesEdit
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.ADSLabel'
	begin object name="ADSLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0900000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_ADSLabel=ADSLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.ReloadLabel'
	begin object name="ReloadLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.1550000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_ReloadLabel=ReloadLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.WpnSpcLabel'
	begin object name="WpnSpcLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.2200000
		WinLeft=0.3000000
		WinWidth=0.1800000
		WinHeight=0.0400000
	end object
	l_WpnSpcLabel=WpnSpcLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.SprintLabel'
	begin object name="SprintLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.2900000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_SprintLabel=SprintLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.FireModeLabel'
	begin object name="FireModeLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.3600000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_FireModeLabel=FireModeLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.DualSelectLabel'
	begin object name="DualSelectLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.4300000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_DualSelectLabel=DualSelectLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.LoadoutLabel'
	begin object name="LoadoutLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.5000000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_LoadoutLabel=LoadoutLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.StreakLabel'
	begin object name="StreakLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.5700000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_StreakLabel=StreakLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.MeleeLabel'
	begin object name="MeleeLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.6400000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_MeleeLabel=MeleeLabel
	// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.PreferencesLabel'
	begin object name="PreferencesLabel" class=XInterface.GUILabel
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.7100000
		WinLeft=0.3000000
		WinWidth=0.1500000
		WinHeight=0.0400000
	end object
	l_PreferencesLabel=PreferencesLabel
	// Reference: GUIEditBox'BWInteractions3.BallisticProMenuPanel.MyBorder'
	begin object name="MyBorder" class=XInterface.GUIEditBox
		bReadOnly=true
		WinTop=0.0250000
		WinLeft=0.0100000
		WinWidth=0.9800000
		WinHeight=0.0400000
		bTabStop=false
		bNeverFocus=true
		OnActivate=MyBorder.InternalActivate
		OnDeActivate=MyBorder.InternalDeactivate
		OnKeyType=MyBorder.InternalOnKeyType
		OnKeyEvent=MyBorder.InternalOnKeyEvent
	end object
	b_Caption=MyBorder
	ADSText="Iron Sights"
	ReloadText="Reload"
	WpnSpcText="Wep Function"
	SprintText="Sprint"
	DualSelectText="Dual Wield"
	LoadoutText="Loadout Menu"
	FireModeText="Fire Mode"
	StreakText="Claim Killstreak"
	MeleeText="Melee Attack"
	PreferencesText="Preferences Menu"
	CaptionText="Key Assignments"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.DualSelectEdit'
begin object name="DualSelectEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.DualSelectKeyInit
	OnKeyChanged=BallisticProMenuPanel.DualSelectKeyChanged
	WinTop=0.4300000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=DualSelectEdit.InternalActivate
	OnDeActivate=DualSelectEdit.InternalDeactivate
	OnClick=DualSelectEdit.MouseClick
	OnKeyType=DualSelectEdit.InternalOnKeyType
	OnKeyEvent=DualSelectEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.FireModeEdit'
begin object name="FireModeEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.FireModeKeyInit
	OnKeyChanged=BallisticProMenuPanel.FireModeKeyChanged
	WinTop=0.3600000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=FireModeEdit.InternalActivate
	OnDeActivate=FireModeEdit.InternalDeactivate
	OnClick=FireModeEdit.MouseClick
	OnKeyType=FireModeEdit.InternalOnKeyType
	OnKeyEvent=FireModeEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.LoadoutEdit'
begin object name="LoadoutEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.LoadoutKeyInit
	OnKeyChanged=BallisticProMenuPanel.LoadoutKeyChanged
	WinTop=0.5000000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=LoadoutEdit.InternalActivate
	OnDeActivate=LoadoutEdit.InternalDeactivate
	OnClick=LoadoutEdit.MouseClick
	OnKeyType=LoadoutEdit.InternalOnKeyType
	OnKeyEvent=LoadoutEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.StreakEdit'
begin object name="StreakEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.StreakKeyInit
	OnKeyChanged=BallisticProMenuPanel.StreakKeyChanged
	WinTop=0.5700000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=StreakEdit.InternalActivate
	OnDeActivate=StreakEdit.InternalDeactivate
	OnClick=StreakEdit.MouseClick
	OnKeyType=StreakEdit.InternalOnKeyType
	OnKeyEvent=StreakEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.ADSEdit'
begin object name="ADSEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.ADSKeyInit
	OnKeyChanged=BallisticProMenuPanel.ADSKeyChanged
	WinTop=0.0900000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=ADSEdit.InternalActivate
	OnDeActivate=ADSEdit.InternalDeactivate
	OnClick=ADSEdit.MouseClick
	OnKeyType=ADSEdit.InternalOnKeyType
	OnKeyEvent=ADSEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.ReloadEdit'
begin object name="ReloadEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.ReloadKeyInit
	OnKeyChanged=BallisticProMenuPanel.ReloadKeyChanged
	WinTop=0.1550000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=ReloadEdit.InternalActivate
	OnDeActivate=ReloadEdit.InternalDeactivate
	OnClick=ReloadEdit.MouseClick
	OnKeyType=ReloadEdit.InternalOnKeyType
	OnKeyEvent=ReloadEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.SprintEdit'
begin object name="SprintEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.SprintKeyInit
	OnKeyChanged=BallisticProMenuPanel.SprintKeyChanged
	WinTop=0.2900000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=SprintEdit.InternalActivate
	OnDeActivate=SprintEdit.InternalDeactivate
	OnClick=SprintEdit.MouseClick
	OnKeyType=SprintEdit.InternalOnKeyType
	OnKeyEvent=SprintEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.PreferencesEdit'
begin object name="PreferencesEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.PreferencesKeyInit
	OnKeyChanged=BallisticProMenuPanel.PreferencesKeyChanged
	WinTop=0.7100000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=PreferencesEdit.InternalActivate
	OnDeActivate=PreferencesEdit.InternalDeactivate
	OnClick=PreferencesEdit.MouseClick
	OnKeyType=PreferencesEdit.InternalOnKeyType
	OnKeyEvent=PreferencesEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.MeleeEdit'
begin object name="MeleeEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.MeleeKeyInit
	OnKeyChanged=BallisticProMenuPanel.MeleeKeyChanged
	WinTop=0.6400000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=MeleeEdit.InternalActivate
	OnDeActivate=MeleeEdit.InternalDeactivate
	OnClick=MeleeEdit.MouseClick
	OnKeyType=MeleeEdit.InternalOnKeyType
	OnKeyEvent=MeleeEdit.InternalOnKeyEvent
end object
// Reference: KeyBindEdit'BWInteractions3.BallisticProMenuPanel.WpnSpcEdit'
begin object name="WpnSpcEdit" class=BWInteractions3.KeyBindEdit
	OnInitKey=BallisticProMenuPanel.WpnSpcKeyInit
	OnKeyChanged=BallisticProMenuPanel.WpnSpcKeyChanged
	WinTop=0.2200000
	WinLeft=0.5500000
	WinWidth=0.1500000
	WinHeight=0.0400000
	OnActivate=WpnSpcEdit.InternalActivate
	OnDeActivate=WpnSpcEdit.InternalDeactivate
	OnClick=WpnSpcEdit.MouseClick
	OnKeyType=WpnSpcEdit.InternalOnKeyType
	OnKeyEvent=WpnSpcEdit.InternalOnKeyEvent
end object
// Reference: GUIEditBox'BWInteractions3.BallisticProMenuPanel.MyBorder'
begin object name="MyBorder" class=XInterface.GUIEditBox
	bReadOnly=true
	WinTop=0.0250000
	WinLeft=0.0100000
	WinWidth=0.9800000
	WinHeight=0.0400000
	bTabStop=false
	bNeverFocus=true
	OnActivate=MyBorder.InternalActivate
	OnDeActivate=MyBorder.InternalDeactivate
	OnKeyType=MyBorder.InternalOnKeyType
	OnKeyEvent=MyBorder.InternalOnKeyEvent
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.ADSLabel'
begin object name="ADSLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0900000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.ReloadLabel'
begin object name="ReloadLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.1550000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.WpnSpcLabel'
begin object name="WpnSpcLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.2200000
	WinLeft=0.3000000
	WinWidth=0.1800000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.SprintLabel'
begin object name="SprintLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.2900000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.FireModeLabel'
begin object name="FireModeLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.3600000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.DualSelectLabel'
begin object name="DualSelectLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.4300000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.LoadoutLabel'
begin object name="LoadoutLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.5000000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.StreakLabel'
begin object name="StreakLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.5700000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.MeleeLabel'
begin object name="MeleeLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.6400000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BWInteractions3.BallisticProMenuPanel.PreferencesLabel'
begin object name="PreferencesLabel" class=XInterface.GUILabel
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.7100000
	WinLeft=0.3000000
	WinWidth=0.1500000
	WinHeight=0.0400000
end object
