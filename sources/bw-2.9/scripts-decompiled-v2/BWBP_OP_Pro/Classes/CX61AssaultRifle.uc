class CX61AssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var RX22ASpray Flame;
var CX61GasSpray GasSpray;
var float StoredGas;
var Color ModeColors[2];

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		StoredGas;
}

simulated exec function SwitchWeaponMode(optional byte newmode)
{
	// End:0x30
	if((FireMode[1].bIsFiring || Flame != none) || GasSpray != none)
	{
		return;
	}
	ServerSwitchWeaponMode(byte(255));
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x30
	if((FireMode[1].bIsFiring || Flame != none) || GasSpray != none)
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
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

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0xAE
	if(Flame != none)
	{
		Flame.SetLocation(ConvertFOVs(GetBoneCoords('tip2').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
		Flame.SetRotation(Rotator(Vector(GetAimPivot() + GetRecoilPivot()) >> (GetPlayerAim())));
		C.DrawActor(Flame, false, false, Instigator.Controller.FovAngle);		
	}
	else
	{
		// End:0x14E
		if(GasSpray != none)
		{
			GasSpray.SetLocation(ConvertFOVs(GetBoneCoords('tip2').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
			GasSpray.SetRotation(Rotator(Vector(GetAimPivot() + GetRecoilPivot()) >> (GetPlayerAim())));
			C.DrawActor(GasSpray, false, false, Instigator.Controller.FovAngle);
		}
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0xED
	if(((ThirdPersonActor != none) && !Instigator.IsFirstPerson()) && AIController(Instigator.Controller) == none)
	{
		// End:0x9A
		if(Flame != none)
		{
			Flame.SetLocation(CX61Attachment(ThirdPersonActor).GetAltTipLocation());
			Flame.SetRotation(Rotator(Vector(GetAimPivot() + GetRecoilPivot()) >> (GetPlayerAim())));
		}
		// End:0xED
		if(GasSpray != none)
		{
			GasSpray.SetLocation(CX61Attachment(ThirdPersonActor).GetAltTipLocation());
			GasSpray.SetRotation(Rotator(Vector(GetAimPivot() + GetRecoilPivot()) >> (GetPlayerAim())));
		}
	}
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;

	super(Weapon).NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
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
	// End:0x451
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.DrawColor = ModeColors[int(CurrentWeaponMode)];
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x5E7
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x543
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x56C
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0xA7
	if((StoredGas < default.StoredGas) && (FireMode[1] == none) || !FireMode[1].IsFiring())
	{
		// End:0x88
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
		{
			StoredGas = FMin(default.StoredGas, StoredGas + ((dt / float(10)) * (float(1) + (StoredGas / default.StoredGas))));			
		}
		else
		{
			StoredGas = FMin(default.StoredGas, StoredGas + (dt / float(20)));
		}
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x1C
	if(Flame != none)
	{
		Flame.bHidden = false;
	}
	// End:0x38
	if(GasSpray != none)
	{
		GasSpray.bHidden = false;
	}
	super.Destroyed();
	//return;	
}

simulated function float ChargeBar()
{
	return StoredGas;
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_OP_Pro.AP_CX61Mag';
	//return;	
}

simulated function PlayReload()
{
	// End:0x1C
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	super.PlayReload();
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.2000000;
	//return;	
}

defaultproperties
{
	StoredGas=1.0000000
	ModeColors[0]=(R=255,G=100,B=0,A=255)
	ModeColors[1]=(R=75,G=210,B=210,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.8;90.0;0.0;1.0;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.CX61WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.CX61WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.CX61WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.CX61WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.CX61.BigIcon_CX61'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.2080000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-MagOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-MagIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=255),StartSize1=70,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	bWT_Heal=true
	ManualLines[0]="Automatic fire. Lower damage output than other assault rifles, but more controllable."
	ManualLines[1]="Flamethrower mode launches a stream of fire, dealing minor damage to enemies and causing disorientation.|Healing Gas mode sprays G28 gas, granting health to allies."
	ManualLines[2]="It is recommended to check which mode of the CX is active before engaging the altfire. Burning allies or healing enemies is not conducive to survival.||The CX61 is effective at close to medium range."
	SightOffset=(X=0.0000000,Y=0.0200000,Z=1.5100000)
	CockingBringUpTime=1.5000000
	GunLength=16.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.CX61PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.CX61SecondaryFire'
	SelectAnimRate=1.4000000
	PutDownAnimRate=1.8000000
	PutDownTime=0.4000000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="Cimerion Labs' CX61 Tactical Rifle was engineered as a reliable primary weapon for use by medical personnel. Incorporating a nano-forge capable of producing G28 aerosol for projection by the weapon, it is able to choose between projecting healing spray or igniting the G28 gas in order to emit a blast of flame to disorient foes."
	Priority=32
	HudColor=(R=83,G=111,B=168,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=9
	PickupClass=Class'BWBP_OP_Pro.CX61Pickup'
	PlayerViewOffset=(X=8.0000000,Y=4.0000000,Z=-3.5000000)
	AttachmentClass=Class'BWBP_OP_Pro.CX61Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.CX61.Icon_CX61'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="CX61 Tactical Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.CX61_FPm'
	DrawScale=0.3000000
}
