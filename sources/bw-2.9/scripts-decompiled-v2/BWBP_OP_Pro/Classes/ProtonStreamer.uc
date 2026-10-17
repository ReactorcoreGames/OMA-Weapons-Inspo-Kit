class ProtonStreamer extends BallisticWeapon
	config(BallisticProV55);

var ProtonStreamEffect StreamEffect;
var ProtonStreamEffectNew StreamEffectGravity;
var ProtonStreamEffectChild StreamEffectChild;
var bool bShieldOn;
var Sound ShieldOnSound;
var Sound ShieldOffSound;
var float LastShieldTick;
var Pawn DrainTarget;
var Pawn BoostTarget;
var ProtonGameRules MyRules;
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
		if((G != none) && G.Class != Class'BWBP_OP_Pro.ProtonGameRules')
		{
			G = G.NextGameRules;
			// [Loop Continue]
			goto J0x33;
		}
		// End:0xB2
		if(G.Class != Class'BWBP_OP_Pro.ProtonGameRules')
		{
			G = Spawn(Class'BWBP_OP_Pro.ProtonGameRules');
			Level.Game.AddGameModifier(G);
		}
		MyRules = ProtonGameRules(G);
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
		ProtonStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;		
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
	ProtonStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
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
	ProtonStreamAttachment(ThirdPersonActor).ModeColor = CurrentWeaponMode;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x79
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x79
		if(bShieldOn)
		{
			// End:0x3A
			if((AmmoAmount(0)) <= 1)
			{
				DisableShield();				
			}
			else
			{
				// End:0x79
				if(Level.TimeSeconds >= LastShieldTick)
				{
					ConsumeAmmo(0, 1.0000000);
					LastShieldTick = Level.TimeSeconds + 0.3000000;
				}
			}
		}
	}
	//return;	
}

simulated function BonusAmmo(float AppliedDmg)
{
	Ammo[0].AddAmmo(int(AppliedDmg));
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0xA3
	if(StreamEffect != none)
	{
		StreamEffect.bHidden = true;
		StreamEffect.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		StreamEffect.UpdateEndpoint();
		C.DrawActor(StreamEffect, false, false, Instigator.Controller.FovAngle);
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
	ThirdPersonActor.SetOverlayMaterial(none, 0.0000000, true);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 512.0000000);
	//return;	
}

defaultproperties
{
	ShieldOnSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Putaway'
	ShieldOffSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Pullout'
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.ProtonWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.ProtonWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.ProtonWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.ProtonWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.ProtonPack.BigIcon_ProtonPack'
	BigIconCoords=(X1=0,Y1=32,X2=512,Y2=225)
	BringUpSound=(Sound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Pullout',Volume=0.2050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Proton Stream",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Neutrino Amplification",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gravity Proton Stream",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoCrosshairInScope=true
	bNoMag=true
	bNonCocking=true
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.DarkStar.DarkInA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=113,G=115,B=255,A=176),Color2=(R=109,G=0,B=255,A=255),StartSize1=74,StartSize2=66)
	bWT_Energy=true
	bWT_Heal=true
	SightPivot=(Pitch=1024,Yaw=0,Roll=-768)
	SightOffset=(X=-24.0000000,Y=-3.1000000,Z=15.0000000)
	FireModeClass[0]=Class'BWBP_OP_Pro.ProtonStreamPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.ProtonStreamSecondaryFire'
	SelectAnimRate=1.2500000
	PutDownAnimRate=1.2500000
	PutDownTime=0.6000000
	BringUpTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	Description="Psycho-Kinetic Amplifier||Manufacturer: Unknown Skrith Engineers|Primary: Slower moving, Energy Fire|Secondary: Instant Beam||It has a fast fire rate, rechargeable batteries, a good accuracy, low damage, and every Skrith has one. The infamous A42 'Whip', as it was named by the UTC Marines, has been the standard issue Skrith sidearm in both wars. Though it may be accurate, have a fast rate of fire and an unlimited, rechargeable cell, the A42 does very little damage, and has less accuracy than others when running, making it an all-round ineffective weapon. The secondary attack is a recent feature, giving the weapon the ability to charge up a variable shot. This does make the weapon more powerful, yet it is still not as effective as other sidearms. The rechargable cell however, means that it is always there when you need the extra bit of range over the melee weapons."
	Priority=16
	HudColor=(R=255,G=75,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	PickupClass=Class'BWBP_OP_Pro.ProtonStreamPickup'
	PlayerViewOffset=(X=10.0000000,Y=7.0000000,Z=-8.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_OP_Pro.ProtonStreamAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.ProtonPack.Icon_ProtonPack'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="E90-N Particle Accelerator"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.ProtonPack_FPm'
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
