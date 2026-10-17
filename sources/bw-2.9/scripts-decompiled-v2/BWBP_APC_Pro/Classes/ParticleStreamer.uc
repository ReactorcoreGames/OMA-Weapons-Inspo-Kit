class ParticleStreamer extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var ParticleStreamEffectNew StreamEffect;
var ParticleStreamEffectChild StreamEffectChild;
var bool bShieldOn;
var Sound ShieldOnSound;
var Sound ShieldOffSound;
var float LastShieldTick;
var Pawn DrainTarget;
var Pawn BoostTarget;
var ParticleGameRules MyRules;
var float NextAmmoTickTime;
var float MaxStreamRange;
var bool bAlternateCheck;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bShieldOn;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		DisableShield;
}

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
		if((G != none) && G.Class != Class'BWBP_APC_Pro.ParticleGameRules')
		{
			G = G.NextGameRules;
			// [Loop Continue]
			goto J0x33;
		}
		// End:0xB2
		if(G.Class != Class'BWBP_APC_Pro.ParticleGameRules')
		{
			G = Spawn(Class'BWBP_APC_Pro.ParticleGameRules');
			Level.Game.AddGameModifier(G);
		}
		MyRules = ParticleGameRules(G);
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
		ParticleStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;		
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
	ParticleStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
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
	ParticleStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0xEE
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xEE
		if(((NextAmmoTickTime < Level.TimeSeconds) && !FireMode[0].bIsFiring) && !FireMode[1].bIsFiring)
		{
			// End:0x93
			if((MagAmmo < default.MagAmmo) && bShieldOn)
			{
				MagAmmo = Min(default.MagAmmo, MagAmmo + 3);
			}
			// End:0xCB
			if(bAlternateCheck)
			{
				// End:0xC8
				if(MagAmmo < default.MagAmmo)
				{
					MagAmmo = Min(default.MagAmmo, MagAmmo + 1);
					bAlternateCheck = false;
				}				
			}
			else
			{
				bAlternateCheck = true;
			}
			NextAmmoTickTime = Level.TimeSeconds + 0.1000000;
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
			EndEffect = ParticleStreamAttachment(ThirdPersonActor).EndEffect;
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

simulated function FirePressed(float F)
{
	// End:0x1E
	if(bNeedReload && MagAmmo > 0)
	{
		bNeedReload = false;
	}
	super.FirePressed(F);
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	return false;
	//return;	
}

function ServerStartReload(optional byte i)
{
	//return;	
}

simulated function string GetHUDAmmoText(int Mode)
{
	return "";
	//return;	
}

simulated function float AmmoStatus(optional int Mode)
{
	return float(MagAmmo) / float(default.MagAmmo);
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

function Notify_SwitchPress()
{
	// End:0x5C
	if(!bShieldOn)
	{
		bShieldOn = true;
		PlaySound(ShieldOnSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);		
	}
	else
	{
		bShieldOn = false;
		PlaySound(ShieldOffSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
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

function byte BestMode()
{
	return 0;
	//return;	
}

function DisableShield()
{
	bShieldOn = false;
	PlaySound(ShieldOffSound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	//return;	
}

defaultproperties
{
	ShieldOnSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Putaway'
	ShieldOffSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Pullout'
	MaxStreamRange=1500.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_APC_Pro.ParticleStreamerWeaponParams'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.ProtonPack.BigIcon_ProtonPack'
	BigIconCoords=(X1=0,Y1=32,X2=512,Y2=225)
	BringUpSound=(Sound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
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
	FireModeClass[0]=Class'BWBP_APC_Pro.ParticleStreamPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.ParticleStreamSecondaryFire'
	SelectAnimRate=1.2500000
	PutDownAnimRate=1.2500000
	PutDownTime=0.6000000
	BringUpTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="E90-N mk.II Proton Pack||Manufacturer: Apollo Industries|Primary: Wrangling Beam|Secondary: Healing Beam||Originally built for calibrating various scientifice instruments in the field, the rugged E90-N Particle Accelerator is able to emit measured streams of exotic particles in a fairly controlled manner with minimal risk of radiation exposure to its operator!||Its utility on the battlefield was put to the test on the arctic research station 379-B61 when a then unknown Cryon menace infected several of the researchers and turned them against the rest. The Cryon threat is now classified as as Class 5 free roaming nano-vapor, and due to its rather incorporeal nature, standard weapons would destroy the hosts it inhabited, but left the nano-swarm itself free to inhabit the next victim. The E90-N Particle Acclerator was on hand at the time, and it has proven highly effective at thoroughly and completely neutronizing the Cryon nanobots directly, and the savior scientist was able to quickly adjust the radiation output in time to bestow restoritive effects on what was left of the final hosts of the Cryon swarm, allowing them to survive a relatively long life without the use of several of their major organs."
	Priority=16
	HudColor=(R=255,G=75,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=1
	PickupClass=Class'BWBP_APC_Pro.ParticleStreamPickup'
	PlayerViewOffset=(X=35.0000000,Y=15.0000000,Z=-20.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_APC_Pro.ParticleStreamAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.ProtonPack.Icon_ProtonPack'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="E90-N Particle Accelerator MK.II"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.ProtonPack_FPm'
	DrawScale=0.6000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_OP_Tex.ProtonPack.proton_gun_SH1'
	SoundPitch=56
	SoundRadius=32.0000000
}
