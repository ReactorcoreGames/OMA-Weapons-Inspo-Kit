class M7A3AssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var M7A3TazerEffect TazerEffect;
var(M7A3) int NumpadYOffset1;
var(M7A3) int NumpadYOffset2;
var(M7A3) ScriptedTexture WeaponScreen;
var(M7A3) int ScreenIndex;
var(M7A3) Material screen;
var(M7A3) Material ScreenBase;
var(M7A3) Material Numbers;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
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
	Tex.DrawTile(20.0000000, 0.0000000, 128.0000000, 64.0000000, 0.0000000, 0.0000000, 128.0000000, 64.0000000, ScreenBase, MyFontColor);
	Tex.DrawTile(85.0000000, 32.0000000, 70.0000000, 70.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(105.0000000, 32.0000000, 70.0000000, 70.0000000, 40.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
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

simulated function PlayCocking(optional byte Type)
{
	local float AdjustedCockAnimRate;

	// End:0x40
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		AdjustedCockAnimRate = CockAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;		
	}
	else
	{
		AdjustedCockAnimRate = CockAnimRate;
	}
	// End:0x87
	if((int(Type) == 2) && HasAnim(CockAnimPostReload))
	{
		SafePlayAnim(CockAnimPostReload, AdjustedCockAnimRate, 0.2000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	// End:0xCF
	if((int(SightingState) != int(0)) && int(Type) != 1)
	{
		TemporaryScopeDown(0.5000000);
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
	// End:0xEE
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
		TazerEffect.SetLocation(BallisticAttachment(ThirdPersonActor).GetTipLocation());
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
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.FG50.FG50-ScriptLCD'
	ScreenIndex=5
	screen=Shader'BWBP_SKC_Tex.FG50.FG50-ScriptLCD-SD'
	ScreenBase=Texture'UCGeneric.SolidColours.Black'
	Numbers=Texture'BWBP_SKC_Tex.PUMA.PUMA-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="340.0;30.0;1.2;60.0;0.9;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_JCF_Pro.M7A3WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_JCF_Pro.M7A3WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_JCF_Pro.M7A3WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_JCF_Pro.M7A3WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_JCF_Tex.M7A3.BigIcon_M7A3'
	BringUpSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3_Pickup',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3_Select',Volume=0.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	FullZoomFOV=50.0000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3-Cock',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3_Mag_Hit',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3_Mag_out',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3_Mag_in',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=144,B=0,A=135),Color2=(R=255,G=0,B=0,A=110),StartSize1=138,StartSize2=44)
	LongGunPivot=(Pitch=2000,Yaw=-1024,Roll=0)
	LongGunOffset=(X=-20.0000000,Y=0.0000000,Z=-15.0000000)
	bWT_Bullet=true
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.3000000,Z=11.2800000)
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	GunLength=16.0000000
	FireModeClass[0]=Class'BWBP_JCF_Pro.M7A3PrimaryFire'
	FireModeClass[1]=Class'BWBP_JCF_Pro.M7A3SecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bSniping=true
	Description="M7A3 Battle Rifle||Manufacturer: UTC Defense Tech|Primary: Automatic 7.62mm Fire|Secondary: Activate Zooming Scope||The M7A3 Assault Rifle, made by UTC Defense Tech, is one of the newer additions to the modern day battlefield. Using a special bullpup magazine and specialized 4.77mm rounds, the M7A3 can accurately pick off long range targets with ease. The low recoil and good controllability of the rounds more than make up for their subpar damage ratings, and soldiers on average can bring twice as many clips into the field with minimal added fatigue. The M7A3 is a good alternative for those who deem the M50 uncontrollable and who dislike its tendency to buck when firing."
	DisplayFOV=55.0000000
	Priority=33
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_JCF_Pro.M7A3Pickup'
	PlayerViewOffset=(X=5.0000000,Y=3.0000000,Z=-8.0000000)
	BobDamping=2.2500000
	AttachmentClass=Class'BWBP_JCF_Pro.M7A3Attachment'
	IconMaterial=Texture'BWBP_JCF_Tex.M7A3.SmallIcon_M7A3'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=35)
	ItemName="M7A3 Battle Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_JCF_Anims.M7A3_FPm'
}
