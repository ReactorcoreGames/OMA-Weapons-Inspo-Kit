class APodCapsule extends BallisticHandGrenade
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var() float AdrenalineAmount;
var() Sound HealSound;

function DoExplosion()
{
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

function Notify_AdrenSelf()
{
	PlaySound(HealSound, 3);
	xPawn(Owner).Controller.AwardAdrenaline(AdrenalineAmount);
	Ammo[0].UseAmmo(1, true);
	//return;	
}

function Notify_AdrenOther()
{
	Log("In AdrenOther");
	PlaySound(HealSound, 3);
	Ammo[0].UseAmmo(1, true);
	APodSecondaryFire(bFireMode[1]).NotifiedDoFireEffect();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	//return;	
}

function ServerStartReload(optional byte i)
{
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	//return;	
}

defaultproperties
{
	AdrenalineAmount=15.0000000
	HealSound=Sound'BW_Core_WeaponSound.Health.AdrenalinPickup'
	GrenadeSmokeClass=Class'BallisticProV55.NRP57Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50CamDie',Volume=0.0000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	PinBone="None"
	ClipBone="None"
	SmokeBone="None"
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;5.0;-999.0;25.0;-999.0;0.0;0.5")
	ParamsClasses[0]=Class'BWBP_SWC_Pro.ApodCapsuleWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.ApodCapsuleWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=0,B=255,A=128),Color2=(R=128,G=128,B=200,A=212),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Grenade=true
	FireModeClass[0]=Class'BWBP_SWC_Pro.APodSecondaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.APodSecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	bShowChargingBar=false
	Description="A-Pod Electro Adrenaline Discharge Capsule||Manufacturer: UTC Defense Tech. The UTC has long required its soldiers to use adrenaline pods in order to stay alert and focused. The most common ''A-Pod'' has proven to be fairly safe, with no known short-term side effects. The capsule can be thrown to allies, or it can be applied directly (in which case slightly more adrenaline enters the recipient's system)."
	Priority=124
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=20
	PickupClass=Class'BWBP_SWC_Pro.APodPickup'
	PlayerViewOffset=(X=3.0000000,Y=10.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	BobDamping=1.0000000
	AttachmentClass=Class'BWBP_SWC_Pro.APodAttachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A-Pod Capsule"
	DrawScale=0.4000000
}
