class ShockAttachment extends xWeaponAttachment;

var Class<xEmitter> MuzFlashClass;
var xEmitter MuzFlash;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0xAF
	if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		// End:0x7C
		if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			Skins[1] = FinalBlend'UT2004Weapons.Shaders.RedShockFinal';			
		}
		else
		{
			// End:0xAF
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
			{
				Skins[1] = FinalBlend'UT2004Weapons.Shaders.BlueShockFinal';
			}
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(MuzFlash != none)
	{
		MuzFlash.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Rotator R;

	// End:0xAA
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x3E
		if(int(FiringMode) == 0)
		{
			WeaponLight();			
		}
		else
		{
			// End:0x67
			if(MuzFlash == none)
			{
				MuzFlash = Spawn(MuzFlashClass);
				AttachToBone(MuzFlash, 'tip');
			}
			// End:0xAA
			if(MuzFlash != none)
			{
				MuzFlash.mStartParticles++;
				R.Roll = Rand(65536);
				SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	MuzFlashClass=Class'XEffects.ShockProjMuzFlash3rd'
	LightType=1
	LightEffect=13
	LightHue=200
	LightSaturation=70
	LightBrightness=255.0000000
	LightRadius=4.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'NewWeapons2004.NewShockRifle_3rd'
	RelativeLocation=(X=-3.0000000,Y=-5.0000000,Z=-10.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	Skins[0]=Texture'UT2004Weapons.NewWeaps.ShockRifleTex0'
	Skins[1]=FinalBlend'UT2004Weapons.Shaders.PurpleShockFinal'
}
