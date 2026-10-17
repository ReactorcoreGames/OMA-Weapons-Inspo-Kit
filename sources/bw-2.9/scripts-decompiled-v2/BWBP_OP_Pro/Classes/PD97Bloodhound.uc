class PD97Bloodhound extends BallisticHandgun
	config(BallisticProV55);

var(PD97) PD97TazerEffect TazerEffect;
var(PD97) array<PD97DartControl> StruckTargets;
var(PD97) bool bShotgunMode;
var(PD97) name TazerLoadAnim;
var(PD97) FullSound TazerLoadSound;
var(PD97) Rotator DrumRot;
var(PD97) byte DrumPos;
var(PD97) bool bNeedRotate;
var(PD97) name ShellBones[5];
var(PD97) name SpareShellBones[5];
var(PD97) Pawn LockedTarget;
var(PD97) bool bLockedOn;
var(PD97) Actor CurrentRocket;
var(PD97) array<Actor> ActiveRockets;
var(PD97) Sound LockedOnSound;
var(PD97) Sound LockedOffSound;
var(PD97) PD97TrackerBeacon ActiveBeacon;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentRocket, LockedTarget, 
		bLockedOn;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetRocketTarget;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		ClientAddProjectile, ClientRemoveProjectile;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bShotgunMode = false;
	// End:0x7B
	if(InStr(WeaponParams.LayoutTags, "shotgun") != -1)
	{
		bShotgunMode = true;
		// End:0x7B
		if(ThirdPersonActor != none)
		{
			PD97Attachment(ThirdPersonActor).bShotgunMode = true;
			PD97Attachment(ThirdPersonActor).InstantMode = 0;
		}
	}
	//return;	
}

simulated function Notify_TazerReload()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, TazerLoadSound);
	PD97SecondaryFire(FireMode[1]).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	//return;	
}

simulated function Notify_DrumRotate()
{
	//return;	
}

simulated function Notify_HideShell()
{
	SetBoneScale(10, 0.0000000, 'EjectingShell');
	//return;	
}

simulated function ShellFired()
{
	SetBoneScale(int(DrumPos), 0.0000000, ShellBones[int(DrumPos)]);
	bNeedRotate = true;
	//return;	
}

