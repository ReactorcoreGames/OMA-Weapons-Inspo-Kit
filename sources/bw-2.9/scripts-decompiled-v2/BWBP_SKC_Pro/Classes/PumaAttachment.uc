class PumaAttachment extends BallisticAttachment;

var ForceRing ForceRing3rd;
var PumaShieldEffect3rd PumaShieldEffect3rd;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		PumaShieldEffect3rd;
}

simulated function Destroyed()
{
	local int i;

	// End:0x17
	if(PumaShieldEffect3rd != none)
	{
		PumaShieldEffect3rd.Destroy();
	}
	// End:0x2E
	if(ForceRing3rd != none)
	{
		ForceRing3rd.Destroy();
	}
	// End:0xB0
	if((Instigator != none) && Level.TimeSeconds <= TrackEndTime)
	{
		i = 0;
		J0x5A:

		// End:0xB0 [Loop If]
		if(i < (GetTrackCount(ActiveTrack)))
		{
			Instigator.SetBoneRotation(GetTrack(ActiveTrack, i).Bone, rot(0, 0, 0), 0, 1.0000000);
			i++;
			// [Loop Continue]
			goto J0x5A;
		}
	}
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(AltMuzzleFlash);
	super.Destroyed();
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x85
	if(((Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex > 1)
	{
		PumaShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.PumaShieldEffect3rd', i.Instigator);		
	}
	else
	{
		// End:0xCA
		if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			PumaShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.PUMAShieldEffect3rdRed', i.Instigator);			
		}
		else
		{
			// End:0x10C
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
			{
				PumaShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.PumaShieldEffect3rd', i.Instigator);
			}
		}
	}
	PumaShieldEffect3rd.SetBase(i.Instigator);
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x5D
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		InstantFireEffects(FiringMode);
		FlashMuzzleFlash(FiringMode);
		FlashWeaponLight(FiringMode);
		PlayPawnFiring(FiringMode);
		EjectBrass(FiringMode);
	}
	super.ThirdPersonEffects();
	//return;	
}

function SetBrightness(int B, bool Hit)
{
	// End:0x25
	if(PumaShieldEffect3rd != none)
	{
		PumaShieldEffect3rd.SetBrightness(B, Hit);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.PumaRepeater'
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	BrassClass=Class'BWBP_SKC_Pro.Brass_PUMA'
	ReloadAnimRate=1.1000000
	bHeavy=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PUMA_TPm'
	DrawScale=0.2100000
	PrePivot=(X=2.0000000,Y=0.0000000,Z=-1.0000000)
}
