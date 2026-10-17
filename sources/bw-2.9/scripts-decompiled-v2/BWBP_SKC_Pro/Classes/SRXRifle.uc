class SRXRifle extends BallisticWeapon
	config(BallisticProV55);

var(SRX) bool bSilenced;
var(SRX) name SilencerBone;
var(SRX) name SilencerOnAnim;
var(SRX) name SilencerOffAnim;
var(SRX) Sound SilencerOnSound;
var(SRX) Sound SilencerOffSound;
var() array<Material> AmpMaterials;
var(SRX) bool bAmped;
var(SRX) name AmplifierBone;
var(SRX) name AmplifierOnAnim;
var(SRX) name AmplifierOffAnim;
var(SRX) Sound AmplifierOnSound;
var(SRX) Sound AmplifierOffSound;
var(SRX) Sound AmplifierPowerOnSound;
var(SRX) Sound AmplifierPowerOffSound;
var(SRX) float AmpCharge;
var(SRX) float DrainRate;
var(SRX) bool bShowCharge;
var Rotator RearSightBoneRot;
var(SRX) bool bHasOptic;
var(SRX) bool bHasIR;
var(SRX) Texture ScopeviewTexIR;
var(SRX) FullSound ThermalOnSound;
var(SRX) FullSound ThermalOffSound;
var(SRX) array<Pawn> PawnList;
var(SRX) Material WallVisionSkin;
var(SRX) bool bThermal;
var(SRX) bool bUpdatePawns;
var(SRX) Pawn UpdatedPawns[128];
var(SRX) Material Flaretex;
var(SRX) float ThermalRange;
var(SRX) ColorModifier ColorMod;
var(SRX) array<M58Cloud> SmokeList;
var(SRX) Actor NVLight;
var(SRX) float NextPawnListUpdateTime;
var() ScriptedTexture WeaponScreen;
var() Material WeaponScreenShader;
var() Material ScreenBase;
var() Material ScreenAmmoBlue;
var() Material ScreenAmmoRed;
var protected const Color MyFontColor;
var float AmmoBarPos;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart, ClientSetHeat;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal, ServerSwitchAmplifier, 
		ServerSwitchSilencer;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasIR = false;
	bHasOptic = false;
	// End:0x56
	if(InStr(WeaponParams.LayoutTags, "IR") != -1)
	{
		bHasIR = true;
		bThermal = true;
		AdjustThermalView(true);
	}
	// End:0xA4
	if(InStr(WeaponParams.LayoutTags, "optic") != -1)
	{
		bHasOptic = true;
		SetBoneScale(3, 0.0000000, 'IronsFront');
		SetBoneRotation('Sight', RearSightBoneRot);		
	}
	else
	{
		Skins[4] = Texture'ONSstructureTextures.CoreGroup.Invisible';
		Skins[5] = Texture'ONSstructureTextures.CoreGroup.Invisible';
		Skins[6] = Texture'ONSstructureTextures.CoreGroup.Invisible';
		Skins[11] = Texture'ONSstructureTextures.CoreGroup.Invisible';
		Skins[12] = Texture'ONSstructureTextures.CoreGroup.Invisible';
	}
	//return;	
}

simulated function ClientScreenStart()
{
	ScreenStart();
	//return;	
}

