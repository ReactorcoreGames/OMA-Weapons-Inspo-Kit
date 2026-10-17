class XOXOAttachment extends BallisticAttachment;

var bool bStreamOn;
var XOXOStreamEffect StreamEffect;
var Sound StreamAmbientSound;
var Actor LockedTarget;
var Actor HeartGlow;
var Emitter LoveEffect;
var Emitter ShockwaveEffect;
var bool bLoveMode;
var bool bOldLoveMode;
var bool bShockwave;
var bool bOldShockwave;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		StreamEffect, bShockwave;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && !bNetOwner)
		bLoveMode;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x5C
	if((int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeartGlow, Class'BWBP_OP_Pro.XOXOCoverGlow', DrawScale, self, 'HeartGlow');
	}
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x24
	if(bShockwave != bOldShockwave)
	{
		bOldShockwave = bShockwave;
		Shockwave3rd();
	}
	// End:0xB4
	if(bLoveMode != bOldLoveMode)
	{
		bOldLoveMode = bLoveMode;
		// End:0x9A
		if(bLoveMode)
		{
			LoveEffect = Spawn(Class'BWBP_OP_Pro.XOXOLoveModeGlow', Instigator,, Instigator.Location, Instigator.Rotation);
			// End:0x97
			if(LoveEffect != none)
			{
				LoveEffect.SetBase(Instigator);
			}			
		}
		else
		{
			// End:0xB4
			if(LoveEffect != none)
			{
				LoveEffect.Kill();
			}
		}
	}
	super.PostNetReceive();
	//return;	
}

function StartStream()
{
	bStreamOn = true;
	AmbientSound = StreamAmbientSound;
	Instigator.bAlwaysRelevant = true;
	bAlwaysRelevant = true;
	// End:0xF1
	if(StreamEffect == none)
	{
		StreamEffect = Spawn(Class'BWBP_OP_Pro.XOXOStreamEffect', self);
		StreamEffect.SetLocation(GetBoneCoords('tip2').Origin);
		StreamEffect.SetBase(self);
		// End:0xAA
		if(XOXOStaff(Instigator.Weapon) != none)
		{
			XOXOStaff(Instigator.Weapon).StreamEffect = StreamEffect;
		}
		StreamEffect.Instigator = Instigator;
		StreamEffect.Target = LockedTarget;
		StreamEffect.StaffAttachment = self;
		StreamEffect.UpdateEndpoint();
	}
	//return;	
}

function EndStream()
{
	bStreamOn = false;
	AmbientSound = none;
	Instigator.bAlwaysRelevant = Instigator.default.bAlwaysRelevant;
	bAlwaysRelevant = false;
	LockedTarget = none;
	// End:0x6F
	if(StreamEffect != none)
	{
		StreamEffect.bTearOff = true;
		StreamEffect.Kill();
		StreamEffect = none;
	}
	//return;	
}

function SetLockedTarget(Actor NewTarget)
{
	LockedTarget = NewTarget;
	// End:0x2A
	if(StreamEffect != none)
	{
		StreamEffect.Target = NewTarget;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x1A
	if(StreamEffect != none)
	{
		StreamEffect.Kill();
	}
	// End:0x31
	if(HeartGlow != none)
	{
		HeartGlow.Destroy();
	}
	// End:0x4B
	if(LoveEffect != none)
	{
		LoveEffect.Kill();
	}
	super.Destroyed();
	//return;	
}

simulated function Shockwave3rd()
{
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		bShockwave = !bShockwave;
	}
	// End:0x6B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ShockwaveEffect = Spawn(Class'BWBP_OP_Pro.IE_XOXOShockwave', Instigator,, Instigator.Location);
		ShockwaveEffect.SetBase(Instigator);
	}
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x63
	if((StreamEffect != none) && !Instigator.IsFirstPerson())
	{
		StreamEffect.SetLocation(GetBoneCoords('tip2').Origin);
	}
	//return;	
}

defaultproperties
{
	StreamAmbientSound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Stream'
	WeaponClass=Class'BWBP_OP_Pro.XOXOStaff'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	MeleeImpactManager=Class'BallisticProV55.IM_A73Knife'
	WeaponLightTime=0.2000000
	BrassMode=3
	InstantMode=1
	ReloadAnim="Reload_MG"
	ReloadAnimRate=2.0000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.XOXO_TPm'
	DrawScale=0.2800000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=512.0000000
}
