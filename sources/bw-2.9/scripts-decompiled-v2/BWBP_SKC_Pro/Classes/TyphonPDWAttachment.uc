class TyphonPDWAttachment extends BallisticAttachment;

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
	// End:0x52
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		InstantFireEffects(FiringMode);
		FlashMuzzleFlash(FiringMode);
		FlashWeaponLight(FiringMode);
		PlayPawnFiring(FiringMode);
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
	WeaponClass=Class'BWBP_SKC_Pro.TyphonPDW'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.TyphonPDWFlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LS14Impacted'
	FlashScale=0.1000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_PUMA'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_PulseFast'
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FlyBy',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9750000
	CockAnimRate=0.8500000
	bHeavy=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Typhon_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.5500000
}
