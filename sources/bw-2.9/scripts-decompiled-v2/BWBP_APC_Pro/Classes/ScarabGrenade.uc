class ScarabGrenade extends BallisticHandGrenade
	config(BallisticProV55);

var() FullSound PinPushSound;

function byte BestMode()
{
	local Bot B;
	local float dist, Height, Result;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = 0.5000000;
	// End:0xD9
	if(dist > float(500))
	{
		Result -= 0.4000000;		
	}
	else
	{
		Result += 0.4000000;
	}
	// End:0x108
	if(Abs(Height) > float(32))
	{
		Result -= (Height / dist);
	}
	// End:0x11A
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function Notify_GrenadePinPush()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PinPushSound);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	PinPushSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-PutRingIn',Volume=0.0860000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCookable=false
	HeldDamage=150
	HeldRadius=350
	HeldMomentum=75000
	HeldDamageType=Class'BallisticProV55.DTNRP57Held'
	GrenadeSmokeClass=Class'BWBP_APC_Pro.ScarabTrail'
	ClipReleaseSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-Cock',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-PullRingOut',Volume=0.0760000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;5.0;0.25;30.0;0.0;0.0;0.4")
	ParamsClasses[0]=Class'BWBP_APC_Pro.ScarabWeaponParams'
	ParamsClasses[1]=Class'BWBP_APC_Pro.ScarabWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.ScarabWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.ScarabWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.Grenade.BigIcon_CruGren'
	BigIconCoords=(X1=0,Y1=16,X2=511,Y2=245)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CurrentWeaponMode=1
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=128,G=119,B=0,A=192),Color2=(R=230,G=232,B=234,A=192),StartSize1=112,StartSize2=110)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws a grenade overarm. The grenade will explode after 3 seconds, dealing high damage in a moderate radius. Grenade Clusters are also released and explode within an impact radius, increasing the radius and damage dealt"
	ManualLines[1]="As primary, except the grenade is rolled underarm."
	ManualLines[2]="As with all grenades, Weapon Function or Reload can be used to release the clip and cook the grenade in the user's hand. Care must be taken not to overcook the grenade, lest the user be blown up. The NRX-82 grenade is effective on the move or against static positions."
	FireModeClass[0]=Class'BWBP_APC_Pro.ScarabPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.ScarabSecondaryFire'
	SelectAnimRate=2.2500000
	PutDownAnimRate=2.0000000
	PutDownTime=0.7000000
	BringUpTime=0.7500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="Black and Woods has been seeing massive success during the Skrith Wars, their weapons and devices being used across the galaxy to drive back the alien hordes and even against their fellow man in some cases.  They could rest on their laurels, but they're still going strong with a sidegrade to their long-standing hand grenade. Recently unveiled is the NRX-82 Cluster Grenade, known affectionately as the ''Scarab.'' It has earned that moniker thanks to the cluster bombs it spews out after the main explosion, wiping out small crowds of Skrith or anyone in the blast zone. While it hasn't been out in the field quite yet, they're getting painted yellow to match their older models, tricking Skrith into thinking they're pineapples just like before."
	Priority=7
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_APC_Pro.ScarabPickup'
	PlayerViewOffset=(X=3.0000000,Y=10.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_APC_Pro.ScarabAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.Grenade.SmallIcon_CruGren'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="NRX-82 'Scarab' Cluster Grenade"
	Mesh=SkeletalMesh'BWBP_APC_Anim.CruGren_FPm'
	DrawScale=0.4000000
}
