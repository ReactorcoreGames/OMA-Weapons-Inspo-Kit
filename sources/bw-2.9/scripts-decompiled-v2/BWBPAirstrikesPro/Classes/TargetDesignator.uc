class TargetDesignator extends BallisticWeapon
	config(BallisticProV55);

struct StrikeInfoStruct
{
	var Class<Projectile> BombClass;
	var int Cooldown;
	var float BomberSpeed;
	var float BombRange;
	var float BombInterval;
	var float MinZDist;
	var float MinRange;
	var Vector BombOffset;
	var float Compensation;
	var bool bRemoteFired;
	var Class<Actor> Dropper;
	var string ModeDescription;
};

var array<StrikeInfoStruct> StrikeInfo;
var Vector EndEffect;
var Vector MarkLocation;
var int LastRangeFound;
var float NextRangeFindTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientResupplyStart;
}

function ResupplyStart()
{
	FireMode[1].SetTimer(float(StrikeInfo[int(CurrentWeaponMode)].Cooldown), false);
	// End:0x52
	if(!Instigator.IsLocallyControlled())
	{
		ClientResupplyStart(StrikeInfo[int(CurrentWeaponMode)].Cooldown);
	}
	//return;	
}

simulated function ClientResupplyStart(int cd)
{
	FireMode[1].SetTimer(float(cd), false);
	//return;	
}

function bool CanBomb(Vector MarkLocation, float NeededRadius)
{
	// End:0x37
	if(!FastTrace(MarkLocation + (StrikeInfo[int(CurrentWeaponMode)].MinZDist * vect(0.0000000, 0.0000000, 1.0000000)), MarkLocation))
	{
		return false;
	}
	// End:0x57
	if(float(LastRangeFound) < StrikeInfo[int(CurrentWeaponMode)].MinRange)
	{
		return false;
	}
	// End:0x7A
	if((NeededRadius <= float(0)) || TargetDesignatorFire(FireMode[0]) == none)
	{
		return true;
	}
	MarkLocation += vect(0.0000000, 0.0000000, 100.0000000);
	return ((FastTrace(MarkLocation + (vect(1.0000000, 0.0000000, 0.0000000) * NeededRadius), MarkLocation) && FastTrace(MarkLocation + (vect(-1.0000000, 0.0000000, 0.0000000) * NeededRadius), MarkLocation)) && FastTrace(MarkLocation + (vect(0.0000000, 1.0000000, 0.0000000) * NeededRadius), MarkLocation)) && FastTrace(MarkLocation + (vect(0.0000000, -1.0000000, 0.0000000) * NeededRadius), MarkLocation);
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte i)
{
	// End:0x2F
	if(((int(ClientState) == int(3)) || int(ClientState) == int(1)) || IsFiring())
	{
		return;
	}
	bRedirectSwitchToFiremode = true;
	PendingMode = CurrentWeaponMode;
	//return;	
}

