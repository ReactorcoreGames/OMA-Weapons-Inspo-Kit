class N3XPlaz extends BallisticMeleeWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var bool bOverheat;
var() Sound OverheatSound;
var() Sound VentingSound;
var Sound ShieldHitSound;
var float HeatLevel;
var float MaxHeat;
var Actor Arc;
var float MagnetSwitchTime;
var float MagnetSwitchFireRate;
var name MagnetOpenAnim;
var name MagnetCloseAnim;
var name MagnetForceCloseAnim;
var bool bMagnetOpen;
var() FullSound ToggleSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat;
}

simulated event Destroyed()
{
	// End:0x17
	if(Arc != none)
	{
		Arc.Destroy();
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	bMagnetOpen = false;
	super(BallisticWeapon).BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x39
	if(super(BallisticWeapon).PutDown())
	{
		// End:0x20
		if(bMagnetOpen)
		{
			bMagnetOpen = false;
			AdjustMagnetProperties();
		}
		// End:0x37
		if(Arc != none)
		{
			Arc.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x0B
	if(bOverheat)
	{
		return;
	}
	// End:0x37
	if((Level.TimeSeconds < MagnetSwitchTime) || int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x49
	if(int(ClientState) != int(4))
	{
		return;
	}
	bMagnetOpen = !bMagnetOpen;
	ReloadState = 9;
	TemporaryScopeDown(0.4000000);
	MagnetSwitchTime = Level.TimeSeconds + MagnetSwitchFireRate;
	PlayMagnetSwitching(bMagnetOpen);
	AdjustMagnetProperties();
	// End:0xBF
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerWeaponSpecial(byte(bMagnetOpen));
	}
	//return;	
}

function ServerWeaponSpecial(byte i)
{
	// End:0x0B
	if(bOverheat)
	{
		return;
	}
	bMagnetOpen = bool(i);
	PlayMagnetSwitching(bMagnetOpen);
	AdjustMagnetProperties();
	//return;	
}

simulated function PlayMagnetSwitching(bool bOpen)
{
	// End:0x14
	if(bOpen)
	{
		PlayAnim(MagnetOpenAnim);		
	}
	else
	{
		PlayAnim(MagnetCloseAnim);
	}
	//return;	
}

simulated function Overheat(bool bForceClose)
{
	// End:0x14
	if(bForceClose)
	{
		PlayAnim(MagnetForceCloseAnim);		
	}
	else
	{
		PlayAnim(MagnetCloseAnim);
	}
	ReloadState = 9;
	bMagnetOpen = false;
	MagnetSwitchTime = Level.TimeSeconds + float(5);
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 80.0000000, none, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_M2020Overheat');
	AdjustMagnetProperties();
	//return;	
}

simulated function AdjustMagnetProperties()
{
	// End:0x68
	if(bMagnetOpen)
	{
		// End:0x38
		if(Arc == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc, Class'BWBP_SKC_Pro.N3XBladeEffect', DrawScale, self, 'PlasmaEmitterStart');
		}
		Skins[4] = Shader'BWBP_SKC_Tex.PlasAxe.PlasEdge_Fire_S1';
		Instigator.AmbientSound = VentingSound;
		AddSpeedModification(0.7000000);		
	}
	else
	{
		// End:0x87
		if(Arc != none)
		{
			Emitter(Arc).Kill();
		}
		Skins[4] = Texture'BW_Core_WeaponTex.Misc.Invisible';
		Instigator.AmbientSound = UsedAmbientSound;
		RemoveSpeedModification(1.0000000);
	}
	//return;	
}

simulated function Notify_TogglePower()
{
	PlayOwnedSound(ToggleSound.Sound, ToggleSound.Slot, ToggleSound.Volume, ToggleSound.bNoOverride, ToggleSound.Radius, ToggleSound.Pitch, ToggleSound.bAtten);
	//return;	
}

simulated event WeaponTick(float dt)
{
	// End:0x21
	if(bOverheat && HeatLevel == 0.2000000)
	{
		Overheat(false);
	}
	super(BallisticWeapon).WeaponTick(dt);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x1E
	if(bMagnetOpen)
	{
		AddHeat(dt * float(200), false);		
	}
	else
	{
		// End:0x53
		if(HeatLevel > float(0))
		{
			HeatLevel = FMax(HeatLevel - ((dt * float(200)) * float(5)), 0.0000000);			
		}
		else
		{
			HeatLevel = 0.0000000;
		}
	}
	super.Tick(dt);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Vector HitNormal;

	// End:0x16
	if(!DamageType.default.bLocationalHit)
	{
		return;
	}
	// End:0x43
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bMetallic)
	{
		return;
	}
	// End:0x89
	if(CheckReflect(HitLocation, HitNormal, 0))
	{
		AddHeat(float(Damage * 5), false);
		Damage /= float(5);
		Momentum /= float(5);
		PlaySound(ShieldHitSound, 0);
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	// End:0x0D
	if(!bMagnetOpen)
	{
		return false;
	}
	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0x7B
	if((FaceDir Dot HitDir) < -0.3700000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function AddHeat(float Amount, bool bReplicate)
{
	HeatLevel = FClamp(HeatLevel + Amount, 0.0000000, MaxHeat);
	// End:0x48
	if(bReplicate && !Instigator.IsLocallyControlled())
	{
		ClientSetHeat(HeatLevel);
	}
	// End:0x7D
	if((HeatLevel == MaxHeat) && bMagnetOpen)
	{
		PlaySound(OverheatSound,, 3.7000000,, 32.0000000);
		Overheat(true);
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	// End:0x40
	if((HeatLevel == MaxHeat) && bMagnetOpen)
	{
		PlaySound(OverheatSound,, 3.7000000,, 32.0000000);
		Overheat(true);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / MaxHeat;
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x86
	if(VSize(B.Enemy.Location - Instigator.Location) > (FireMode[0].MaxRange() * 1.5000000))
	{
		return 1;
	}
	Result = FRand();
	// End:0xEB
	if((Vector(B.Enemy.Rotation) Dot Normal(Instigator.Location - B.Enemy.Location)) < 0.0000000)
	{
		Result += 0.3000000;		
	}
	else
	{
		Result -= 0.3000000;
	}
	// End:0x109
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
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = AIRating;
	// End:0x9C
	if(dist > float(1500))
	{
		return 0.1000000;
	}
	// End:0xE4
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		Result += (0.0800000 * B.Skill);
	}
	// End:0x153
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result = FMax(0.0000000, Result *= (0.7000000 - (dist / float(1000))));		
	}
	else
	{
		Result = FMax(0.0000000, Result *= (float(1) - (dist / float(1000))));
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(4);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(1500)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

defaultproperties
{
	OverheatSound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Overload'
	VentingSound=Sound'BWBP_SKC_Sounds.M2020.M2020-IdleShield'
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	MaxHeat=4000.0000000
	MagnetSwitchFireRate=2.0000000
	MagnetOpenAnim="Toggle"
	MagnetCloseAnim="Toggle"
	MagnetForceCloseAnim="Overheat"
	ToggleSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Close',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-999.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.N3XWeaponParams'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.NEXWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.NEXWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.NEXWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.PlasAxe.BigIcon_PlasAxe'
	BigIconCoords=(X1=96,Y1=10,X2=418,Y2=245)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.NEX.NEX-Pullout',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Strikes",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="KILL!",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=0,B=255,A=157),Color2=(R=149,G=152,B=153,A=255),StartSize1=48,StartSize2=17)
	bWT_Heal=true
	PlayerSpeedFactor=1.1000000
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.N3XPlazPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.N3XPlazSecondaryFire'
	PutDownTime=0.6600000
	BringUpTime=0.6600000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.2000000
	CurrentRating=0.2000000
	bMeleeWeapon=true
	Description="NEX Plas-Edge Sword||Manufacturer: Nexron Defence|Primary: Slash|Secondary: Charged Slash|Special: Block|| The NEX Plas-Edge Mod 0 is the first in a line of high tech energy based swords pioneered by Nexron defense. Unlike the later nanosword designs, the NEX Mod 0 uses only the supercharged ionic gas channel for energy and relies on a traditional metal sword for the cutting. This approach was quickly abandoned as Element 115's plasma field unfortunately proved to be highly unstable with erratic charge levels and random dangerous overheats. The blade's excessive heat also required a different approach - scientists noted that after prolonged exposure the blade ionized the surrounding atmosphere and made breathing difficult. When using the NEX in combat, be careful not to overcharge it as the blade is prone to discharge when completely energized. It should be noted that the plas-edge's coils are incredibly unstable and will absorb any and all incoming energy. With an effect similar to skrith anti-energy armor, this can be used to the user's advantage in the field by absorbing enemy plasma charges and using them to strike a supercharged blow."
	Priority=1
	HudColor=(R=255,G=0,B=0,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=1
	PickupClass=Class'BWBP_SKC_Pro.N3XPlazPickup'
	PlayerViewOffset=(X=33.0000000,Y=0.0000000,Z=-10.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.N3XPlazAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.PlasAxe.SmallIcon_PlasAxe'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="NEX Plas-Edge Axe"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PlasEdgeAxe_FPm'
	DrawScale=0.4000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.PlasAxe.PlasEdge_Axe_S1'
	Skins[2]=Shader'BWBP_SKC_Tex.PlasAxe.PlasEdge_Shield_S1'
	Skins[3]=Texture'BW_Core_WeaponTex.Misc.Glass'
	Skins[4]=Texture'BW_Core_WeaponTex.Misc.Invisible'
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
}
