class X3Knife extends BallisticMeleeWeapon
	config(BallisticProV55);

var bool bThrowingKnife;
var() name KnifeBackAnim;
var() name KnifeThrowAnim;
var float NextThrowTime;

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x32
	if((Anim == 'PrepThrow') && bThrowingKnife)
	{
		return;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x49
	if(((Instigator.bNoWeaponFiring || (AmmoAmount(0)) < 2) || Level.TimeSeconds < NextThrowTime) || bThrowingKnife)
	{
		return;
	}
	PlayAnim('PrepThrow');
	bThrowingKnife = true;
	ServerWeaponSpecial(i);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bThrowingKnife = true;
	//return;	
}

simulated exec function WeaponSpecialRelease(optional byte i)
{
	// End:0x37
	if((!bThrowingKnife || (AmmoAmount(0)) < 2) || Level.TimeSeconds < NextThrowTime)
	{
		return;
	}
	PlaySound(Sound'BW_Core_WeaponSound.Knife.KnifeThrow',, 1.0000000,, 256.0000000);
	// End:0x72
	if(int(Level.NetMode) == int(NM_Client))
	{
		PlayAnim('Throw', 1.5000000);
	}
	ServerWeaponSpecialRelease(i);
	//return;	
}

function ServerWeaponSpecialRelease(optional byte i)
{
	PlayAnim('Throw');
	//return;	
}

simulated function Notify_X3Throw()
{
	ThrowKnife();
	SetBoneScale(0, 0.0000000, 'Knife');
	//return;	
}

simulated function ThrowKnife()
{
	bThrowingKnife = false;
	NextThrowTime = Level.TimeSeconds + 0.6000000;
	// End:0x45
	if(int(Role) == int(ROLE_Authority))
	{
		ConsumeAmmo(0, 1.0000000);
		DoFireEffect();
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator RAim;
	local Actor Other;
	local Projectile proj;

	GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = Start + (X * float(10));
	// End:0x88
	if(!WeaponCentered())
	{
		StartTrace = (StartTrace + ((hand * Y) * float(10))) + (Z * float(0));
	}
	RAim = bFireMode[0].GetFireAim(StartTrace);
	RAim = Rotator(bFireMode[0].GetFireSpread() >> RAim);
	End = Start + (Vector(RAim) * float(2000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x11F
	if(Other != none)
	{
		RAim = Rotator(HitLocation - StartTrace);
	}
	proj = Spawn(Class'BallisticProV55.X3Projectile',,, StartTrace, RAim);
	proj.Instigator = Instigator;
	//return;	
}

simulated function Notify_X3OutOfSight()
{
	SetBoneScale(0, 1.0000000, 'Knife');
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
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-999.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.X3WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.X3WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.X3WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.X3WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_X3'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.1090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.1090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=192),Color2=(R=255,G=255,B=255,A=192),StartSize1=103,StartSize2=87)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Slashes with the knife. Short range and less damage than other melee weapons."
	ManualLines[1]="Prepared slash. Gains damage over hold time (maximum bonus reached after 1.5 seconds). Deals more damage from behind."
	ManualLines[2]="The Weapon Function key throws a knife, dealing good damage. Thrown knives have a very short range."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.X3PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.X3SecondaryFire'
	SelectAnimRate=2.0000000
	PutDownTime=0.2000000
	BringUpTime=0.2000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bMeleeWeapon=true
	bShowChargingBar=false
	Description="The X3 was first designed years ago by Enravion, for the UTC Commando Corps. After the first several years of the Skrith invasion, the humans realised the advantages to melee weapons, seeing how efficeintly the aliens used them. The X3's excellent durability is legendary in the UTC armies and its razor sharp blade a fear among the Skrith invaders. Commando units swear by it and it is now standard issue for all UTC soldeirs following it's success in the first Human-Skrith war."
	Priority=9
	HudColor=(R=200,G=200,B=255,A=255)
	SmallViewOffset=(X=1.0400000,Y=7.0000000,Z=-8.0000000)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	PickupClass=Class'BallisticProV55.X3Pickup'
	PlayerViewOffset=(X=2.7500000,Y=7.0000000,Z=-8.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=32768,Roll=0)
	AttachmentClass=Class'BallisticProV55.X3Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_X3'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="X3 Knife"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.X3_FPm'
	DrawScale=0.3000000
}