simulated function ScreenStart()
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Client = self;
	}
	Skins[11] = WeaponScreenShader;
	UpdateScreen();
	// End:0x58
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	AmmoBarPos = 256.0000000 - ((float(MagAmmo) / 20.0000000) * float(256));
	// End:0x74
	if(MagAmmo > 5)
	{
		Tex.DrawTile(AmmoBarPos, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 512.0000000, 256.0000000, ScreenAmmoBlue, MyFontColor);		
	}
	else
	{
		Tex.DrawTile(AmmoBarPos, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 512.0000000, 256.0000000, ScreenAmmoRed, MyFontColor);
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x2D
	if(Instigator.IsLocallyControlled() && bHasOptic)
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(C);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x35
	if(!bHasOptic || (Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x57
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x52
	if(bNoMag || (bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false)
	{
		ConsumeAmmo(Mode, load, bAmountNeededIsMax);		
	}
	else
	{
		// End:0x6D
		if(float(MagAmmo) < load)
		{
			MagAmmo = 0;			
		}
		else
		{
			MagAmmo -= int(load);
		}
	}
	UpdateScreen();
	return true;
	//return;	
}

simulated function Notify_ClipIn()
{
	super.Notify_ClipIn();
	UpdateScreen();
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x31
	if((int(ReloadState) != int(0)) || (int(SightingState) != int(0)) && !bHasIR)
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0xB3
	if(bHasIR && bScopeView)
	{
		bThermal = !bThermal;
		// End:0x88
		if(bThermal)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);
			ServerWeaponSpecial(1);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
			ServerWeaponSpecial(0);
		}
		AdjustThermalView(bThermal);
		return;
	}
	// End:0xE6
	if(bAmped)
	{
		bAmped = !bAmped;
		ServerSwitchAmplifier(bAmped);
		SwitchAmplifier(bAmped);		
	}
	else
	{
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x2E
	if(bHasIR && bScopeView)
	{
		bThermal = bool(i);
		ServerAdjustThermal(bThermal);
	}
	//return;	
}

simulated exec function ToggleAmplifier(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0x62
	if(bSilenced)
	{
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);		
	}
	else
	{
		bAmped = !bAmped;
		ServerSwitchAmplifier(bAmped);
		SwitchAmplifier(bAmped);
	}
	//return;	
}

function ServerSwitchAmplifier(bool bNewValue)
{
	bAmped = bNewValue;
	SwitchAmplifier(bAmped);
	bServerReloading = true;
	ReloadState = 9;
	// End:0x7E
	if(bAmped)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		CurrentWeaponMode = 1;
		ServerSwitchWeaponMode(1);
		AmpCharge = 10.0000000;		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
		AmpCharge = 0.0000000;
	}
	// End:0xF1
	if(int(Role) == int(ROLE_Authority))
	{
		SRXAttachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x147
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		SRXAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[14] = AmpMaterials[0];
		Skins[15] = AmpMaterials[2];		
	}
	else
	{
		// End:0x19B
		if((int(CurrentWeaponMode) == 2) && AmpCharge > float(0))
		{
			SRXAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[14] = AmpMaterials[1];
			Skins[15] = AmpMaterials[3];
		}
	}
	//return;	
}

simulated function SwitchAmplifier(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x6D
	if(bNewValue)
	{
		PlayAnim(AmplifierOnAnim);
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		AmpCharge = 10.0000000;		
	}
	else
	{
		PlayAnim(AmplifierOffAnim);
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		AmpCharge = 0.0000000;
	}
	// End:0xD8
	if(int(Role) == int(ROLE_Authority))
	{
		SRXAttachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x12E
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		SRXAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[14] = AmpMaterials[0];
		Skins[15] = AmpMaterials[2];		
	}
	else
	{
		// End:0x182
		if((int(CurrentWeaponMode) == 2) && AmpCharge > float(0))
		{
			SRXAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[14] = AmpMaterials[1];
			Skins[15] = AmpMaterials[3];
		}
	}
	//return;	
}

