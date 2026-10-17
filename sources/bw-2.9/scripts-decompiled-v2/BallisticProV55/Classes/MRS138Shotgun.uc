class MRS138Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLightsOn;
var Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;
var Emitter TazerEffect;
var MRS138TazerLineEffect TazerLineEffect;
var float TazerTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight;
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super(BallisticWeapon).AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated event ClientStartFire(int Mode)
{
	// End:0x1C
	if(Mode == 1)
	{
		// End:0x1C
		if(TazerEffect == none)
		{
			StartTazer();
		}
	}
	super(Weapon).ClientStartFire(Mode);
	//return;	
}

simulated function StartTazer()
{
	TazerTime = 0.0000000;
	// End:0x31
	if(int(Role) == int(ROLE_Authority))
	{
		MRS138Attachment(ThirdPersonActor).bTazerOn = true;
	}
	// End:0x8E
	if(Instigator.IsLocallyControlled() && TazerEffect == none)
	{
		TazerEffect = Spawn(Class'BallisticProV55.MRS138TazerEffect', self,, Location);
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(TazerEffect, DrawScale);
		AttachToBone(TazerEffect, 'tip2');
	}
	//return;	
}

simulated function OnWeaponDisplaced()
{
	super(BallisticWeapon).OnWeaponDisplaced();
	// End:0x43
	if((int(Role) == int(ROLE_Authority)) && MRS138Attachment(ThirdPersonActor).bTazerOn)
	{
		MRS138Attachment(ThirdPersonActor).PlayerTazeEnd();
	}
	//return;	
}

