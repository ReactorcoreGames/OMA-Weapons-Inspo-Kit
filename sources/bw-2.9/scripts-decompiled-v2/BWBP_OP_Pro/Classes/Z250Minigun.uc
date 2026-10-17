class Z250Minigun extends BallisticWeapon
	config(BallisticProV55);

var(Z250) name GrenadeLoadAnim;
var(Z250) Sound GrenOpenSound;
var(Z250) Sound GrenLoadSound;
var(Z250) Sound GrenCloseSound;
var(Z250) float DesiredSpeed;
var(Z250) float BarrelSpeed;
var(Z250) int BarrelTurn;
var(Z250) Sound BarrelSpinSound;
var(Z250) Sound BarrelStopSound;
var(Z250) Sound BarrelStartSound;
var(Z250) bool bDampingFireLoop;
var(Z250) Z250FireControl FireControl;
var(Z250) float RotationSpeeds[5];
var(Z250) int NumpadYOffset1;
var(Z250) int NumpadYOffset2;
var(Z250) ScriptedTexture WeaponScreen;
var(Z250) int ScreenIndex;
var(Z250) Material screen;
var(Z250) Material ScreenBase;
var(Z250) Material Numbers;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart;
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
	Skins[ScreenIndex] = screen;
	UpdateScreen();
	// End:0x5B
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBase, MyFontColor);
	Tex.DrawTile(65.0000000, 32.0000000, 70.0000000, 70.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(125.0000000, 32.0000000, 70.0000000, 70.0000000, 40.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	NumpadYOffset1 = 5 + ((MagAmmo / 10) * 49);
	NumpadYOffset2 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));
	// End:0x5A
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(C);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x4A
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x46
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x46
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	super.BringUp(PrevWeapon);
	//return;	
}

