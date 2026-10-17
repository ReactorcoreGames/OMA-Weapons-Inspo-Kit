class FP7Grenade extends BallisticHandGrenade
	config(BallisticProV55);

function DoExplosionEffects()
{
	//return;	
}

function DoExplosion()
{
	local FP7FireControl F;
	local Vector V;

	// End:0xC2
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x58
		if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
		{
			V = Location;			
		}
		else
		{
			V = ThirdPersonActor.Location;
		}
		F = Spawn(Class'BallisticProV55.FP7FireControl',,, Location, rot(0, 0, 0));
		F.Instigator = Instigator;
		F.bHeld = true;
		F.Initialize();
	}
	//return;	
}

defaultproperties
{
	GrenadeSmokeClass=Class'BallisticProV55.NRP57Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;5.0;-999.0;25.0;-999.0;0.0;0.5")
	ParamsClasses[0]=Class'BallisticProV55.FP7WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.FP7WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.FP7WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.FP7WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_FP7'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=212),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws a grenade overarm. The FP7 grenade explodes into flames, igniting nearby players and obscuring their view for a short period of time. Flames cover the nearby area, dealing damage over time to players standing in them. FP7 flames will push allies of the user outwards, away from the centre of the fire."
	ManualLines[1]="As primary, except the grenade is rolled underarm."
	ManualLines[2]="As with all grenades, Weapon Function or Reload can be used to release the clip and cook the grenade in the user's hand. Care must be taken not to overcook the grenade, lest the user be incinerated. The FP7 grenade is effective in chokepoints, against static positions or when thrown at the enemy en masse."
	FireModeClass[0]=Class'BallisticProV55.FP7PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.FP7SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="A deadly hand grenade, the FP7 releases a searing blast of flames capable of melting metal with tempatures of over 7500 degrees Fahrenheit. The flames will continue to burn for a while, causing significant damage to anyone caught within the blast radius. FP7s are still widely used against both soldiers and equipment. The weapon was used extensivly during both Human-Skrith wars and is especially famous for its part in the UTC-Cryon battles where the UTC 'Ice Hogs' used it to incinerate Cryon cyborgs."
	Priority=5
	HudColor=(R=255,G=50,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=3
	PickupClass=Class'BallisticProV55.FP7Pickup'
	PlayerViewOffset=(X=0.9500000,Y=7.5000000,Z=-9.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BallisticProV55.FP7Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_FP7'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FP7 Grenade"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.FP7_FPm'
	DrawScale=0.3000000
}
