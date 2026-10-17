class FlameSword extends BallisticMeleeWeapon
	config(BallisticProV55);

const DeployRange = 256;

struct DeployableInfo
{
	var Class<Actor> dClass;
	var float WarpInTime;
	var int SpawnOffset;
	var bool CheckSlope;
	var string dDescription;
};

var DeployableInfo AltDeployable;
var Sound ShieldHitSound;
var float NextShieldCreateTime;
var Sound LoopAmbientSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	Instigator.AmbientSound = LoopAmbientSound;
	Instigator.SoundVolume = 32;
	Instigator.SoundPitch = 48;
	Instigator.SoundRadius = 128.0000000;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x91
	if(super(BallisticWeapon).PutDown())
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x9A
	if(Instigator.AmbientSound != none)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

exec function offset(int Index, int Value)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	AltDeployable.SpawnOffset = Value;
	//return;	
}

function Rotator GetSlopeRotator(Rotator deploy_rotation_yaw, Vector hit_normal)
{
	local float pitch_degrees, roll_degrees;
	local Rotator Result;

	hit_normal = hit_normal << deploy_rotation_yaw;
	pitch_degrees = (Asin(hit_normal.X) * float(180)) / 3.1415930;
	Result.Pitch = int(-pitch_degrees * float(65536 / 360));
	roll_degrees = (Asin(hit_normal.Y) * float(180)) / 3.1415930;
	Result.Roll = int(roll_degrees * float(65536 / 360));
	return Result;
	//return;	
}

function Notify_BarrierDeploy()
{
	local Actor HitActor;
	local Vector Start, End, HitNorm, HitLoc;
	local FlameSwordPreconstructor FSP;
	local Rotator SlopeInputYaw, SlopeRotation;

	// End:0x1A
	if(Level.TimeSeconds < NextShieldCreateTime)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(256));
	HitActor = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xBC
	if(HitActor == none)
	{
		HitActor = Trace(HitLoc, HitNorm, End - vect(0.0000000, 0.0000000, 256.0000000), End, true);
	}
	// End:0x121
	if((WrenchDeployable(HitActor) != none) && WrenchDeployable(HitActor).OwningController == Instigator.Controller)
	{
		WrenchDeployable(HitActor).bWarpOut = true;
		WrenchDeployable(HitActor).GotoState('Destroying');
		return;
	}
	// End:0x19F
	if((HitActor == none) || !HitActor.bWorldGeometry)
	{
		Instigator.ClientMessage("Must target an unoccupied surface.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x1FE
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("Out of range.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	SlopeInputYaw.Yaw = Instigator.Rotation.Yaw;
	SlopeRotation = GetSlopeRotator(SlopeInputYaw, HitNorm);
	Start = HitLoc + HitNorm;
	// End:0x2E3
	if(!SpaceToDeploy(HitLoc, HitNorm, SlopeRotation, AltDeployable.dClass.default.CollisionHeight, AltDeployable.dClass.default.CollisionRadius))
	{
		Instigator.ClientMessage("Insufficient space for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	SlopeRotation.Yaw = Instigator.Rotation.Yaw;
	NextShieldCreateTime = Level.TimeSeconds + float(1);
	FSP = Spawn(Class'BWBP_OP_Pro.FlameSwordPreconstructor', Instigator,, Start + (HitNorm * AltDeployable.dClass.default.CollisionHeight), SlopeRotation);
	FSP.GroundPoint = Start + (HitNorm * (float(AltDeployable.SpawnOffset) + AltDeployable.dClass.default.CollisionHeight));
	FSP.Instigator = Instigator;
	FSP.Master = self;
	FSP.Initialize(AltDeployable.dClass, AltDeployable.WarpInTime);
	//return;	
}

function bool SpaceToDeploy(Vector hit_location, Vector hit_normal, Rotator slope_rotation, float collision_height, float collision_radius)
{
	local Vector center_point;

	center_point = hit_location + (hit_normal * collision_height);
	return ((FastTrace(center_point, center_point + (collision_radius * (vect(1.0000000, 0.0000000, 0.0000000) >> slope_rotation))) && FastTrace(center_point, center_point + (collision_radius * (vect(-1.0000000, 0.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, -1.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, 1.0000000, 0.0000000) >> slope_rotation)));
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Class<BallisticDamageType> BDT;

	// End:0x70
	if((Instigator != instigatedBy) && Class<BallisticDamageType>(DamageType) != none)
	{
		BDT = Class<BallisticDamageType>(DamageType);
		// End:0x70
		if(BDT.static.IsDamage(",Flame,"))
		{
			Damage = 0;
			PlaySound(ShieldHitSound, 0);
			Momentum = vect(0.0000000, 0.0000000, 0.0000000);
		}
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float SuggestAttackStyle()
{
	return 1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
	//return;	
}

defaultproperties
{
	AltDeployable=(dClass=Class'BWBP_OP_Pro.FlameSwordBarrier',WarpInTime=0.0010000,SpawnOffset=18,CheckSlope=false,dDescription="A five-second barrier of infinite durability.")
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	LoopAmbientSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FireLoop'
	BlockIdleAnim="bLock"
	SpecialInfo[0]=(Id="EvoDefs",Info="420.0;20.0;-999.0;-1.0;-999.0;0.9;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.FlameSwordWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.FlameSwordWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.FlameSwordWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.FlameSwordWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.FlameSword.BWsword_icon_512'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Equip',Volume=0.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Unequip',Volume=0.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.PentagramOutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.PentagramInA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=104,B=0,A=160),Color2=(R=255,G=169,B=0,A=67),StartSize1=91,StartSize2=96)
	MeleeFireClass=Class'BWBP_OP_Pro.FlameSwordMeleeFire'
	ManualLines[0]="Swings the sword. Inflicts heavy damage and has a long range and wide swing arc."
	ManualLines[1]="Creates a temporary barrier to block all incoming shots, but temporarily removes your hazard shielding."
	ManualLines[2]="Passively grants immunity to fire damage."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.FlameSwordPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.FlameSwordSecondaryFire'
	SelectAnim="PulloutFancy"
	SelectAnimRate=1.2500000
	PutDownTime=0.5000000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bMeleeWeapon=true
	Description="During Operation: Chalkboard Firefly, UTC troopers had discovered a strange sword being developed in secret in an underground arctic facility by an unknown manufacturer. While having the appearance of a Medieval arming sword, the blade itself seems to be made out of a strange nano-material, and is covered in a bright fire when held. UTC scientists have yet to find out more about the weapon due to resources being tight due to fighting the Skrith. However what has been found is this weapon was intended to be some sort of psionic enhancing focii, capable of shielding the user from explosions and flames alike."
	Priority=12
	HudColor=(R=255,G=50,B=0,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=5
	PickupClass=Class'BWBP_OP_Pro.FlameSwordPickup'
	PlayerViewOffset=(X=5.0000000,Y=2.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.FlameSwordAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.FlameSword.BWsword_icon_128'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="PSI-56 Fire Sword"
	Mesh=SkeletalMesh'BWBP_OP_Anim.FlameSword_FPm'
	DrawScale=0.3000000
	SoundRadius=32.0000000
}