simulated function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		SRXPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super.CommonSwitchWeaponMode(newmode);
	SRXPrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	// End:0x7C
	if((int(newmode) == 1) && AmpCharge > float(0))
	{
		SRXAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[14] = AmpMaterials[0];
		Skins[15] = AmpMaterials[2];		
	}
	else
	{
		// End:0xD0
		if((int(newmode) == 2) && AmpCharge > float(0))
		{
			SRXAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[14] = AmpMaterials[1];
			Skins[15] = AmpMaterials[3];
		}
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	bServerReloading = true;
	ReloadState = 9;
	bFireMode[0].bAISilent = bSilenced;
	// End:0x8D
	if(bSilenced)
	{
		BallisticInstantFire(bFireMode[0]).TraceRange.Max = 10000.0000000;
		BallisticInstantFire(bFireMode[0]).TraceRange.Min = 10000.0000000;		
	}
	else
	{
		BallisticInstantFire(bFireMode[0]).TraceRange = BallisticInstantFire(bFireMode[0]).default.TraceRange;
	}
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x34
	if(bNewValue)
	{
		PlayAnim(SilencerOnAnim);		
	}
	else
	{
		PlayAnim(SilencerOffAnim);
	}
	// End:0x66
	if(int(Role) == int(ROLE_Authority))
	{
		SRXAttachment(ThirdPersonActor).SetSilenced(bNewValue);
	}
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	//return;	
}

simulated function Notify_SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	//return;	
}

