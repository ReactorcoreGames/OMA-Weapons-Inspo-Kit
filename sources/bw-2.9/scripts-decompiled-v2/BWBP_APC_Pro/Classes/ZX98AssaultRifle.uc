class ZX98AssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var float RotationSpeeds[3];
var Sound MeleeFireSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	ZX98PrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	ZX98PrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	ZX98SecondaryFire(FireMode[1]).TurnVelocity.Yaw = NewTVYaw;
	ZX98SecondaryFire(FireMode[1]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	ZX98PrimaryFire(FireMode[0]).ZX98Weapon = self;
	ZX98SecondaryFire(FireMode[1]).ZX98Weapon = self;
	//return;	
}

simulated function float GetRampUpSpeed()
{
	local float mult;

	mult = 1.0000000 - (BarrelSpeed / RotationSpeeds[2]);
	return 0.0750000 + ((0.0700000 * mult) * mult);
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;

	bt.Roll = BarrelTurn;
	SetBoneRotation('RotatingBarrel', bt);
	DesiredSpeed = RotationSpeeds[int(CurrentWeaponMode)];
	super.WeaponTick(dt);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x26
	if(super.PutDown())
	{
		Instigator.AmbientSound = none;
		BarrelSpeed = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	super.Tick(dt);
	// End:0xA4
	if((FireMode[0].IsFiring() || FireMode[1].IsFiring() && FireCount <= 0) && !bServerReloading)
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.3500000 * dt, (GetRampUpSpeed()) * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x187
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (0.5000000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x187
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				Instigator.AmbientSound = none;
			}
		}
	}
	// End:0x1CA
	if(BarrelSpeed > float(0))
	{
		Instigator.AmbientSound = BarrelSpinSound;
		Instigator.SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1EE
	if(ThirdPersonActor != none)
	{
		ZX98Attachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x20
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	J0x20:

	// End:0x86 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0x7C
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x20;
	}
	// End:0xA9
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CurrentWeaponMode = newmode;
	}
	//return;	
}

simulated function float ChargeBar()
{
	return BarrelSpeed / DesiredSpeed;
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;		
	}
	else
	{
		// End:0x65
		if((Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = Instigator.Controller.RateWeapon(self) * 0.3000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, Height, dist, VDot;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x50
	if((AmmoAmount(1)) < 1)
	{
		return 0;		
	}
	else
	{
		// End:0x5E
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x14C
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x1B3
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x18B
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1A7
		if(VDot < float(0))
		{
			Result -= 0.2000000;			
		}
		else
		{
			Result += 0.2000000;
		}
	}
	dist = VSize((B.Enemy.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (Instigator.Location * vect(1.0000000, 1.0000000, 0.0000000)));
	// End:0x22E
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x240
	if(Result > 0.5000000)
	{
		return 1;
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticProInstantFire(bFireMode[0]).DecayRange.Min, BallisticProInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.6000000;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	BarrelSpinSound=Sound'IndoorAmbience.machinery14'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	RotationSpeeds[0]=0.1700000
	RotationSpeeds[1]=0.3400000
	RotationSpeeds[2]=0.5100000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;85.0;0.1;0.9;0.4")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.ZX98WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.ZX98WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.ZX98WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.ZX98WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.Ar.ARBigIcon'
	BigIconCoords=(X1=16,Y1=30,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="1800 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BWBP_APC_Pro.ZX98SightLEDs'
	ScopeViewTex=Texture'BWBP_APC_Tex.Ar.M30A1-Scope'
	bNoCrosshairInScope=true
	CockAnimPostReload="Cock"
	CockSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.NovaStaff.NovaOutA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=200,B=0,A=255),Color2=(R=42,G=46,B=48,A=130),StartSize1=61,StartSize2=120)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic fire. Moderate power, fire rate and recoil."
	ManualLines[1]="Automatic Gauss fire. High Power, Slower fire rate and Lower recoil."
	ManualLines[2]="Effective at medium range."
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	SightOffset=(X=-10.0000000,Y=-0.5000000,Z=12.5000000)
	CockAnimRate=1.4000000
	GunLength=16.0000000
	FireModeClass[0]=Class'BWBP_APC_Pro.ZX98PrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.ZX98SecondaryFire'
	PutDownAnimRate=1.6000000
	PutDownTime=0.3300000
	BringUpTime=0.4500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="In the field of gauss weaponry, things are rapidly evolving to deal with growing threats like Cryons and heavily armored Skrith. Though precision weapons do help, in the frontlines, there hasn't been anything to deal with close range enemies until now.  The ZX-98 Combat Gauss Rifle is a new development, firing 7.62 rounds continuously through a gauss battery which has been made to stand up to full auto fire without overheating. Nicknamed the 'Reaper' for it's demonic appearance and it's prowess to take the lives of those who stand on the wrong end, this gauss combat rifle is ready to defend from any threat."
	DisplayFOV=55.0000000
	Priority=41
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=10
	PickupClass=Class'BWBP_APC_Pro.ZX98Pickup'
	PlayerViewOffset=(X=2.0000000,Y=5.0000000,Z=-10.5000000)
	BobDamping=2.2500000
	AttachmentClass=Class'BWBP_APC_Pro.ZX98Attachment'
	IconMaterial=Texture'BWBP_APC_Tex.Ar.ARSmallIcon'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="ZX-98 Reaper Gauss Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.ZX98_FPm'
	DrawScale=0.2000000
}