final simulated function BlendFireHold()
{
	bDampingFireLoop = true;
	switch(SightingState)
	{
		// End:0x23
		case 0:
			AnimBlendParams(1, 0.0000000);
			// End:0x7E
			break;
		// End:0x4A
		case 2:
			AnimBlendToAlpha(1, 0.6000000, (1.0000000 - SightingPhase) * SightingTime);
			// End:0x7E
			break;
		// End:0x6A
		case 1:
			AnimBlendToAlpha(1, 0.0000000, SightingPhase * SightingTime);
			// End:0x7E
			break;
		// End:0x7B
		case 3:
			AnimBlendParams(1, 0.6000000);
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function PlayScopeDown(optional bool bNoAnim)
{
	// End:0x2B
	if(!bNoAnim && HasAnim(ZoomOutAnim))
	{
		SafePlayAnim(ZoomOutAnim, 1.0000000);		
	}
	else
	{
		// End:0x76
		if((int(SightingState) == int(3)) || int(SightingState) == int(2))
		{
			SightingState = 1;
			// End:0x76
			if(bDampingFireLoop)
			{
				AnimBlendToAlpha(1, 0.0000000, SightingPhase * SightingTime);
			}
		}
	}
	Instigator.Controller.bRun = 0;
	//return;	
}

simulated function PlayScopeUp()
{
	SightingState = 2;
	// End:0x29
	if(bDampingFireLoop)
	{
		AnimBlendToAlpha(1, 0.7500000, SightingPhase * SightingTime);
	}
	// End:0x58
	if(int(ZoomType) == int(0))
	{
		PlayerController(Instigator.Controller).bZooming = true;
	}
	Instigator.Controller.bRun = 1;
	//return;	
}

simulated function TickSighting(float dt)
{
	// End:0x24
	if((int(SightingState) == int(0)) || int(SightingState) == int(3))
	{
		return;
	}
	// End:0xDA
	if(int(SightingState) == int(2))
	{
		// End:0xBE
		if(SightingPhase < 1.0000000)
		{
			// End:0x78
			if((bScopeDesired || bPendingSightUp) && CanUseSights())
			{
				SightingPhase += (dt / SightingTime);				
			}
			else
			{
				SightingState = 1;
				// End:0xA1
				if(bDampingFireLoop)
				{
					AnimBlendToAlpha(1, 0.0000000, SightingPhase * SightingTime);
				}
				Instigator.Controller.bRun = 0;
			}			
		}
		else
		{
			SightingPhase = 1.0000000;
			SightingState = 3;
			ScopeUpAnimEnd();
		}		
	}
	else
	{
		// End:0x17C
		if(int(SightingState) == int(1))
		{
			// End:0x156
			if(SightingPhase > 0.0000000)
			{
				// End:0x140
				if(bScopeDesired && CanUseSights())
				{
					SightingState = 2;
					// End:0x13D
					if(bDampingFireLoop)
					{
						AnimBlendToAlpha(1, 0.6000000, (1.0000000 - SightingPhase) * SightingTime);
					}					
				}
				else
				{
					SightingPhase -= (dt / SightingTime);
				}				
			}
			else
			{
				SightingPhase = 0.0000000;
				SightingState = 0;
				ScopeDownAnimEnd();
				DisplayFOV = float(BaseDisplayFOV);
			}
		}
	}
	//return;	
}

simulated function Notify_GrenadeOut()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_GrenadeIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_GrenadeShut()
{
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	Z250SecondaryFire(FireMode[1]).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return Z250SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == GrenadeLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function PlayIdle()
{
	// End:0x55
	if(int(MeleeState) == int(1))
	{
		MeleeState = 2;
		MeleeFireMode.PlayPreFire();
		// End:0x4D
		if((SprintControl != none) && SprintControl.bSprinting)
		{
			PlayerSprint(false);
		}
		ServerMeleeHold();
		return;
	}
	// End:0x8F
	if(IsFiring())
	{
		// End:0x8D
		if(MagAmmo == 0)
		{
			FireMode[0].StopFiring();
			FireMode[0].bIsFiring = false;
		}
		return;
	}
	// End:0xC0
	if(int(SightingState) != int(0))
	{
		// End:0xBD
		if(SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}		
	}
	else
	{
		// End:0xF7
		if(bScopeView)
		{
			// End:0xF4
			if(HasAnim(ZoomOutAnim) && SafePlayAnim(ZoomOutAnim, 1.0000000))
			{
				FreezeAnimAt(0.0000000);
			}			
		}
		else
		{
			SafeLoopAnim(IdleAnim, IdleAnimRate, IdleTweenTime,, "IDLE");
		}
	}
	//return;	
}

simulated function float GetRampUpSpeed()
{
	local float mult;

	mult = 1.0000000 - (BarrelSpeed / RotationSpeeds[2]);
	return 0.0750000 + (((0.5000000 * mult) * mult) * (float(1) + (0.2500000 * float(int(bBerserk)))));
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || Z250SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x61
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x0B
	if(bPreventReload)
	{
		return;
	}
	// End:0x1D
	if(int(ReloadState) != int(0))
	{
		return;
	}
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == GrenadeLoadAnim)
	{
		return;
	}
	// End:0x99
	if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0x97
		if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
		{
			LoadGrenade();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x54
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x49
		if(int(i) == 1)
		{
			// End:0x46
			if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
			{
				LoadGrenade();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function bool IsReloadingGrenade()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == GrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	Z250PrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	Z250PrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

function InitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	// End:0x48
	if(!Instigator.IsLocallyControlled())
	{
		ClientInitWeaponFromTurret(Turret);
	}
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string S;

	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 128);
	S = (((((("Z250Minigun: TraceCount: " $ string(Z250PrimaryFire(FireMode[0]).TraceCount)) $ ", FireRate: ") $ string(1.0000000 / FireMode[0].FireRate)) $ "TurnVelocity: ") $ string(Z250PrimaryFire(FireMode[0]).TurnVelocity.Pitch)) $ ", ") $ string(Z250PrimaryFire(FireMode[0]).TurnVelocity.Yaw);
	Canvas.DrawText(S);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	PlayAnim(IdleAnim, IdleAnimRate, 0.0000000, 1);
	FreezeAnimAt(0.0000000, 1);
	Z250PrimaryFire(FireMode[0]).Minigun = self;
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Z250FireControl FC;

	super.PostNetBeginPlay();
	// End:0x52
	if((int(Role) == int(ROLE_Authority)) && FireControl == none)
	{
		// End:0x42
		foreach DynamicActors(Class'BWBP_OP_Pro.Z250FireControl', FC)
		{
			FireControl = FC;			
			return;			
		}		
		FireControl = Spawn(Class'BWBP_OP_Pro.Z250FireControl', none);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;

	bt.Roll = BarrelTurn;
	SetBoneRotation('BarrelArray', bt);
	DesiredSpeed = RotationSpeeds[int(CurrentWeaponMode)];
	super.WeaponTick(dt);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x26
	if(super.PutDown())
	{
		Instigator.AmbientSound = none;
		BarrelSpeed = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	super.Tick(dt);
	// End:0x95
	if(FireMode[0].IsFiring() && !bServerReloading)
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.3500000 * dt, (GetRampUpSpeed()) * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
		Instigator.AmbientSound = BarrelSpinSound;		
	}
	else
	{
		// End:0x190
		if(BarrelSpeed > float(0))
		{
			Instigator.AmbientSound = none;
			BarrelSpeed = FMax(BarrelSpeed - (1.0000000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x190
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 21845.3300000) < int(float(BarrelTurn) / 21845.3300000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 21845.3300000)) * 21845.3300000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 2.5000000,, 32.0000000, 1.0000000, true);
				Z250PrimaryFire(FireMode[0]).bSpinning = false;
			}
		}
	}
	// End:0x1BF
	if(BarrelSpeed > float(0))
	{
		Instigator.SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1E3
	if(ThirdPersonActor != none)
	{
		Z250Attachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x20
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	J0x20:

	// End:0x86 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0x7C
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x20;
	}
	// End:0xCD
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CommonSwitchWeaponMode(newmode);
		ClientSwitchWeaponMode(CurrentWeaponMode);
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	//return;	
}

simulated function string GetHUDAmmoText(int Mode)
{
	return string(Ammo[Mode].AmmoAmount);
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x2B
	if((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x70
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function float ChargeBar()
{
	return BarrelSpeed / DesiredSpeed;
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy != none)
	{
		return 0;
	}
	// End:0x82
	if((Instigator.bIsCrouched && B.Squad.IsDefending(B)) && FRand() > 0.6000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xB9
	if(dist < float(2048))
	{
		return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.2000000, dist, 0.0000000, 2048.0000000);
	}
	// End:0xF3
	if(dist > float(4096))
	{
		return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 4096.0000000, 2048.0000000);
	}
	return rating;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.1000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.1000000;
	//return;	
}

defaultproperties
{
	GrenadeLoadAnim="GLReload"
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	BarrelSpinSound=Sound'BWBP_OP_Sounds.Z250.Z250-Motor'
	BarrelStopSound=Sound'BWBP_OP_Sounds.Z250.Z250-SpinDown'
	BarrelStartSound=Sound'BWBP_OP_Sounds.Z250.Z250-SpinUp'
	RotationSpeeds[0]=0.2200000
	RotationSpeeds[1]=0.3300000
	RotationSpeeds[2]=0.4400000
	RotationSpeeds[3]=0.5000000
	RotationSpeeds[4]=0.6600000
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.FG50.FG50-ScriptLCD'
	ScreenIndex=4
	screen=Shader'BWBP_SKC_Tex.FG50.FG50-ScriptLCD-SD'
	ScreenBase=Texture'UCGeneric.SolidColours.Black'
	Numbers=Texture'BWBP_OP_Tex.Z250.Z250-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="480.0;60.0;2.0;100.0;0.5;0.5;0.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.Z250WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.Z250WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.Z250WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.Z250WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Z250.BigIcon_Z250'
	BigIconCoords=(X1=30,Y1=48,X2=470,Y2=220)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="800 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="900 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=0.5000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.Z250.Z250-MagOut',Volume=1.2120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.Z250.Z250-MagIn',Volume=1.2120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=165,B=62,A=114),Color2=(R=0,G=19,B=38,A=221),StartSize1=123,StartSize2=71)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Primary fire spins up the barrels, delivering a hail of explosive rounds which inflict damage to the target and any nearby enemies."
	ManualLines[1]="Secondary fire launches a fuel grenade, which spreads fuel on the ground. This fuel can be ignited using the primary fire or other fire-based weapons. Enemies hit by the grenade or who walk into the fuel spilled will be ignited and receive damage, in addition to the damage inflicted by the ground fires."
	ManualLines[2]="Effective against groups of players and at area denial."
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightingTime=0.5500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.6800000)
	MagAmmo=100
	FireModeClass[0]=Class'BWBP_OP_Pro.Z250PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.Z250SecondaryFire'
	SelectAnimRate=0.7500000
	PutDownTime=0.8000000
	BringUpTime=2.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Miniguns are devastating tools of destruction in the right hands, able to decimate swarms of Krao and keep the Skrith suppressed. However, not only is the recoil fearsome, but the weight also has become an issue to non-geneboosted soldiers. While a relatively minor complaint to some companies, it didn't stop Majestic Firearms 12 from producing a more lightweight and portable version of a minigun while still retaining a lot of stopping power against heavier units. Enter the Z250 Minigun, not as big as the XMV-850 but still just as deadly, chambered for a specialized .308 HEAP round, it might not fire as fast yet it can still rip apart anyone standing on the wrong end. It can also fire fuel grenades to coat the battlefield in a flammable substance, providing a great area of denial. The Z250 is currently being issued to ODST troops and specialized troops to combat the Krao swarms infecting the universe."
	Priority=47
	HudColor=(R=25,G=200,B=50,A=255)
	CustomCrossHairColor=(R=255,G=255,B=255,A=219)
	CustomCrossHairScale=1.0088030
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	GroupOffset=2
	PickupClass=Class'BWBP_OP_Pro.Z250Pickup'
	PlayerViewOffset=(X=12.0000000,Y=6.0000000,Z=-4.2500000)
	AttachmentClass=Class'BWBP_OP_Pro.Z250Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.Z250.Icon_Z250'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Z-250 Minigun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.Z250_FPm'
	DrawScale=0.3000000
	SoundRadius=128.0000000
}