simulated function CycleDrum()
{
	// End:0x19
	if(int(DrumPos) == 4)
	{
		DrumPos = 0;		
	}
	else
	{
		DrumPos++;
	}
	DrumRot.Roll -= (65535 / 5);
	SetBoneRotation('drum', DrumRot);
	bNeedRotate = false;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x57
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		SelectAnim = 'PulloutOpen';
		PutDownAnim = 'PutawayOpen';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		SelectAnim = 'Pullout';
		PutDownAnim = 'putaway';
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x156
	if((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xBF
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			// End:0x9B
			if(IdleAnim == 'Idle')
			{
				IdleAnim = 'OpenIdle';
			}
			ReloadAnim = 'OpenReload';
			SelectAnim = 'PulloutOpen';
			PutDownAnim = 'PutawayOpen';			
		}
		else
		{
			// End:0x11B
			if((Anim == FireMode[0].FireAnim) || (Anim == FireMode[1].FireAnim) && !FireMode[1].IsFiring())
			{
				bPreventReload = false;
				CycleDrum();
			}
			// End:0x135
			if(IdleAnim == 'OpenIdle')
			{
				IdleAnim = 'Idle';
			}
			ReloadAnim = 'Reload';
			SelectAnim = 'Pullout';
			PutDownAnim = 'putaway';
		}
	}
	// End:0x178
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0x197
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x1E4
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0x254
	if((MeleeFireMode != none) && Anim == MeleeFireMode.FireAnim)
	{
		// End:0x224
		if(int(MeleeState) == int(4))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 0;
		}
		ReloadState = 0;
		// End:0x24C
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bPreventReload = false;
	}
	// End:0x2E2
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		AnimBlendParams(2, 0.0000000);
		// End:0x2D4
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		CycleDrum();
		bPreventReload = false;
	}
	// End:0x48F
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x38C
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x3FB
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x413
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x48F
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x49C
	if(Channel > 0)
	{
		return;
	}
	// End:0x4BC
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x535
	if(int(ReloadState) == int(6))
	{
		// End:0x525
		if(((MagAmmo - ((int(!bNeedCock) * int(!bNonCocking)) * int(bMagPlusOne))) >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x5A8
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x576
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
	// End:0x5E8
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x61E
	if(int(ReloadState) == int(9))
	{
		// End:0x610
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function Notify_DrumDown()
{
	local int i, j;

	j = int(DrumPos);
	i = 0;
	J0x14:

	// End:0xA8 [Loop If]
	if(i < default.MagAmmo)
	{
		// End:0x5B
		if(i < Ammo[0].AmmoAmount)
		{
			SetBoneScale(j, 1.0000000, ShellBones[j]);			
		}
		else
		{
			SetBoneScale(j + (default.MagAmmo * 2), 0.0000000, SpareShellBones[j]);
		}
		// End:0x97
		if(j == 4)
		{
			j = 0;
			// [Explicit Continue]
			goto J0x9E;
		}
		j++;
		J0x9E:

		i++;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function Notify_ClipIn()
{
	local int i;

	super(BallisticWeapon).Notify_ClipIn();
	i = 0;
	J0x0D:

	// End:0x4C [Loop If]
	if(i < default.MagAmmo)
	{
		SetBoneScale(i + (default.MagAmmo * 2), 1.0000000, SpareShellBones[i]);
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	SetBoneScale(10, 1.0000000, 'EjectingShell');
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	return OtherGun.Class == Class;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return true;
	}
	return super.CanAlternate(Mode);
	//return;	
}

function AddControl(PD97DartControl DC)
{
	StruckTargets[StruckTargets.Length] = DC;
	//return;	
}

function LostControl(PD97DartControl DC)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(i < StruckTargets.Length)
	{
		// End:0x3A
		if(StruckTargets[i] == DC)
		{
			StruckTargets.Remove(i, 1);
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function LoadTazer()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || PD97SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x5A
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(TazerLoadAnim, 1.0000000,, 0);
	}
	//return;	
}

simulated function bool IsReloadingTazer()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == TazerLoadAnim)
	{
		return true;
	}
	return false;
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
	if(seq == TazerLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingTazer())
		{
			LoadTazer();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingTazer())
			{
				LoadTazer();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0x94
	if(TazerEffect != none)
	{
		TazerEffect.bHidden = true;
		TazerEffect.SetLocation(ConvertFOVs(GetBoneCoords('Tazer').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		C.DrawActor(TazerEffect, false, false, Instigator.Controller.FovAngle);
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x78
	if(((TazerEffect != none) && !Instigator.IsFirstPerson()) && AIController(Instigator.Controller) == none)
	{
		TazerEffect.bHidden = false;
		TazerEffect.SetLocation(BallisticAttachment(ThirdPersonActor).GetModeTipLocation());
	}
	// End:0x9A
	if(LockedTarget != none)
	{
		ServerSetRocketTarget(LockedTarget.Location);		
	}
	else
	{
		// End:0xB6
		if((LockedTarget == none) && bLockedOn)
		{
			BreakLock();
		}
	}
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x0F
	if(bLockedOn)
	{
		BreakLock();
	}
	//return;	
}

function AddProjectile(Actor proj)
{
	ActiveRockets[ActiveRockets.Length] = proj;
	ClientAddProjectile(proj);
	//return;	
}

simulated function ClientAddProjectile(Actor proj)
{
	ActiveRockets[ActiveRockets.Length] = proj;
	//return;	
}

function LostChild(Actor proj)
{
	local int i;

	// End:0x6F
	if(PD97Rocket(proj) != none)
	{
		i = 0;
		J0x17:

		// End:0x48 [Loop If]
		if((i < ActiveRockets.Length) && ActiveRockets[i] != proj)
		{
			i++;
			// [Loop Continue]
			goto J0x17;
		}
		// End:0x6F
		if(i < ActiveRockets.Length)
		{
			ActiveRockets.Remove(i, 1);
			ClientRemoveProjectile(proj);
		}
	}
	//return;	
}

simulated function ClientRemoveProjectile(Actor proj)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if((i < ActiveRockets.Length) && ActiveRockets[i] != proj)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x54
	if(i < ActiveRockets.Length)
	{
		ActiveRockets.Remove(i, 1);
	}
	//return;	
}

simulated function GotTarget(Pawn A)
{
	LockedTarget = A;
	bLockedOn = true;
	PlaySound(LockedOnSound,, 0.7000000,, 16.0000000);
	//return;	
}

simulated function BreakLock()
{
	bLockedOn = false;
	PlaySound(LockedOffSound,, 0.7000000,, 16.0000000);
	// End:0x33
	if(ActiveBeacon != none)
	{
		ActiveBeacon.Destroy();
	}
	//return;	
}

simulated function Destroyed()
{
	BreakLock();
	super.Destroyed();
	//return;	
}

function ServerSetRocketTarget(Vector loc)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i < ActiveRockets.Length)
	{
		PD97Rocket(ActiveRockets[i]).SetRocketTarget(LockedTarget);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function Vector GetRocketTarget()
{
	// End:0x1D
	if(LockedTarget != none)
	{
		return LockedTarget.Location;		
	}
	else
	{
		return vect(0.0000000, 0.0000000, 0.0000000);
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
	//return;	
}

defaultproperties
{
	TazerLoadAnim="TazerReload"
	TazerLoadSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.5000000,bAtten=false,bNoOverride=false)
	ShellBones[0]="Shell1"
	ShellBones[1]="Shell2"
	ShellBones[2]="Shell3"
	ShellBones[3]="Shell4"
	ShellBones[4]="Shell5"
	SpareShellBones[0]="SpareShell1"
	SpareShellBones[1]="SpareShell2"
	SpareShellBones[2]="SpareShell3"
	SpareShellBones[3]="SpareShell4"
	SpareShellBones[4]="SpareShell5"
	LockedOnSound=Sound'MenuSounds.select3'
	LockedOffSound=Sound'2K4MenuSounds.Generic.msfxDown'
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;50.0;0.0;0.5;0.5")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.PD97WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.PD97WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.PD97WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.PD97WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Bloodhound.BigIcon_PD97'
	IdleTweenTime=0.0000000
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=12,G=186,B=255,A=255),Color2=(R=0,G=255,B=0,A=255),StartSize1=58,StartSize2=50)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Heal=true
	ManualLines[0]="Fires projectile darts. Upon striking an enemy, these darts release a cloud of pink gas which allows the path of the enemy to be tracked. The darts will also deal damage over time. Upon striking an ally, the darts heal over time instead of dealing damage."
	ManualLines[1]="Launches a tazer. The user must hold down Altfire or the tazer will be retracted. Upon striking an enemy, transmits a current dealing paltry DPS but slowing the enemy movement."
	ManualLines[2]="Primarily a support weapon, the Bloodhound is most effective when used as part of a team. Nevertheless, sufficient dart hits can cause high damage. The Bloodhound has very low recoil."
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	FireModeClass[0]=Class'BWBP_OP_Pro.PD97PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.PD97SecondaryFire'
	PutDownTime=0.6000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	bShowChargingBar=true
	Description="Originally a specialist law enforcement weapon, the PD-97 'Bloodhound' has been adapted into a military role, used to control opponents and track their movement upon the battlefield. While less immediately lethal than most other weapons, its tactical repertoire is not to be underestimated."
	Priority=24
	HudColor=(R=150,G=150,B=250,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=13
	PickupClass=Class'BWBP_OP_Pro.PD97Pickup'
	PlayerViewOffset=(X=7.5000000,Y=4.0000000,Z=-4.5000000)
	AttachmentClass=Class'BWBP_OP_Pro.PD97Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.Bloodhound.Icon_PD97'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="PD-97 'Bloodhound'"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.PD97_FPm'
	DrawScale=0.3000000
}