simulated exec function WeaponModeRelease()
{
	bRedirectSwitchToFiremode = false;
	ServerSwitchWeaponMode(PendingMode);
	CurrentWeaponMode = PendingMode;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x0B
	if(IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x35
	if(bRedirectSwitchToFiremode)
	{
		PendingMode--;
		// End:0x33
		if(int(PendingMode) >= StrikeInfo.Length)
		{
			PendingMode = byte(StrikeInfo.Length - 1);
		}
		return none;
	}
	return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x2C
	if(bRedirectSwitchToFiremode)
	{
		PendingMode++;
		// End:0x2A
		if(int(PendingMode) >= StrikeInfo.Length)
		{
			PendingMode = 0;
		}
		return none;
	}
	return super.NextWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x25
	if(Instigator.IsLocallyControlled())
	{
		bRedirectSwitchToFiremode = false;
		PendingMode = CurrentWeaponMode;
	}
	return super.PutDown();
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x2C
	if(float(LastRangeFound) < StrikeInfo[int(CurrentWeaponMode)].MinRange)
	{
		ScopeViewTex = Texture'BWBP_OP_Tex.Designator.DesignatorScreenNo';		
	}
	else
	{
		ScopeViewTex = default.ScopeViewTex;
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function WeaponTick(float dt)
{
	local Vector Start, HitLoc, HitNorm;
	local Actor t;

	super.WeaponTick(dt);
	// End:0xD7
	if(bScopeView && Level.TimeSeconds > NextRangeFindTime)
	{
		Start = Instigator.Location + Instigator.EyePosition();
		t = Trace(HitLoc, HitNorm, Start + (Vector(Instigator.GetViewRotation()) * float(30000)), Start, true);
		// End:0xA6
		if(t == none)
		{
			LastRangeFound = 30001;			
		}
		else
		{
			LastRangeFound = int(VSize(HitLoc - Start));
		}
		NextRangeFindTime = Level.TimeSeconds + 0.5000000;
	}
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2;
	local string Temp;
	local int i;
	local byte StartMode;

	super(Weapon).NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipY / float(900);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x1A5
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		// End:0xD9
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x2CA
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		// End:0x1FE
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x75E
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		// End:0x565
		if(!bRedirectSwitchToFiremode)
		{
			C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
			C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
			C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
			C.Font = GetFontSizeIndex(C, -5 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.TextSize(((StrikeInfo[int(CurrentWeaponMode)].ModeDescription @ "Min range:") @ string(int(StrikeInfo[int(CurrentWeaponMode)].MinRange / 52.5000000))) $ "m.", XL, YL);
			C.CurY += (YL / float(2));
			C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.DrawText(((StrikeInfo[int(CurrentWeaponMode)].ModeDescription @ "Min range:") @ string(int(StrikeInfo[int(CurrentWeaponMode)].MinRange / 52.5000000))) $ "m.");			
		}
		else
		{
			StartMode = byte(int(PendingMode) - 2);
			// End:0x5AC
			if(int(StartMode) >= StrikeInfo.Length)
			{
				StartMode = byte(int(byte(StrikeInfo.Length - 1)) - (255 - int(StartMode)));
			}
			i = -2;
			J0x5B7:

			// End:0x75E [Loop If]
			if(i < 3)
			{
				// End:0x5FF
				if(i != 0)
				{
					C.SetDrawColor(byte(255), 128, 128, byte(float(255) - (float(75) * Abs(float(i)))));					
				}
				else
				{
					C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
				}
				C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
				C.TextSize(WeaponModes[int(StartMode)].ModeName, XL, YL2);
				C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
				C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - (YL2 * float(-i + 1))) - YL;
				C.DrawText(WeaponModes[int(StartMode)].ModeName, false);
				StartMode++;
				// End:0x754
				if(int(StartMode) >= StrikeInfo.Length)
				{
					StartMode = 0;
				}
				i++;
				// [Loop Continue]
				goto J0x5B7;
			}
		}
	}
	//return;	
}

function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

function ReallyConsumeAmmo(int Mode, float load)
{
	ConsumeAmmo(Mode, load);
	//return;	
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x90
	if(((B.Enemy == none) || Instigator.Location.Z < B.Enemy.Location.Z) || !B.EnemyVisible())
	{
		return 0.0000000;
	}
	// End:0xB8
	if(TerrainInfo(B.Enemy.Base) == none)
	{
		return 0.0000000;
	}
	return 0.1000000;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 2.0000000;
	//return;	
}

function float RangedAttackTime()
{
	return 6.0000000;
	//return;	
}

function bool RecommendRangedAttack()
{
	return true;
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return true;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x41
	if((Ammo[0].AmmoAmount == 1) || Level.TimeSeconds > FireMode[1].NextTimerPop)
	{
		return 0.0000000;
	}
	return (60.0000000 - (FireMode[1].NextTimerPop - Level.TimeSeconds)) / 60.0000000;
	//return;	
}

defaultproperties
{
	StrikeInfo[0]=(BombClass=Class'BWBPAirstrikesPro.CarpetBomberBomb',Cooldown=60,BomberSpeed=5500.0000000,BombRange=7500.0000000,BombInterval=0.1500000,MinZDist=4096.0000000,MinRange=4096.0000000,BombOffset=(X=0.0000000,Y=250.0000000,Z=0.0000000),Compensation=0.0000000,bRemoteFired=false,Dropper=none,ModeDescription="Drops bombs with good blast radius in a line with midpoint on targeted location.")
	StrikeInfo[1]=(BombClass=Class'BWBPAirstrikesPro.CBU100BaseShell',Cooldown=45,BomberSpeed=9000.0000000,BombRange=0.0000000,BombInterval=0.0000000,MinZDist=4096.0000000,MinRange=2048.0000000,BombOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),Compensation=0.0000000,bRemoteFired=false,Dropper=none,ModeDescription="Drops a cluster bomb which breaks into a massive number of explosive bomblets.")
	StrikeInfo[2]=(BombClass=Class'BWBPAirstrikesPro.GBU57Projectile',Cooldown=45,BomberSpeed=9000.0000000,BombRange=0.0000000,BombInterval=0.0000000,MinZDist=1024.0000000,MinRange=1024.0000000,BombOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),Compensation=0.0000000,bRemoteFired=false,Dropper=none,ModeDescription="Drops an accurate bomb of medium power. Penetrates walls.")
	StrikeInfo[3]=(BombClass=Class'BWBPAirstrikesPro.JSOWBaseShell',Cooldown=45,BomberSpeed=5000.0000000,BombRange=3500.0000000,BombInterval=0.0250000,MinZDist=1024.0000000,MinRange=2048.0000000,BombOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),Compensation=0.0000000,bRemoteFired=false,Dropper=none,ModeDescription="Drops an incredible number of bombs in a line with midpoint at the indicated location.")
	StrikeInfo[4]=(BombClass=none,Cooldown=45,BomberSpeed=0.0000000,BombRange=0.0000000,BombInterval=0.0000000,MinZDist=2048.0000000,MinRange=8192.0000000,BombOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),Compensation=0.0000000,bRemoteFired=true,Dropper=Class'BWBPAirstrikesPro.MLRSDropper',ModeDescription="Remote rocket attack saturates the targeted area after a delay.")
	ParamsClasses[0]=Class'BWBPAirstrikesPro.TargetDesignatorWeaponParams'
	ParamsClasses[1]=Class'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Designator.BigIcon_Designator'
	bAllowWeaponInfoOverride=false
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Pullout',Volume=0.1280000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Putaway',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Carpet Bombing",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="CBU-100 Cluster Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="GBU-57 MOP",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="AGM-154 JSOW",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="MLRS Rocket Barrage",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	ScopeXScale=1.4000000
	ZoomInAnim="Raise"
	ZoomOutAnim="Lower"
	MaxZoom=4.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_OP_Tex.Designator.DesignatorScreen'
	bNoCrosshairInScope=true
	bNoMag=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=207,G=206,B=0,A=255),Color2=(R=0,G=255,B=0,A=133),StartSize1=96,StartSize2=37)
	bWT_Super=true
	ManualLines[0]="Projects a laser, which must be kept aimed at a given point on the map to call in the active airstrike."
	ManualLines[1]="Raises the scope. The color of the scope changes from green to red, depending on whether or not the player is sufficiently far away from the aim point to call in the current airstrike."
	ManualLines[2]="Switch modes by holding down the Fire Mode key and scrolling the mouse.||Effective at medium range. Extremely effective at long range, against cover, and against groups."
	bAimDisabled=true
	FireModeClass[0]=Class'BWBPAirstrikesPro.TargetDesignatorFire'
	FireModeClass[1]=Class'BWBPAirstrikesPro.TargetDesignatorScopeFire'
	SelectAnimRate=3.1000000
	PutDownAnimRate=2.8000000
	SelectSound=Sound'WeaponSounds.LinkGun.SwitchToLinkGun'
	SelectForce="SwitchToLinkGun"
	AIRating=1.0000000
	CurrentRating=1.0000000
	bShowChargingBar=true
	Description="The Target Designator is a unique weapon which can call in various types of airstrike on a position by using Target Painter mechanics. This weapon is of no use in environments where there is no access to the sky."
	EffectOffset=(X=100.0000000,Y=25.0000000,Z=-3.0000000)
	Priority=15
	HudColor=(R=255,G=200,B=0,A=255)
	SmallViewOffset=(X=22.0000000,Y=20.1500000,Z=-13.5000000)
	CenteredOffsetY=-7.0000000
	CenteredRoll=0
	CenteredYaw=-500
	CustomCrosshair=13
	CustomCrossHairColor=(R=255,G=255,B=128,A=255)
	CustomCrossHairScale=2.0000000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Circle2"
	InventoryGroup=0
	PickupClass=Class'BWBPAirstrikesPro.TargetDesignatorPickup'
	PlayerViewOffset=(X=27.0000000,Y=20.1500000,Z=-13.5000000)
	BobDamping=1.5750000
	AttachmentClass=Class'BWBPAirstrikesPro.TargetDesignatorAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.Designator.SmallIcon_Designator'
	IconCoords=(X1=0,Y1=0,X2=128,Y2=32)
	ItemName="MAU-52 Target Designator"
	Mesh=SkeletalMesh'BWBP_OP_Anim.Designator_FPm'
	DrawScale=0.6000000
	AmbientGlow=64
}
