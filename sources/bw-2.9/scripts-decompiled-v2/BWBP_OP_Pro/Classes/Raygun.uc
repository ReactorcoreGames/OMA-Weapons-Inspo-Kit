class Raygun extends BallisticWeapon
	config(BallisticProV55);

var Actor GlowFX;
var bool bShieldOn;
var Sound ShieldOnSound;
var Sound ShieldOffSound;
var TexScaler TensTex;
var TexScaler UnitsTex;
var int LastMagAmmo;
var bool bLockSecondary;
var config bool bReceiveDebug;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLockSecondary, bShieldOn;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		DisableShield;
}

final simulated function BlendFireHold()
{
	switch(SightingState)
	{
		// End:0x1B
		case 0:
			AnimBlendParams(1, 0.0000000);
			// End:0x79
			break;
		// End:0x42
		case 2:
			AnimBlendToAlpha(1, 0.9500000, (1.0000000 - SightingPhase) * SightingTime);
			// End:0x79
			break;
		// End:0x62
		case 1:
			AnimBlendToAlpha(1, 0.0000000, SightingPhase * SightingTime);
			// End:0x79
			break;
		// End:0x76
		case 3:
			AnimBlendParams(1, 0.9500000);
			// End:0x79
			break;
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
		// End:0x85
		if((int(SightingState) == int(3)) || int(SightingState) == int(2))
		{
			SightingState = 1;
			// End:0x85
			if(FireMode[1].HoldTime > float(0))
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
	// End:0x1E
	if(HasAnim(ZoomInAnim))
	{
		SafePlayAnim(ZoomInAnim, 1.0000000);		
	}
	else
	{
		SightingState = 2;
		// End:0x56
		if(FireMode[1].HoldTime > float(0))
		{
			AnimBlendToAlpha(1, 0.9500000, SightingPhase * SightingTime);
		}
	}
	// End:0x85
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
	// End:0xE9
	if(int(SightingState) == int(2))
	{
		// End:0xCD
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
				// End:0xB0
				if(FireMode[1].HoldTime > float(0))
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
		// End:0x19A
		if(int(SightingState) == int(1))
		{
			// End:0x174
			if(SightingPhase > 0.0000000)
			{
				// End:0x15E
				if(bScopeDesired && CanUseSights())
				{
					SightingState = 2;
					// End:0x15B
					if(FireMode[1].HoldTime > float(0))
					{
						AnimBlendToAlpha(1, 0.7500000, (1.0000000 - SightingPhase) * SightingTime);
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp();
	// End:0x1E
	if(int(Role) == int(ROLE_Authority))
	{
		bLockSecondary = false;
	}
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
	// End:0x60
	if(IsFiring())
	{
		return;
	}
	// End:0x91
	if(int(SightingState) != int(0))
	{
		// End:0x8E
		if(SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}		
	}
	else
	{
		// End:0xC8
		if(bScopeView)
		{
			// End:0xC5
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

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x30
	if(((int(Role) == int(ROLE_Authority)) && Channel == 0) && bLockSecondary)
	{
		bLockSecondary = false;
	}
	// End:0xC3
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0xA3
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		// End:0xBB
		if(int(Role) == int(ROLE_Authority))
		{
			bLockSecondary = false;
		}
		bPreventReload = false;
	}
	// End:0x270
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x16D
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x1DC
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x1F4
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x270
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x290
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x2E7
	if(int(ReloadState) == int(6))
	{
		// End:0x2D7
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x35A
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x328
		if(bNeedCock && MagAmmo > 0)
		{
			CommonCockGun();			
		}
		else
		{
			bNeedCock = false;
			ReloadState = 0;
			ReloadFinished();
			PlayIdle();
			AimComponent.Reaim(0.0500000);
		}
		return;
	}
	// End:0x39A
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x3D0
	if(int(ReloadState) == int(9))
	{
		// End:0x3C2
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	PlayAnim(IdleAnim, IdleAnimRate, 0.0000000, 1);
	FreezeAnimAt(0.0000000, 1);
	TensTex = TexScaler(Skins[3]);
	UnitsTex = TexScaler(Skins[2]);
	//return;	
}

simulated function WeaponTick(float DeltaTime)
{
	super.WeaponTick(DeltaTime);
	// End:0x48
	if(((LastMagAmmo != MagAmmo) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled())
	{
		OffsetNumbers();
	}
	//return;	
}

simulated function OffsetNumbers()
{
	local int Tens, Units;

	// End:0x0D
	if(TensTex == none)
	{
		return;
	}
	Tens = MagAmmo / 10;
	Units = MagAmmo - (Tens * 10);
	// End:0x56
	if(bool(Tens & 1))
	{
		TensTex.UOffset = 64.0000000;		
	}
	else
	{
		TensTex.UOffset = 0.0000000;
	}
	TensTex.VOffset = float((Tens / 2) * 102);
	// End:0xAC
	if(bool(Units & 1))
	{
		UnitsTex.UOffset = 64.0000000;		
	}
	else
	{
		UnitsTex.UOffset = 0.0000000;
	}
	UnitsTex.VOffset = float((Units / 2) * 102);
	LastMagAmmo = MagAmmo;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x43
	if(FireMode[1].bIsFiring)
	{
		return FMin(1.0000000, FireMode[1].HoldTime / RaygunSecondaryFire(FireMode[1]).ChargeTime);
	}
	return FMin(1.0000000, RaygunSecondaryFire(FireMode[1]).DecayCharge / RaygunSecondaryFire(FireMode[1]).ChargeTime);
	//return;	
}

simulated event Timer()
{
	// End:0x24
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
	}
	super.Timer();
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
	}
	return CurrentRating;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x61
	if((HasMagAmmo(0)) || Ammo[0].AmmoAmount > 0)
	{
		// End:0x61
		if(RecommendHeal(B))
		{
			return 1.2000000;
		}
	}
	// End:0x7C
	if(B.Enemy == none)
	{
		return super.GetAIRating();
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(super.GetAIRating(), 0.5000000, dist, 1024.0000000, 2048.0000000);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x16
	if(bPreventReload || bServerReloading)
	{
		return;
	}
	ServerWeaponSpecial(i);
	ReloadState = 9;
	PlayAnim('SwitchPress');
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x16
	if(bPreventReload || bServerReloading)
	{
		return;
	}
	bServerReloading = true;
	ReloadState = 9;
	PlayAnim('SwitchPress');
	//return;	
}

function Notify_ButtonPress()
{
	// End:0x14C
	if(!bShieldOn)
	{
		bShieldOn = true;
		PlaySound(ShieldOnSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
		// End:0x149
		if(Instigator.PlayerReplicationInfo != none)
		{
			// End:0xFF
			if((Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
			{
				xPawn(Instigator).SetOverlayMaterial(Shader'BWBP_OP_Tex.General.BlueExplosiveShieldMat', 300.0000000, true);
				ThirdPersonActor.SetOverlayMaterial(Shader'BWBP_OP_Tex.General.BlueExplosiveShieldMat', 300.0000000, true);
				SetOverlayMaterial(Shader'BWBP_OP_Tex.General.BlueExplosiveShieldMat', 300.0000000, true);				
			}
			else
			{
				xPawn(Instigator).SetOverlayMaterial(Shader'BWBP_OP_Tex.General.RedExplosiveShieldMat', 300.0000000, true);
				ThirdPersonActor.SetOverlayMaterial(Shader'BWBP_OP_Tex.General.RedExplosiveShieldMat', 300.0000000, true);
				SetOverlayMaterial(Shader'BWBP_OP_Tex.General.RedExplosiveShieldMat', 300.0000000, true);
			}
		}		
	}
	else
	{
		bShieldOn = false;
		PlaySound(ShieldOffSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
		xPawn(Instigator).SetOverlayMaterial(none, 0.0000000, true);
		ThirdPersonActor.SetOverlayMaterial(none, 0.0000000, true);
		SetOverlayMaterial(none, 0.0000000, true);
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x11
	if(super.PutDown())
	{
		DisableShield();
		return true;
	}
	return false;
	//return;	
}

function DisableShield()
{
	bShieldOn = false;
	PlaySound(ShieldOffSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	SetOverlayMaterial(none, 0.0000000, true);
	xPawn(Instigator).SetOverlayMaterial(none, 0.0000000, true);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x39
	if(bShieldOn && !DamageType.default.bLocationalHit)
	{
		Damage *= 0.2500000;
		Momentum *= 0.2500000;
		return;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x80
	if(dist > float(3000))
	{
		return 1;
	}
	return 0;
	//return;	
}

function bool FocusOnLeader(bool bLeaderFiring)
{
	local Bot B;
	local Pawn LeaderPawn;
	local Actor Other;
	local Vector HitLocation, HitNormal, StartTrace;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x26
	if(B == none)
	{
		return false;
	}
	// End:0x71
	if(PlayerController(B.Squad.SquadLeader) != none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;		
	}
	else
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0x113
		if(V != none)
		{
			LeaderPawn = V;
			bLeaderFiring = ((float(LeaderPawn.Health) < LeaderPawn.HealthMax) && V.LinkHealMult > float(0)) && (B.Enemy == none) || V.bKeyVehicle;
		}
	}
	// End:0x151
	if(LeaderPawn == none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;
		// End:0x151
		if(LeaderPawn == none)
		{
			return false;
		}
	}
	// End:0x15E
	if(!bLeaderFiring)
	{
		return false;
	}
	// End:0x20C
	if(Vehicle(LeaderPawn) != none)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		// End:0x20C
		if(VSize(LeaderPawn.Location - StartTrace) < FireMode[0].MaxRange())
		{
			Other = Trace(HitLocation, HitNormal, LeaderPawn.Location, StartTrace, true);
			// End:0x20C
			if(Other == LeaderPawn)
			{
				B.Focus = Other;
				return true;
			}
		}
	}
	return false;
	//return;	
}

simulated function PassDelay(float Delay)
{
	FireMode[0].NextFireTime = Level.TimeSeconds + Delay;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.7000000;
	//return;	
}

defaultproperties
{
	ShieldOnSound=Sound'BWBP_OP_Sounds.Raygun.ShieldOn'
	ShieldOffSound=Sound'BWBP_OP_Sounds.Raygun.ShieldOff'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;80.0;0.0;0.4;0.1")
	ParamsClasses[0]=Class'BWBP_OP_Pro.RaygunWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.RaygunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.RaygunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.RaygunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Raygun.raygun_icon_512'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=220)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	bNoCrosshairInScope=true
	SightBobScale=0.2500000
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=86,B=255,A=255),Color2=(R=255,G=140,B=0,A=255),StartSize1=65,StartSize2=61)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Energy=true
	ManualLines[0]="Launches a stream of projectiles. These projectiles do not gain damage over range."
	ManualLines[1]="Charged ray attack. Targets hit by this attack will receive damage and become irradiated. Irradiation causes damage over time and can be spread through the enemy's team by proximity to the irradiated enemy. The duration of irradiation against a target is extended when hit by the primary fire."
	ManualLines[2]="The Raygun also possesses a shield, activated by the Weapon Function key. When active, this shield reduces damage from any source which is not locational, such as flames and explosions, by 75%, but makes the user highly visible. Effective at close range, against groups of clustered players and against explosives."
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	SightOffset=(X=-8.0000000,Y=0.0000000,Z=0.8000000)
	FireModeClass[0]=Class'BWBP_OP_Pro.RaygunPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.RaygunSecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="E38 Indivisible Particle Smasher||Manufacturer: United States Defense Department, 20th 'The truth is out there, I know it.  I've seen those skrith bastards up close back in '59 in Roswell, they're the ones who landed in Roswell in Area 51, with their creepy two headed dogs and all.  They tried to take over the base using their plasma peashooters, only it looked more like what you see in those B-movies.  Those bastards, they shot up the place, melting all the soldiers into piles of goo. I swear to you, I'm not making this up, they even activated some weird shield doohicky that made them immune to the bazookas and other explosives. You gotta believe me, please.  I can prove it to you, I just need you guys to take me to Area 51, where the original model is still being held at, sealed away in a vault!  Wait, why are you looking at me like that?  Why are you putting cuffs on me!?  HEY-'  The last known words of James Kilroy Sr.  Before he was sent to the FBI for interrogation."
	Priority=39
	HudColor=(R=255,G=175,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=1
	PickupClass=Class'BWBP_OP_Pro.RaygunPickup'
	PlayerViewOffset=(X=16.0000000,Y=1.6000000,Z=-3.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.RaygunAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.Raygun.raygun_icon_128'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="E58 Raygun"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.Raygun_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_OP_Tex.Raygun.raygun_body_SH1'
	Skins[2]=TexScaler'BWBP_OP_Tex.Raygun.RaygunNumbersScaler'
	Skins[3]=TexScaler'BWBP_OP_Tex.Raygun.RaygunNumbersScaler2'
	SoundPitch=56
	SoundRadius=32.0000000
}