simulated function KillTazer()
{
	// End:0x1A
	if(TazerEffect != none)
	{
		TazerEffect.Kill();
	}
	// End:0x4D
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		MRS138Attachment(ThirdPersonActor).bTazerOn = false;
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x22
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0x41
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x97
	if((Anim == FireMode[0].FireAnim) || (Anim == FireMode[1].FireAnim) && !FireMode[1].IsFiring())
	{
		bPreventReload = false;
	}
	// End:0x107
	if((MeleeFireMode != none) && Anim == MeleeFireMode.FireAnim)
	{
		// End:0xD7
		if(int(MeleeState) == int(4))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 0;
		}
		ReloadState = 0;
		// End:0xFF
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bPreventReload = false;
	}
	// End:0x1C1
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		AnimBlendParams(2, 0.0000000);
		// End:0x187
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		// End:0x1C1
		if((Anim == bFireMode[0].AimedFireAnim) || !bFireMode[1].IsFiring())
		{
			bPreventReload = false;
		}
	}
	// End:0x386
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x26B
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x2DA
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x30A
				if(!FireMode[1].IsFiring() && int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x386
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x393
	if(Channel > 0)
	{
		return;
	}
	// End:0x3B3
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x435
	if(int(ReloadState) == int(6))
	{
		// End:0x425
		if(((MagAmmo - ((int(!bNeedCock) * int(!bNonCocking)) * int(bMagPlusOne))) >= WeaponParams.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x4A8
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x476
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
	// End:0x4E8
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x51E
	if(int(ReloadState) == int(9))
	{
		// End:0x510
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	bLightsOn = !bLightsOn;
	ServerFlashLight(bLightsOn);
	// End:0x7A
	if(bLightsOn)
	{
		PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
		// End:0x58
		if(FlashLightEmitter == none)
		{
			FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
		}
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
		StartProjector();		
	}
	else
	{
		PlaySound(TorchOffSound,, 0.7000000,, 32.0000000);
		// End:0xA5
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		KillProjector();
	}
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	MRS138Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	GunLength = default.GunLength;
	// End:0x53
	if(((Instigator != none) && AIController(Instigator.Controller) != none) && FRand() > 0.5000000)
	{
		WeaponSpecial();		
	}
	else
	{
		// End:0x7E
		if(bLightsOn && Instigator.IsLocallyControlled())
		{
			bLightsOn = false;
			WeaponSpecial();
		}
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x2E
	if(super(BallisticWeapon).PutDown())
	{
		KillTazer();
		KillProjector();
		// End:0x2C
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	KillTazer();
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip2');
	FlashLightProj.SetRelativeLocation(TorchOffset);
	//return;	
}

simulated function KillProjector()
{
	// End:0x17
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x49
	if((TazerTime != float(0)) && Level.TimeSeconds > (TazerTime + float(5)))
	{
		KillTazer();
		TazerTime = 0.0000000;
	}
	// End:0x68
	if(!bLightsOn || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x85
	if(!Instigator.IsFirstPerson())
	{
		KillProjector();		
	}
	else
	{
		// End:0x96
		if(FlashLightProj == none)
		{
			StartProjector();
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Vector TazLoc;
	local Rotator TazRot;

	// End:0x89
	if(TazerLineEffect != none)
	{
		TazerLineEffect.bHidden = true;
		TazerLineEffect.SetLocation(ConvertFOVs(GetBoneCoords('tip2').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		Canvas.DrawActor(TazerLineEffect, false, false, Instigator.Controller.FovAngle);
	}
	super(BallisticWeapon).RenderOverlays(Canvas);
	// End:0x15B
	if(bLightsOn || TazerEffect != none)
	{
		TazLoc = GetBoneCoords('tip2').Origin;
		TazRot = GetBoneRotation('tip2');
		// End:0x116
		if(TazerEffect != none)
		{
			TazerEffect.SetLocation(TazLoc);
			TazerEffect.SetRotation(TazRot);
			Canvas.DrawActor(TazerEffect, false, false, DisplayFOV);
		}
		// End:0x15B
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.SetLocation(TazLoc);
			FlashLightEmitter.SetRotation(TazRot);
			Canvas.DrawActor(FlashLightEmitter, false, false, DisplayFOV);
		}
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	super(BallisticWeapon).WeaponTick(dt);
	// End:0x78
	if(((TazerLineEffect != none) && !Instigator.IsFirstPerson()) && AIController(Instigator.Controller) == none)
	{
		TazerLineEffect.bHidden = false;
		TazerLineEffect.SetLocation(BallisticAttachment(ThirdPersonActor).GetModeTipLocation());
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

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super(BallisticWeapon).RateSelf() * 0.2000000;		
	}
	else
	{
		return super(BallisticWeapon).RateSelf();
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x88
	if(dist > float(250))
	{
		return 0;
	}
	// End:0xB4
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 1;
	}
	// End:0x13E
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(Instigator.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(7);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return 0.3000000 - ((B.Skill / float(6)) * (float(1) - (dist / float(3000))));
	//return;	
}

defaultproperties
{
	TorchOffset=(X=-330.0000000,Y=-35.0000000,Z=50.0000000)
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;40.0;0.0;1.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.MRS138WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MRS138WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MRS138WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MRS138WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_MRS138'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Pump-Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.3500000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.3750000
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="PrepReload"
	EndShovelAnim="EndReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=183),Color2=(R=29,G=67,B=8,A=255),StartSize1=108,StartSize2=109)
	LongGunPivot=(Pitch=4500,Yaw=-8000,Roll=0)
	MeleeFireClass=Class'BallisticProV55.MRS138MeleeFire'
	bWT_Shotgun=true
	ManualLines[0]="10-gauge pump-action shotgun fire. Moderate spread, good damage and average fire rate. Good shoulder fire properties."
	ManualLines[1]="Launches a tazer. The user must hold down Altfire or the tazer will be retracted. Upon striking an enemy, transmits a current dealing low sustained damage but slowing the enemy movement."
	ManualLines[2]="Has a melee attack. The damage of this attack increases to its maximum over 1.5 seconds of holding the altfire key. The attack inflicts more damage from behind. Inflicts a medium-duration blind upon enemies when impacting and knocks them away from the user.||Weapon Function engages a flashlight which illuminates dark areas.||This weapon is extremely effective at close range."
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	StartShovelAnimRate=1.4000000
	EndShovelAnimRate=1.6000000
	GunLength=32.0000000
	FireModeClass[0]=Class'BallisticProV55.MRS138PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.MRS138SecondaryFire'
	PutDownAnimRate=1.5000000
	PutDownTime=0.3500000
	AIRating=0.8000000
	CurrentRating=0.8000000
	bMeleeWeapon=true
	Description="Also from the first line of Drake & Co weaponry, the MRS138 Combat Shotgun is an excellent close-range weapon. It is outfitted with a tactical light and tazer attachment to increase its effectiveness as a crowd control and civilian weapon. The tazer is an effective tool for stunning enemies and inflicting slight damage, leaving them blinded and disoriented for a few seconds, while the flash light can be used for locating those which hide in the dark."
	Priority=36
	HudColor=(R=100,G=150,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=3
	PickupClass=Class'BallisticProV55.MRS138Pickup'
	PlayerViewOffset=(X=10.0000000,Y=6.0000000,Z=-7.0000000)
	AttachmentClass=Class'BallisticProV55.MRS138Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.MRS138.SmallIcon_MRS138'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MRS-138 Tactical Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRS138_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.MRS138.MRS138Shiney'
	Skins[2]=Texture'BW_Core_WeaponTex.MRS138.MRS138HeatShield'
	Skins[3]=Texture'BW_Core_WeaponTex.MRS138.MRS138Shell'
}
