class X82Rifle extends BallisticWeapon
	config(BallisticProV55);

var bool bMeatVision;
var Pawn Target;
var float targettime;
var float LastSendTargetTime;
var Vector TargetLocation;
var() bool bIsIrons;
var() FullSound NVOnSound;
var() FullSound NVOffSound;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetOwner)
		Target, bMeatVision;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsIrons = false;
	// End:0x72
	if(InStr(WeaponParams.LayoutTags, "irons") != -1)
	{
		bIsIrons = true;
		SetBoneRotation('RearSight', rot(0, 16384, 0));
		SetBoneRotation('FrontSight', rot(0, 16384, -32768));
	}
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

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
	local int Forward;

	// End:0x1D
	if(Instigator.HeadVolume.bWaterVolume)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75;
	J0x4A:

	// End:0x1EC [Loop If]
	if(Forward >= 45)
	{
		End = Start + (Vector(Instigator.Rotation) * float(Forward));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0xCD
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			return;
		}
		// End:0xE3
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1D2
		if(((((t != none) && HitLoc.Z <= ((Start.Z - float(Class'BCoreProV55.BallisticTurret'.default.MinTurretEyeDepth)) - float(4))) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x1EC;
		}
		// End:0x1E0
		if(Forward <= 45)
		{
			return;
		}
		Forward -= 15;
		// [Loop Continue]
		goto J0x4A;
	}
	J0x1EC:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x268
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_SKC_Pro.X82Turret'.default.CollisionHeight + (t.CollisionHeight * 0.7500000));		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_SKC_Pro.X82Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_SKC_Pro.X82Turret', none,, HitLoc, CompressedEq);
	// End:0x380
	if(Turret != none)
	{
		// End:0x356
		if(Sandbag(t) != none)
		{
			Sandbag(t).AttachedWeapon = Turret;
		}
		Turret.InitDeployedTurretFor(self);
		Turret.TryToDrive(Instigator);
		Destroy();		
	}
	else
	{
		Log("Notify_Deploy: Could not spawn turret for X82 Rifle");
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x170
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x18C
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x19F
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x1A6:

	// End:0x20B [Loop If]
	if(M < 2)
	{
		// End:0x201
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x22A
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Instigator = Instigator;
	}
	// End:0x263
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x290
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x2EB
	if(!bJustSpawned)
	{
		M = 0;
		J0x2C5:

		// End:0x2E8 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2C5;
		}
		Destroy();
	}
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

function ServerWeaponSpecial(optional byte i)
{
	bMeatVision = !bMeatVision;
	// End:0x30
	if(bMeatVision)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local float bestAim, BestDist;
	local Vector Start;
	local Pawn targ;

	super.WeaponTick(dt);
	// End:0x32
	if(bScopeView)
	{
		bFireMode[0].BrassOffset = vect(0.0000000, -40.0000000, 0.0000000);
	}
	// End:0x51
	if(!bScopeView || int(Role) < int(ROLE_Authority))
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	targ = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x151
	if(targ != none)
	{
		// End:0xF4
		if(targ != Target)
		{
			Target = targ;
			targettime = 0.0000000;			
		}
		else
		{
			// End:0x12E
			if(Vehicle(targ) != none)
			{
				targettime += (((1.2000000 * dt) * (bestAim - 0.9500000)) * float(20));				
			}
			else
			{
				targettime += ((dt * (bestAim - 0.9500000)) * float(20));
			}
		}		
	}
	else
	{
		targettime = FMax(0.0000000, targettime - (dt * 0.5000000));
	}
	// End:0x19A
	if(!bScopeView)
	{
		bFireMode[0].BrassOffset = vect(0.0000000, 0.0000000, 0.0000000);
	}
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x14
	if(bMeatVision)
	{
		DrawMeatVisionMode(C);
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x43
	if(!bScopeView)
	{
		// End:0x38
		if(Target != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
			Target = none;
		}
		targettime = 0.0000000;
	}
	//return;	
}

simulated event DrawMeatVisionMode(Canvas C)
{
	local Vector V, v2, V3, X, Y, Z;

	local float ScaleFactor;

	C.Style = 5;
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(TexOscillator'BWBP_SKC_Tex.X82.X82MeatOsc', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.M75.M75LinesFinal', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	// End:0x124
	if((Target == none) || !FastTrace(Instigator.Location, Target.Location))
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	V = C.WorldToScreen((Target.Location - (Y * Target.CollisionRadius)) + (Z * Target.CollisionHeight));
	V.X -= (float(32) * ScaleFactor);
	V.Y -= (float(32) * ScaleFactor);
	C.SetPos(V.X, V.Y);
	v2 = C.WorldToScreen((Target.Location + (Y * Target.CollisionRadius)) - (Z * Target.CollisionHeight));
	C.SetDrawColor(160, 185, 200, byte(255));
	C.DrawTileStretched(Texture'BWBP_SKC_Tex.X82.X82TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
	V3 = C.WorldToScreen(Target.Location - (Z * Target.CollisionHeight));
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	NVOnSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	NVOffSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;35.0;1.0;80.0;10.0;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.X82WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.X82WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.X82WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.X82WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.X82.BigIcon_X82'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOn',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOff',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=32.0000000
	ZoomStages=3
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.X82.X82ScopeView'
	bNoCrosshairInScope=true
	CockAnimPostReload="Cock"
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X83-Charge',Volume=2.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X83-Charge',Volume=2.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadEmptyAnim="ReloadEmptyClosed"
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X83-Out',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X83-In',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.8500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=255,A=60),Color2=(R=255,G=0,B=0,A=255),StartSize1=22,StartSize2=8)
	bWT_Bullet=true
	ManualLines[0]="High-powered .50 rifle fire. High damage and fire rate, but strong recoil."
	ManualLines[1]="Deploys the rifle upon the ground or a nearby wall. May also be deployed upon sandbags. Whilst deployed, becomes perfectly accurate, loses its iron sights and gains a reduction in recoil. Locational damage (damage which can target an area on the body) taken from the front is significantly reduced."
	ManualLines[2]="Weapon Function activates infrared vision. Viable infantry targets will be bordered by a box in the weapon's scope.||Effective at long range. Very effective at long range when deployed."
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	CockingBringUpTime=1.8000000
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.X82PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.X82SecondaryFire'
	IdleAnimRate=0.0400000
	SelectAnimRate=0.5000000
	PutDownAnimRate=0.8000000
	PutDownTime=1.4000000
	BringUpTime=1.2000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="X83 Anti-Material Rifle||Manufacturer: Enravion Combat Solutions |Primary: Single Powerful Shot|Secondary: Activate Zooming Scope|Special: (Scoped) Activate Night Vision/Detector|Special: (Unscoped) Mount X-83 A1||Enravion's high powered X-83 A1 Anti-Material Rifle is a fearsome sight on the modern day battlefield. With an effective range of about 1.1 miles, the X-83 can target and eliminate infantry and light vehicles with ease and at range using its specialized .50 cal N6-BMG HEAP rounds. This special operations weapon, designed to disable key targets like parked aircraft and APCs, was used extensively prior to the Skrith wars."
	Priority=207
	HudColor=(R=175,G=175,B=175,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.X82Pickup'
	PlayerViewOffset=(X=4.0000000,Y=4.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.X82Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.X82.SmallIcon_X82'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="X83 Sniper Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.X83_FPm'
	DrawScale=0.3000000
}
