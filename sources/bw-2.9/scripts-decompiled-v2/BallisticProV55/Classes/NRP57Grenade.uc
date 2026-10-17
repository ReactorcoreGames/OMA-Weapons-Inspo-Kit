class NRP57Grenade extends BallisticHandGrenade
	config(BallisticProV55);

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
	HeldDamage=250
	HeldRadius=450
	HeldMomentum=75000
	HeldDamageType=Class'BallisticProV55.DTNRP57Held'
	GrenadeSmokeClass=Class'BallisticProV55.NRP57Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;5.0;0.25;30.0;0.0;0.0;0.4")
	ParamsClasses[0]=Class'BallisticProV55.NRP57WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.NRP57WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.NRP57WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.NRP57WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_NRP57'
	BigIconCoords=(X1=0,Y1=16,X2=511,Y2=245)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=119,B=0,A=192),Color2=(R=255,G=255,B=0,A=192),StartSize1=112,StartSize2=110)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws a grenade overarm. The grenade will explode after 3 seconds, dealing high damage in a wide radius."
	ManualLines[1]="As primary, except the grenade is rolled underarm."
	ManualLines[2]="As with all grenades, Weapon Function or Reload can be used to release the clip and cook the grenade in the user's hand. Care must be taken not to overcook the grenade, lest the user be blown up. The NRP-57 grenade is effective on the move or against static positions."
	FireModeClass[0]=Class'BallisticProV55.NRP57PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.NRP57SecondaryFire'
	SelectAnimRate=2.2500000
	PutDownAnimRate=2.0000000
	PutDownTime=0.7000000
	BringUpTime=0.7500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="One of Black & Wood's most famous devices, the versatile NRP57 is a UTC favourite. Once the pin is pulled, it can be held ready as long as needed. The longer it is held, the further it will be thrown. The 3 second timer can be shortened by releasing the clip prior to throwing, but this greatly increases the risk of termination. The NRP57 is an effective tool which can be bounced around corners, lobbed over obstacles and has a high damage and a decent radius of effect, but it's true power lies in the soldier's ability to time the detonation and speed according to the distance of the target. The most famous story involving the Pineapple tells how the UTC Phobos Marines painted it yellow and rigged it for the unsuspecting Skrith who had, over the decades, developed an incredible taste for the terran fruit."
	Priority=7
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BallisticProV55.NRP57Pickup'
	PlayerViewOffset=(X=0.9500000,Y=7.5000000,Z=-9.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BallisticProV55.NRP57Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_NRP57'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="NRP-57 'Pineapple'"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.NRP57_FPm'
	DrawScale=0.3000000
}
