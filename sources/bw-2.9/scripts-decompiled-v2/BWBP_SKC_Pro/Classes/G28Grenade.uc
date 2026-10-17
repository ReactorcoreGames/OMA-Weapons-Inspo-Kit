class G28Grenade extends BallisticHandGrenade
	config(BallisticProV55);

simulated function DoExplosionEffects()
{
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SetBoneScale(0, 1.0000000, GrenadeBone);
	SetBoneScale(1, 1.0000000, PinBone);
	//return;	
}

simulated function DoExplosion()
{
	// End:0x16
	if(int(Role) == int(ROLE_Authority))
	{
		CheckNoGrenades();
	}
	//return;	
}

simulated function ExplodeInHand()
{
	ClipReleaseTime = 666.0000000;
	KillSmoke();
	SetBoneScale(2, 1.0000000, ClipBone);
	HandExplodeTime = Level.TimeSeconds;
	// End:0x95
	if(IsFiring())
	{
		FireMode[0].HoldTime = 0.0000000;
		FireMode[0].bIsFiring = false;
		FireMode[1].HoldTime = 0.0000000;
		FireMode[1].bIsFiring = false;		
	}
	else
	{
		FireMode[0].HoldTime = 0.0000000;
		FireMode[0].ModeDoFire();
		FireMode[0].bIsFiring = false;
	}
	// End:0xED
	if(int(Role) == int(ROLE_Authority))
	{
		DoExplosionEffects();
		MakeNoise(1.0000000);
	}
	SetTimer(0.1000000, false);
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	ClipReleaseTime = Level.TimeSeconds + 0.2000000;
	SetTimer(FuseDelay + 0.2000000, false);
	SpawnSmoke();
	bFireMode[0].EjectBrass();
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipReleaseSound);
	// End:0x74
	if(!IsFiring())
	{
		PlayAnim(ClipReleaseAnim, 1.0000000, 0.1000000);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x4B
	if(Anim == ClipReleaseAnim)
	{
		SetBoneRotation('MOACTop', rot(9192, 0, 0));
		IdleAnim = 'OpenIdle';		
	}
	else
	{
		// End:0xB7
		if((Anim == FireMode[0].FireAnim) || Anim == FireMode[1].FireAnim)
		{
			SetBoneScale(1, 1.0000000, PinBone);
			SetBoneScale(0, 1.0000000, GrenadeBone);
			CheckNoGrenades();
			IdleAnim = 'Idle';			
		}
		else
		{
			// End:0xDA
			if(Anim == SelectAnim)
			{
				IdleAnim = 'Idle';
				PlayIdle();				
			}
			else
			{
				AnimEnded(Channel, Anim, frame, Rate);
			}
		}
	}
	//return;	
}

defaultproperties
{
	FuseDelay=0.5000000
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	GrenadeBone="G28"
	SmokeBone="G28"
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;0.0;0.0;-1.0;0.0;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.G28WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.G28WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.G28WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.G28WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.G28.BigIcon_G28'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=245)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=255,A=128),Color2=(R=255,G=0,B=0,A=165),StartSize1=98,StartSize2=54)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Splash=true
	bWT_Grenade=true
	bWT_Heal=true
	ManualLines[0]="Throws a G28 grenade overarm. Upon expiry of the 1 second fuse, emits clouds of healing G28 aerosol. Nearby organics, regardless of team affiliation, will be healed."
	ManualLines[1]="As primary, except the grenade is rolled underarm."
	ManualLines[2]="Like all grenades, the grenade can be cooked in the hand. However, due to the short fuse time, this is not useful for the G28."
	FireModeClass[0]=Class'BWBP_SKC_Pro.G28PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.G28SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="The FMD G28 Medicinal Aerosol is a lightweight smoke grenade filled with various healing compounds and nano-assemblers for quick wound repair on the fly. It is a medic's best friend, and has been used to save many soldiers' lives. It has unfortunately also been the cause of a few deaths, as the grenade itself is quite heavy and can cause concussions if thrown with sufficient velocity. Surgeon General's Warning: The G28 Medicinal Aerosol is a temporary healing agent, and should not be used in place of quality medical care."
	Priority=14
	HudColor=(R=75,G=210,B=210,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=10
	PickupClass=Class'BWBP_SKC_Pro.G28Pickup'
	PlayerViewOffset=(X=16.0000000,Y=0.0000000,Z=-8.5000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_SKC_Pro.G28Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.G28.SmallIcon_G28'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FMD G28 Medicinal Aerosol"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.G28_FPm'
	DrawScale=0.3000000
}
