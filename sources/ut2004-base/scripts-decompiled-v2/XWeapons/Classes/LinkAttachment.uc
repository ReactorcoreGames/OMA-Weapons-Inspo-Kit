class LinkAttachment extends xWeaponAttachment;

enum ELinkColor
{
	LC_Green,                       // 0
	LC_Red,                         // 1
	LC_Blue,                        // 2
	LC_Gold                         // 3
};

var LinkMuzFlashProj3rd MuzFlash;
var int Links;
var bool bReplicateLinkColor;
var LinkAttachment.ELinkColor LinkColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Links;

	// Pos:0x00D
	reliable if(((bReplicateLinkColor && !bNetOwner) && bNetDirty) && int(Role) == int(ROLE_Authority))
		LinkColor;
}

simulated function SetLinkColor(LinkAttachment.ELinkColor NewColor)
{
	// End:0x15
	if(int(NewColor) == int(LinkColor))
	{
		return;
	}
	// End:0x37
	if(bReplicateLinkColor)
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	LinkColor = NewColor;
	// End:0x61
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		UpdateLinkColor();
	}
	//return;	
}

simulated function UpdateLinkColor()
{
	// End:0x43
	if((Instigator != none) && Instigator.Weapon != none)
	{
		LinkGun(Instigator.Weapon).UpdateLinkColor(LinkColor);
	}
	// End:0x94
	if(MuzFlash != none)
	{
		switch(LinkColor)
		{
			// End:0x73
			case 3:
				MuzFlash.Skins[0] = FinalBlend'XEffectMat.Link.LinkMuzProjYellowFB';
				// End:0x94
				break;
			// End:0x78
			case 0:
			// End:0xFFFF
			default:
				MuzFlash.Skins[0] = FinalBlend'XEffectMat.Link.LinkMuzProjGreenFB';
				// End:0x94
				break;
				break;
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

	// End:0x127
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x127
		if(int(FiringMode) == 0)
		{
			// End:0x64
			if(MuzFlash == none)
			{
				MuzFlash = Spawn(Class'XEffects.LinkMuzFlashProj3rd');
				AttachToBone(MuzFlash, 'tip');
				UpdateLinkColor();
			}
			// End:0x127
			if(MuzFlash != none)
			{
				MuzFlash.mSizeRange[0] = MuzFlash.default.mSizeRange[0] * (Class'XWeapons.LinkFire'.default.LinkScale[Min(Links, 5)] + float(1));
				MuzFlash.mSizeRange[1] = MuzFlash.mSizeRange[0];
				// End:0xE6
				if(Links > 0)
				{
					SetLinkColor(3);					
				}
				else
				{
					SetLinkColor(0);
				}
				MuzFlash.Trigger(self, none);
				R.Roll = Rand(65536);
				SetBoneRotation('bone flashA', R, 0, 1.0000000);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	bRapidFire=true
	bAltRapidFire=true
	bMatchWeapons=true
	Mesh=SkeletalMesh'NewWeapons2004.NewLinkGun_3rd'
	RelativeLocation=(X=15.0000000,Y=-5.0000000,Z=-7.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
}
