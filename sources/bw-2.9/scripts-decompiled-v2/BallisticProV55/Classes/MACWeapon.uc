class MACWeapon extends BallisticWeapon
	config(BallisticProV55);

struct BeaconInfo
{
	var MACBeacon Beacon;
	var MACBeaconTrail Trail;
	var MACExplodeSphere Sphere;
	var Rotator Aim;
	var Vector Start;
	var Vector Hit;
	var float StartTime;
	var float HitTime;
	var float Range;
};

var() Texture RulerTex;
var() Texture PointerTex;
var() Sound DeploySound;
var() Sound UndeploySound;
var() name Shells[3];
var bool bPendingShellLoad;
var array<BeaconInfo> Beacons;
var float NextBeaconTime;

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x5B
	if((Level.TimeSeconds >= NextBeaconTime) && MACPrimaryFire(FireMode[0]) != none)
	{
		NextBeaconTime = Level.TimeSeconds + float(1);
		MACPrimaryFire(FireMode[0]).LaunchBeacon();
	}
	//return;	
}

simulated function BeaconHit(MACBeacon Beacon, Vector HitLocation, MACExplodeSphere Sphere)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xD5 [Loop If]
	if(i < Beacons.Length)
	{
		// End:0xCB
		if(Beacons[i].Beacon == Beacon)
		{
			Beacons[i].Hit = HitLocation;
			Beacons[i].HitTime = Level.TimeSeconds;
			Beacons[i].Range = VSize(HitLocation - Beacons[i].Start);
			Beacons[i].Sphere = Sphere;
			// End:0xC9
			if(Sphere != none)
			{
				Sphere.bHidden = !bScopeView;
			}
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function AddBeacon(MACBeacon Beacon, Vector Start, Rotator Aim, MACBeaconTrail Trail)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x116 [Loop If]
	if(i < Beacons.Length)
	{
		// End:0x10C
		if(((Beacons[i].Beacon == none) && Beacons[i].Sphere == none) && Beacons[i].HitTime < (Level.TimeSeconds - float(8)))
		{
			Beacons[i].Beacon = Beacon;
			Beacons[i].Trail = Trail;
			Beacons[i].Aim = Aim;
			Beacons[i].Start = Start;
			Beacons[i].StartTime = Level.TimeSeconds;
			// End:0x10A
			if(Trail != none)
			{
				Trail.bHidden = !bScopeView;
			}
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Beacons.Length = i + 1;
	Beacons[i].Beacon = Beacon;
	Beacons[i].Trail = Trail;
	Beacons[i].Aim = Aim;
	Beacons[i].Start = Start;
	Beacons[i].StartTime = Level.TimeSeconds;
	// End:0x1BF
	if(Trail != none)
	{
		Trail.bHidden = !bScopeView;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local int i;

	super.WeaponTick(dt);
	i = 0;
	J0x12:

	// End:0x9E [Loop If]
	if(i < Beacons.Length)
	{
		// End:0x5B
		if(Beacons[i].Trail != none)
		{
			Beacons[i].Trail.bHidden = !bScopeView;
		}
		// End:0x94
		if(Beacons[i].Sphere != none)
		{
			Beacons[i].Sphere.bHidden = !bScopeView;
		}
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x1E
	if(MagAmmo < 1)
	{
		bPendingShellLoad = true;
	}
	//return;	
}

simulated function PlayReload()
{
	local int i;

	SetBoneScale(2, 1.0000000, Shells[2]);
	i = 0;
	J0x1C:

	// End:0xA6 [Loop If]
	if(i < 2)
	{
		// End:0x81
		if((bPendingShellLoad && MagAmmo <= i) || !bPendingShellLoad && (MagAmmo - 1) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i]);
			// [Explicit Continue]
			goto J0x9C;
		}
		SetBoneScale(i, 1.0000000, Shells[i]);
		J0x9C:

		i++;
		// [Loop Continue]
		goto J0x1C;
	}
	super.PlayReload();
	//return;	
}

simulated function PlayShovelLoop()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x91 [Loop If]
	if(i < 2)
	{
		// End:0x6C
		if((bPendingShellLoad && MagAmmo <= i) || !bPendingShellLoad && (MagAmmo - 1) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i]);
			// [Explicit Continue]
			goto J0x87;
		}
		SetBoneScale(i, 1.0000000, Shells[i]);
		J0x87:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function PlayShovelEnd()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x91 [Loop If]
	if(i < 3)
	{
		// End:0x6C
		if((bPendingShellLoad && MagAmmo <= i) || !bPendingShellLoad && (MagAmmo - 1) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i]);
			// [Explicit Continue]
			goto J0x87;
		}
		SetBoneScale(i, 1.0000000, Shells[i]);
		J0x87:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	SafePlayAnim(EndShovelAnim, EndShovelAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	local int i;

	// End:0x63
	if(bPendingShellLoad && Anim == EndShovelAnim)
	{
		super.AnimEnded(Channel, Anim, frame, Rate);
		Notify_HAMRShellCycle();
		FireMode[0].NextFireTime = Level.TimeSeconds + 1.0000000;		
	}
	else
	{
		// End:0xDB
		if(Anim == 'Refire')
		{
			i = 0;
			J0x79:

			// End:0xBC [Loop If]
			if(i < 3)
			{
				// End:0xB2
				if((MagAmmo - 1) <= i)
				{
					SetBoneScale(i, 0.0000000, Shells[i]);
				}
				i++;
				// [Loop Continue]
				goto J0x79;
			}
			IdleTweenTime = 0.0000000;
			PlayIdle();
			IdleTweenTime = default.IdleTweenTime;			
		}
		else
		{
			super.AnimEnded(Channel, Anim, frame, Rate);
		}
	}
	//return;	
}

simulated function Notify_HAMRShellCycle()
{
	// End:0x2B
	if(MagAmmo > 0)
	{
		SafePlayAnim('Refire', 1.0000000, 0.1000000);
		bPendingShellLoad = false;		
	}
	else
	{
		bPendingShellLoad = true;
	}
	//return;	
}

function PlayFiring()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x77 [Loop If]
	if(i < 3)
	{
		// End:0x52
		if((MagAmmo - bFireMode[0].ConsumedLoad) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i]);
			// [Explicit Continue]
			goto J0x6D;
		}
		SetBoneScale(i, 1.0000000, Shells[i]);
		J0x6D:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
	local float Forward;

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x59
	if((int(Role) < int(ROLE_Authority)) || Instigator.HeadVolume.bWaterVolume)
	{
		PlayIdle();
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75.0000000;
	J0x89:

	// End:0x20E [Loop If]
	if(Forward >= float(45))
	{
		End = Start + (Vector(Instigator.Rotation) * Forward);
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x112
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			PlayIdle();
			return;
		}
		// End:0x128
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1EA
		if(((((t != none) && HitLoc.Z <= ((Start.Z - float(Class'BCoreProV55.BallisticTurret'.default.MinTurretEyeDepth)) - float(4))) && t.bWorldGeometry) && HitNorm.Z >= 0.7000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x20E;
		}
		// End:0x200
		if(Forward <= float(45))
		{
			PlayIdle();
			return;
		}
		Forward -= float(15);
		// [Loop Continue]
		goto J0x89;
	}
	J0x20E:

	HitLoc.Z += (Class'BallisticProV55.MACTurret'.default.CollisionHeight - float(9));
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BallisticProV55.MACTurret', none,, HitLoc, CompressedEq);
	// End:0x318
	if(Turret != none)
	{
		Turret.InitDeployedTurretFor(self);
		PlaySound(DeploySound, 3, 0.7000000,, 64.0000000, 1.0000000, true);
		Turret.TryToDrive(Instigator);
		Destroy();		
	}
	else
	{
		Log("Notify_Deploy: Could not spawn turret for HAMR Cannon", 'Warning');
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0x1F
	if(bScopeView)
	{
		DrawHAMRScope(C);
	}
	//return;	
}

simulated event DrawHAMRScope(Canvas C)
{
	local float Ys, RefPoint, ScaleFactor, VP, XL, YL;

	local string S;
	local int i;
	local Vector V;

	ScaleFactor = float(C.SizeX) / 1024.0000000;
	VP = float(Instigator.GetViewRotation().Pitch);
	// End:0x58
	if(VP > float(32768))
	{
		VP -= float(65546);
	}
	RefPoint = 1280.0000000 - (VP * 0.0625000);
	Ys = (float(C.SizeY) / float(C.SizeX)) * float(512);
	C.SetPos(C.OrgX, C.OrgY);
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.DrawTile(RulerTex, float(C.SizeX), float(C.SizeY), 0.0000000, RefPoint - Ys, 1024.0000000, Ys * float(2));
	C.SetPos(C.OrgX, (C.OrgY + float(C.SizeY / 2)) - (ScaleFactor * float(24)));
	C.SetDrawColor(byte(255), byte(255), 0, byte(255));
	C.DrawTile(PointerTex, 51.0000000 * ScaleFactor, 48.0000000 * ScaleFactor, 0.0000000, 0.0000000, 34.0000000, 32.0000000);
	C.SetPos(C.ClipX - (ScaleFactor * float(51)), (C.OrgY + float(C.SizeY / 2)) - (ScaleFactor * float(24)));
	C.DrawTile(PointerTex, 51.0000000 * ScaleFactor, 48.0000000 * ScaleFactor, 30.0000000, 0.0000000, 34.0000000, 32.0000000);
	C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	VP *= 0.0054932;
	C.TextSize(string(VP), XL, YL);
	C.SetPos(C.OrgX + (ScaleFactor * float(4)), ((C.OrgY + float(C.SizeY / 2)) - YL) - (ScaleFactor * float(20)));
	C.DrawText(string(VP));
	C.Font = GetFontSizeIndex(C, -4 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.SetDrawColor(byte(255), 192, 0, byte(255));
	i = 0;
	J0x3A8:

	// End:0x5CE [Loop If]
	if(i < Beacons.Length)
	{
		// End:0x5C4
		if(Beacons[i].Sphere != none)
		{
			V = C.WorldToScreen(Beacons[i].Hit);
			S = string(Beacons[i].Range / 44.0000000) $ "m";
			C.TextSize(S, XL, YL);
			C.SetPos(V.X - (XL / float(2)), V.Y - YL);
			C.DrawText(S);
			S = string(Beacons[i].HitTime - Beacons[i].StartTime) $ "s";
			C.TextSize(S, XL, YL);
			C.SetPos(V.X - (XL / float(2)), V.Y);
			C.DrawText(S);
			VP = float(Beacons[i].Aim.Pitch);
			// End:0x541
			if(VP > float(32768))
			{
				VP -= float(65546);
			}
			VP *= 0.0054932;
			S = string(VP) $ "ï¿½";
			C.TextSize(S, XL, YL);
			C.SetPos(V.X - (XL / float(2)), V.Y + YL);
			C.DrawText(S);
		}
		i++;
		// [Loop Continue]
		goto J0x3A8;
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7B [Loop If]
	if(i < Beacons.Length)
	{
		// End:0x44
		if(Beacons[i].Trail != none)
		{
			Beacons[i].Trail.Destroy();
		}
		// End:0x71
		if(Beacons[i].Sphere != none)
		{
			Beacons[i].Sphere.Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super.Destroyed();
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

function AttachToPawn(Pawn P)
{
	local name BoneName;

	Instigator = P;
	// End:0x41
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);		
	}
	else
	{
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	BoneName = 'rshoulder';
	// End:0xAB
	if(BoneName == 'None')
	{
		ThirdPersonActor.SetLocation(P.Location);
		ThirdPersonActor.SetBase(P);		
	}
	else
	{
		P.AttachToBone(ThirdPersonActor, BoneName);
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
	// End:0x96
	if(dist < float(2048))
	{
		return 0.4000000;
	}
	return rating;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

defaultproperties
{
	RulerTex=Texture'BW_Core_WeaponTex.Artillery.Lines'
	PointerTex=Texture'BW_Core_WeaponTex.Artillery.Pointer'
	DeploySound=Sound'BW_Core_WeaponSound.Artillery.Art-Deploy'
	UndeploySound=Sound'BW_Core_WeaponSound.Artillery.Art-Undeploy'
	Shells[0]="Shell1"
	Shells[1]="Shell2"
	Shells[2]="Shell3"
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;40.0;1.0;90.0;0.8;0.0;1.2")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BallisticProV55.MACWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MACWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MACWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MACWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Artillery.BigIcon_Artillery'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3330000
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	SightDisplayFOV=70.0000000
	MinZoom=2.0000000
	MaxZoom=16.0000000
	ZoomStages=3
	FullZoomFOV=10.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.Artillery.Artillery-ScopeView'
	bNoCrosshairInScope=true
	bNonCocking=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="ReloadStart"
	EndShovelAnim="ReloadEnd"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc5',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=185),Color2=(R=255,G=255,B=0,A=198),StartSize1=95,StartSize2=46)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Launches an artillery shell with massive damage output. These shells move extremely quickly and gain damage and blast radius over range. Recoil is extreme. This weapon damages the user if fired from an unstable position (i.e. in the air)."
	ManualLines[1]="Deploys the HAMR. Unlike machineguns, it cannot be deployed upon sandbags, only upon the ground or a wall. While deployed, recoil is reduced, fire rate improves and the user takes less damage from any frontal locational-hit attack."
	ManualLines[2]="While viewing through the HAMR's optical system, the Weapon Function key will cause the targeting system to simulate the trajectory, travel time and impact radius of a shell fired from the HAMR at the current aim rotation. This can be used to finely target a shot at long range.||The HAMR is heavy and will badly restrict the player's movement while it is active.||Effective at medium to long range. Extremely effective against groups and with height advantage."
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	SightOffset=(X=-5.0000000,Y=-15.0000000,Z=0.0000000)
	GunLength=96.0000000
	FireModeClass[0]=Class'BallisticProV55.MACPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.MACSecondaryFire'
	SelectAnimRate=0.6000000
	PutDownAnimRate=0.8000000
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="This heavy construct was designed for infantry use, to combat vehicles and large Cryon troops. After several failed designs and attempts, resulting in weapons which were far too heavy and cumbersome for infantry use, the HAMR was built. This new weapon could be carried by infantry, and could be deployed with the sturdy legs mounted underneath the weapon. The weapon can still be fired when mounted on the soldier's shoulder, but it generates extreme recoil, and leaves the users aim in complete disarray. The optical system mounted on the weapon, allows the user to viem from a remote screen attached to the soldiers helmet. Besides a zooming scope, the optical system also features an angle indicator and range finder, allowing the user to pitch the weapon as necessary depending on an inputed distance."
	Priority=44
	HudColor=(R=225,G=200,B=0,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	GroupOffset=1
	PickupClass=Class'BallisticProV55.MACPickup'
	PlayerViewOffset=(X=-2.0000000,Y=12.0000000,Z=5.0000000)
	AttachmentClass=Class'BallisticProV55.MACAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Artillery.SmallIcon_Artillery'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Heavy Anti-Materiel Rifle"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HAMR_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.Artillery.Artillery_Main'
	Skins[2]=Texture'BW_Core_WeaponTex.Artillery.Artillery_Glass'
}