simulated function Notify_AmplifierOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_AmplifierOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_AmplifierShow()
{
	SetBoneScale(2, 1.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_AmplifierHide()
{
	SetBoneScale(2, 0.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x22
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	// End:0x3F
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local float BotRand;

	super.BringUp(PrevWeapon);
	// End:0x5C
	if((bHasOptic && Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x5C
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	SetBoneScale(2, 0.0000000, AmplifierBone);
	// End:0x99
	if(bHasOptic)
	{
		SetBoneScale(3, 0.0000000, 'IronsFront');
		SetBoneRotation('Sight', RearSightBoneRot);
	}
	// End:0x148
	if(AIController(Instigator.Controller) != none)
	{
		BotRand = FRand();
		// End:0xEC
		if(BotRand > 0.2500000)
		{
			bSilenced = true;
			ServerSwitchSilencer(bSilenced);
			SwitchSilencer(bSilenced);			
		}
		else
		{
			// End:0x148
			if(BotRand > 0.5000000)
			{
				bAmped = true;
				ServerSwitchAmplifier(bAmped);
				SwitchAmplifier(bAmped);
				AmpCharge = 100.0000000;
				DrainRate = 0.0000000;
				// End:0x148
				if(BotRand > 0.7500000)
				{
					CommonSwitchWeaponMode(2);
				}
			}
		}
	}
	// End:0x166
	if(bAmped)
	{
		SetBoneScale(2, 1.0000000, AmplifierBone);		
	}
	else
	{
		SetBoneScale(2, 0.0000000, AmplifierBone);
	}
	// End:0x195
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	// End:0x1B3
	if(ColorMod != none)
	{
		return;
	}
	ColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0x27C
	if(ColorMod != none)
	{
		ColorMod.Material = FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal';
		ColorMod.Color.R = byte(255);
		ColorMod.Color.G = byte(255);
		ColorMod.Color.B = byte(255);
		ColorMod.Color.A = byte(255);
		ColorMod.AlphaBlend = false;
		ColorMod.RenderTwoSided = true;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x12
	if(super.PutDown())
	{
		AdjustThermalView(false);
		return true;
	}
	return false;
	//return;	
}

simulated event Destroyed()
{
	// End:0x2F
	if(ColorMod != none)
	{
		Level.ObjectPool.FreeObject(ColorMod);
		ColorMod = none;
	}
	AdjustThermalView(false);
	// End:0x4D
	if(NVLight != none)
	{
		NVLight.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x3E
	if(!bScopeView)
	{
		// End:0x34
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}		
	}
	else
	{
		// End:0x71
		if(bThermal)
		{
			// End:0x6A
			if(int(Level.NetMode) == int(NM_Client))
			{
				AdjustThermalView(true);				
			}
			else
			{
				ServerAdjustThermal(true);
			}
		}
	}
	//return;	
}

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BWBP_SKC_Pro.HKARNVLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x29
	if(Level.TimeSeconds >= NextPawnListUpdateTime)
	{
		UpdatePawnList();
	}
	// End:0x135
	if(bThermal && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xD1
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x114
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
	}
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x14
	if(bThermal)
	{
		DrawThermalMode(C);
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function UpdatePawnList()
{
	local Pawn P;
	local int i;
	local float dist;

	PawnList.Length = 0;
	// End:0x21E
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x96
		if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
		{
			continue;			
		}
		PawnList[PawnList.Length] = P;
		dist = VSize(P.Location - Instigator.Location);
		// End:0x21D
		if(((dist <= ThermalRange) && (Normal(P.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > (float(1) - ((Instigator.Controller.FovAngle * 0.9000000) / float(180)))) && Instigator.LineOfSightTo(P) || (Normal(P.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > (0.9850000 + (0.0150000 * (dist / ThermalRange))))
		{
			// End:0x205
			if(!Instigator.IsLocallyControlled())
			{
				P.NetUpdateTime = Level.TimeSeconds - float(1);
				P.bAlwaysRelevant = true;
			}
			UpdatedPawns[i] = P;
			i++;
		}		
	}	
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	local Pawn P;
	local int i, j;
	local float dist, DotP;
	local array<Material> OldSkins;
	local int OldSkinCount;
	local bool bLOS, bFocused;
	local Vector Start;
	local array<Material> AttOldSkins0, AttOldSkins1;

	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.Attachment.SKAR-IRFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.SKAR.SKAR-StaticFinal', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	// End:0x135
	if(ColorMod == none)
	{
		return;
	}
	C.Style = 5;
	Start = Instigator.Location + Instigator.EyePosition();
	j = 0;
	J0x172:

	// End:0x8D5 [Loop If]
	if(j < PawnList.Length)
	{
		// End:0x8CB
		if((PawnList[j] != none) && PawnList[j] != Level.GetLocalPlayerController().Pawn)
		{
			P = PawnList[j];
			bFocused = false;
			bLOS = false;
			ThermalRange = default.ThermalRange + (float(2000) * FMin(1.0000000, VSize(P.Velocity) / float(450)));
			dist = VSize(P.Location - Instigator.Location);
			// End:0x24C
			if(dist > ThermalRange)
			{
				// [Explicit Continue]
				goto J0x8CB;
			}
			DotP = Normal(P.Location - Start) Dot Vector(Instigator.GetViewRotation());
			// End:0x2B0
			if(DotP < Cos((Instigator.Controller.FovAngle / 1.7000000) * 0.0174530))
			{
				// [Explicit Continue]
				goto J0x8CB;
			}
			// End:0x2CF
			if(Instigator.LineOfSightTo(P))
			{
				bLOS = true;
			}
			// End:0x8C8
			if(bLOS)
			{
				DotP = (DotP - 0.6000000) / 0.4000000;
				DotP = FMax(DotP, 0.0000000);
				// End:0x339
				if(dist < float(500))
				{
					ColorMod.Color.R = byte(DotP * 255.0000000);					
				}
				else
				{
					ColorMod.Color.R = byte(DotP * (float(255) - (FClamp((dist - float(500)) / ((ThermalRange - float(500)) * 0.8000000), 0.0000000, 1.0000000) * float(255))));
				}
				ColorMod.Color.G = byte(DotP * (128.0000000 - ((dist / ThermalRange) * 96.0000000)));
				OldSkinCount = P.Skins.Length;
				i = 0;
				J0x3E6:

				// End:0x45C [Loop If]
				if(i < Max(2, OldSkinCount))
				{
					// End:0x42B
					if(OldSkinCount > i)
					{
						OldSkins[i] = P.Skins[i];						
					}
					else
					{
						OldSkins[i] = none;
					}
					P.Skins[i] = ColorMod;
					i++;
					// [Loop Continue]
					goto J0x3E6;
				}
				P.bUnlit = true;
				i = 0;
				J0x474:

				// End:0x687 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x67D
					if(P.Attached[i] != none)
					{
						// End:0x65D
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x55E
							if(P.Attached[i].Skins.Length > 0)
							{
								AttOldSkins0[i] = P.Attached[i].Skins[0];
								P.Attached[i].Skins[0] = ColorMod;								
							}
							else
							{
								AttOldSkins0[i] = none;
								P.Attached[i].Skins[0] = ColorMod;
							}
							// End:0x604
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = P.Attached[i].Skins[1];
								P.Attached[i].Skins[1] = ColorMod;
							}
							// End:0x65A
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = none;
								P.Attached[i].Skins[1] = ColorMod;
							}
							// [Explicit Continue]
							goto J0x67D;
						}
						P.Attached[i].SetDrawType(0);
					}
					J0x67D:

					i++;
					// [Loop Continue]
					goto J0x474;
				}
				C.DrawActor(P, false, true);
				P.Skins.Length = OldSkinCount;
				i = 0;
				J0x6B6:

				// End:0x6F9 [Loop If]
				if(i < P.Skins.Length)
				{
					P.Skins[i] = OldSkins[i];
					i++;
					// [Loop Continue]
					goto J0x6B6;
				}
				P.bUnlit = false;
				i = 0;
				J0x711:

				// End:0x8B5 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x8AB
					if(P.Attached[i] != none)
					{
						// End:0x870
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x817
							if(AttOldSkins1[i] == none)
							{
								// End:0x7C9
								if(AttOldSkins0[i] == none)
								{
									P.Attached[i].Skins.Length = 0;									
								}
								else
								{
									P.Attached[i].Skins.Length = 1;
									P.Attached[i].Skins[0] = AttOldSkins0[i];
								}								
							}
							else
							{
								P.Attached[i].Skins[0] = AttOldSkins0[i];
								P.Attached[i].Skins[1] = AttOldSkins1[i];
							}
							// [Explicit Continue]
							goto J0x8AB;
						}
						P.Attached[i].SetDrawType(P.Attached[i].default.DrawType);
					}
					J0x8AB:

					i++;
					// [Loop Continue]
					goto J0x711;
				}
				AttOldSkins0.Length = 0;
				AttOldSkins1.Length = 0;
				// [Explicit Continue]
				goto J0x8CB;
			}
			// [Explicit Continue]
		}
		J0x8CB:

		j++;
		// [Loop Continue]
		goto J0x172;
	}
	//return;	
}

simulated function AdjustThermalView(bool bNewValue)
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x31
	if(!bNewValue)
	{
		bUpdatePawns = false;		
	}
	else
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);
	}
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x33
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x42:

		// End:0x94 [Loop If]
		if(i < 128)
		{
			// End:0x8A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x42;
		}
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x14
	if(!bShowCharge)
	{
		return 0.0000000;		
	}
	else
	{
		return AmpCharge / float(10);
	}
	//return;	
}

simulated function AddHeat(float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	AmpCharge = FMax(0.0000000, AmpCharge + Amount);
	// End:0xD4
	if(AmpCharge <= float(0))
	{
		PlaySound(AmplifierPowerOffSound,, 2.0000000,, 32.0000000);
		Skins[14] = AmpMaterials[4];
		Skins[15] = AmpMaterials[5];
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
		// End:0xD4
		if(int(Role) == int(ROLE_Authority))
		{
			SRXAttachment(ThirdPersonActor).SetAmped(false);
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x38
	if(AmpCharge > float(0))
	{
		AmpCharge = FMax(0.0000000, AmpCharge - (DrainRate * dt));
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	Result += ((dist - float(1000)) / float(2000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	SilencerBone="Silencer"
	SilencerOnAnim="AddSilencer"
	SilencerOffAnim="RemoveSilencer"
	SilencerOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalGreen'
	AmpMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
	AmpMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowGreenShader'
	AmpMaterials[4]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseDepleted'
	AmpMaterials[5]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	AmplifierBone="AMP"
	AmplifierOnAnim="AddAMP"
	AmplifierOffAnim="RemoveAMP"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BW_Core_WeaponSound.AMP.Amp-Install'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	DrainRate=0.1500000
	RearSightBoneRot=(Pitch=0,Yaw=16384,Roll=0)
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=25000.0000000
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.SRX.SRX-ScriptLCD'
	WeaponScreenShader=Shader'BWBP_SKC_Tex.SRX.SRX-ScriptLCD-SD'
	ScreenBase=Texture'BWBP_SKC_Tex.SRX.SRX-Screen'
	ScreenAmmoBlue=Texture'BWBP_SKC_Tex.SRX.SRX-Screen'
	ScreenAmmoRed=FinalBlend'BWBP_SKC_Tex.SRX.SRX-ScreenRed-FB'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;75.0;1.0;0.0;-999.0")
	SightAnimScale=0.6000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SRXWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SRXWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SRXWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SRXWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SRX.BigIcon_SRXRifle'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Amplified: Explosive",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Amplified: Corrosive",bUnavailable=true,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	CurrentWeaponMode=0
	FullZoomFOV=70.0000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Cock',Volume=0.6500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross3',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=255,A=123),StartSize1=20,StartSize2=57)
	bWT_Bullet=true
	ManualLines[0]="7.62mm Fire"
	ManualLines[1]="Attach/Detach AMP. Corrosive does extra damage to shield while Explosive damage does radius damage."
	ManualLines[2]="Attach/Detach Silencer."
	SightOffset=(X=0.0000000,Y=0.0600000,Z=2.7000000)
	GunLength=72.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.SRXPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.SRXSecondaryFire'
	SelectAnimRate=1.3500000
	PutDownTime=0.3500000
	BringUpTime=0.3500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="All weapons evolve over time, adapting to new environments and forms of combat, the SRK-650 Battle Rifle is no exception. NDTR's improvement over the original SRS-900 model, the SRK was created to stand up to the harsh winters of Kalendra with more rugged ergonomics, a holo-sight for closer ranged engagements and a digital ammo counter. But NDTR went one step and beyond by allowing the SRK to not just accept silencers, but also the new elemental AMP tech to counter Cryon armor and Krao hordes with acidic and explosive tech respectively. Slated to join it's longer ranged brother in due time, the SRK will be a blessing for the UTC troops, and a curse for their enemies."
	Priority=40
	HudColor=(R=200,G=50,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_SKC_Pro.SRXPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.5000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.SRXAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SRX.SmallIcon_SRXRifle'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="SRK-650 Battle Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SRX_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.SRX.SRX-RifleDark'
	Skins[2]=Texture'BWBP_SKC_Tex.SRX.SRX-StockBlack'
	Skins[3]=Texture'BWBP_SKC_Tex.SRX.SRX-Irons'
	Skins[4]=Texture'BWBP_SKC_Tex.SRX.SRX-Holo'
	Skins[5]=Texture'BWBP_SKC_Tex.SRX.SRX-Cable'
	Skins[6]=Texture'BWBP_SKC_Tex.SRX.SRX-Plating'
	Skins[7]=Texture'BWBP_SKC_Tex.SRX.SRX-Barrel'
	Skins[8]=Texture'BWBP_SKC_Tex.SRX.SRX-Misc'
	Skins[9]=Texture'BWBP_SKC_Tex.SRX.SRX-Muzzle'
	Skins[10]=Texture'UCGeneric.SolidColours.Black'
	Skins[11]=Texture'BWBP_SKC_Tex.SRX.SRX-ScreenMask'
	Skins[12]=Shader'BWBP_SKC_Tex.SRX.SRX-Reticle-S'
	Skins[13]=Texture'BWBP_SKC_Tex.SRX.SRX-Supp'
	Skins[14]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	Skins[15]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
}
