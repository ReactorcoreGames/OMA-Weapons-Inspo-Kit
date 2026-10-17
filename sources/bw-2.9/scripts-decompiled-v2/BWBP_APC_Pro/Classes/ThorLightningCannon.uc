class ThorLightningCannon extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var ThorLCStreamEffectNew StreamEffect;
var ThorLCStreamEffectChild StreamEffectChild;
var ThorLCGameRules MyRules;
var Pawn DrainTarget;
var Pawn BoostTarget;
var float MaxStreamRange;
var bool bAlternateCheck;
var float ClawAlpha;

simulated function PostBeginPlay()
{
	local GameRules G;

	super.PostBeginPlay();
	// End:0xD2
	if(int(Role) == int(ROLE_Authority))
	{
		G = Level.Game.GameRulesModifiers;
		J0x33:

		// End:0x6F [Loop If]
		if((G != none) && G.Class != Class'BWBP_APC_Pro.ThorLCGameRules')
		{
			G = G.NextGameRules;
			// [Loop Continue]
			goto J0x33;
		}
		// End:0xB2
		if(G.Class != Class'BWBP_APC_Pro.ThorLCGameRules')
		{
			G = Spawn(Class'BWBP_APC_Pro.ThorLCGameRules');
			Level.Game.AddGameModifier(G);
		}
		MyRules = ThorLCGameRules(G);
		MyRules.AddStreamer(self);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x20
	if(int(Role) == int(ROLE_Authority))
	{
		MyRules.RemoveStreamer(self);
	}
	super.Destroyed();
	//return;	
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	Instigator = P;
	// End:0x5A
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);
		ThorLCAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;		
	}
	else
	{
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	BoneName = P.GetWeaponBoneFor(self);
	// End:0xCF
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

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x0B
	if(IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	ThorLCAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
	//return;	
}

simulated function ClientSwitchWeaponMode(byte newmode)
{
	// End:0x0B
	if(IsFiring())
	{
		return;
	}
	super.ClientSwitchWeaponMode(newmode);
	ThorLCAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x101
	if(FireMode[0].bIsFiring)
	{
		// End:0xFE
		if(ClawAlpha < float(1))
		{
			ClawAlpha = FClamp(ClawAlpha + dt, 0.0000000, 1.0000000);
			SetBoneRotation('Claw1', rot(4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw1B', rot(4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2B', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3B', rot(-4096, 0, 0), 0, ClawAlpha);
		}		
	}
	else
	{
		// End:0x1E6
		if(ClawAlpha > float(0))
		{
			ClawAlpha = FClamp(ClawAlpha - (dt / float(3)), 0.0000000, 1.0000000);
			SetBoneRotation('Claw1', rot(4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw1B', rot(4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2B', rot(-4096, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3B', rot(-4096, 0, 0), 0, ClawAlpha);
		}
	}
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	local Vector EndEffect;

	super.RenderOverlays(C);
	// End:0x167
	if(StreamEffect != none)
	{
		StreamEffect.bHidden = true;
		StreamEffectChild.bHidden = true;
		StreamEffect.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		StreamEffectChild.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		// End:0x113
		if(StreamEffect.LinkedPawn != none)
		{
			EndEffect = ThorLCAttachment(ThirdPersonActor).EndEffect;
			StreamEffect.EndEffect = EndEffect;
			StreamEffectChild.EndEffect = EndEffect;
		}
		C.DrawActor(StreamEffect, false, false, Instigator.Controller.FovAngle);
		C.DrawActor(StreamEffectChild, false, false, Instigator.Controller.FovAngle);
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

simulated function bool PutDown()
{
	// End:0x0B
	if(super.PutDown())
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

defaultproperties
{
	MaxStreamRange=1500.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_APC_Pro.ThorLCWeaponParams'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.ProtonPack.BigIcon_ProtonPack'
	BigIconCoords=(X1=0,Y1=32,X2=512,Y2=225)
	WeaponModes[0]=(ModeName="Gravity Proton Stream",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoCrosshairInScope=true
	bNonCocking=true
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.DarkStar.DarkInA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=113,G=115,B=255,A=176),Color2=(R=109,G=0,B=255,A=255),StartSize1=74,StartSize2=66)
	bWT_Energy=true
	bWT_Heal=true
	SightingTime=0.2000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=-768)
	SightOffset=(X=-24.0000000,Y=-3.1000000,Z=15.0000000)
	FireModeClass[0]=Class'BWBP_APC_Pro.ThorLCPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.ThorLCSecondaryFire'
	PutDownTime=1.1000000
	BringUpTime=1.1000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	bShowChargingBar=true
	Description="To Add"
	Priority=16
	HudColor=(R=255,G=75,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=1
	PickupClass=Class'BWBP_APC_Pro.ThorLCPickup'
	PlayerViewOffset=(X=7.0000000,Y=10.0000000,Z=-10.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.ThorLCAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.ProtonPack.Icon_ProtonPack'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="[B] BR-99 'Thor' Lightning Cannon"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	DrawScale=0.2500000
	SoundPitch=56
	SoundRadius=32.0000000
}
