class ThorLCAttachment extends BallisticAttachment;

var bool bStreamOn;
var bool bUseAlt;
var bool bUseAltColor;
var ThorLCStreamEffectNew StreamEffect;
var ThorLCStreamEffectChild StreamEffectChild;
var Sound StreamAmbientSound;
var Sound StreamAmbientSoundAlt;
var Actor LockedTarget;
var Actor Pack;
var byte ModeColor;
var Vector EndEffect;
var Actor BoostMuzzleFlash;
var Class<BallisticEmitter> BoostMuzzleFlashClass;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ModeColor, StreamEffect, 
		StreamEffectChild;
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x9D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xB8
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x1D3
	if(int(Mode) != 0)
	{
		// End:0x14C
		if((int(ModeColor) == 0) && AltMuzzleFlashClass != none)
		{
			// End:0x115
			if(AltMuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
			}
			AltMuzzleFlash.Trigger(self, Instigator);
			// End:0x149
			if(bRandomFlashRoll)
			{
				SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
			}			
		}
		else
		{
			// End:0x1D0
			if((int(ModeColor) != 0) && BoostMuzzleFlashClass != none)
			{
				// End:0x19C
				if(AltMuzzleFlash == none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BoostMuzzleFlash, BoostMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
				}
				BoostMuzzleFlash.Trigger(self, Instigator);
				// End:0x1D0
				if(bRandomFlashRoll)
				{
					SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
				}
			}
		}		
	}
	else
	{
		// End:0x257
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x223
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x257
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x31
	if(Instigator.GetTeamNum() == 1)
	{
		Pack.Skins[0] = Shader'BWBP_OP_Tex.ProtonPack.proton_pack_SH_1';
	}
	// End:0x55
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	//return;	
}

function StartStream()
{
	bStreamOn = true;
	// End:0x21
	if(!bUseAlt)
	{
		AmbientSound = StreamAmbientSound;		
	}
	else
	{
		AmbientSound = StreamAmbientSoundAlt;
	}
	Instigator.bAlwaysRelevant = true;
	bAlwaysRelevant = true;
	// End:0x11E
	if(StreamEffect == none)
	{
		// End:0x6D
		if(!bUseAlt)
		{
			StreamEffect = Spawn(Class'BWBP_APC_Pro.ThorLCStreamEffectNew', self);			
		}
		else
		{
			StreamEffect = Spawn(Class'BWBP_APC_Pro.ThorLCStreamEffectNewAlt', self);
		}
		StreamEffect.bAltColor = bUseAltColor;
		StreamEffect.SetLocation(GetBoneCoords('tip2').Origin);
		StreamEffect.SetBase(self);
		// End:0xF6
		if(ThorLightningCannon(Instigator.Weapon) != none)
		{
			ThorLightningCannon(Instigator.Weapon).StreamEffect = StreamEffect;
		}
		StreamEffect.Instigator = Instigator;
		StreamEffect.LinkedPawn = LockedTarget;
	}
	// End:0x1F7
	if(StreamEffectChild == none)
	{
		// End:0x146
		if(!bUseAlt)
		{
			StreamEffectChild = Spawn(Class'BWBP_APC_Pro.ThorLCStreamEffectChild', self);			
		}
		else
		{
			StreamEffectChild = Spawn(Class'BWBP_APC_Pro.ThorLCStreamEffectChildAlt', self);
		}
		StreamEffectChild.bAltColor = bUseAltColor;
		StreamEffectChild.SetLocation(GetBoneCoords('tip2').Origin);
		StreamEffectChild.SetBase(self);
		// End:0x1CF
		if(ThorLightningCannon(Instigator.Weapon) != none)
		{
			ThorLightningCannon(Instigator.Weapon).StreamEffectChild = StreamEffectChild;
		}
		StreamEffectChild.Instigator = Instigator;
		StreamEffectChild.LinkedPawn = LockedTarget;
	}
	//return;	
}

function EndStream()
{
	bStreamOn = false;
	AmbientSound = none;
	Instigator.bAlwaysRelevant = false;
	bAlwaysRelevant = false;
	LockedTarget = none;
	// End:0x5E
	if(StreamEffect != none)
	{
		StreamEffect.bTearOff = true;
		StreamEffect.Destroy();
		StreamEffect = none;
	}
	// End:0x8D
	if(StreamEffectChild != none)
	{
		StreamEffectChild.bTearOff = true;
		StreamEffectChild.Destroy();
		StreamEffectChild = none;
	}
	//return;	
}

function SetLockedTarget(Actor NewTarget)
{
	LockedTarget = NewTarget;
	StreamEffect.LinkedPawn = NewTarget;
	StreamEffectChild.LinkedPawn = NewTarget;
	// End:0x98
	if((Pawn(NewTarget) != none) && Instigator.Controller.SameTeamAs(Pawn(NewTarget).Controller))
	{
		StreamEffect.bAltColor = true;
		StreamEffectChild.bAltColor = true;		
	}
	else
	{
		StreamEffect.bAltColor = false;
		StreamEffectChild.bAltColor = false;
	}
	//return;	
}

function SetUnlockedEnd(Vector NewEndEffect)
{
	EndEffect = NewEndEffect;
	StreamEffect.EndEffect = EndEffect;
	StreamEffectChild.EndEffect = EndEffect;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(StreamEffect != none)
	{
		StreamEffect.Destroy();
	}
	// End:0x2E
	if(StreamEffectChild != none)
	{
		StreamEffectChild.Destroy();
	}
	// End:0x45
	if(Pack != none)
	{
		Pack.Destroy();
	}
	super.Destroyed();
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
	// End:0xA0
	if((StreamEffectChild != none) && !Instigator.IsFirstPerson())
	{
		StreamEffectChild.SetLocation(GetBoneCoords('tip2').Origin);
	}
	//return;	
}

defaultproperties
{
	StreamAmbientSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-FireLoop'
	StreamAmbientSoundAlt=Sound'BWBP_OP_Sounds.ProtonPack.Proton-FireLoopAlt'
	BoostMuzzleFlashClass=Class'BWBP_APC_Pro.ThorLCFlashEmitterBoost'
	MuzzleFlashClass=Class'BWBP_APC_Pro.ThorLCFlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_APC_Pro.ThorLCFlashEmitterAlt'
	ImpactManager=Class'BWBP_OP_Pro.IM_ProtonStream'
	WeaponLightTime=0.2000000
	FlashScale=0.6000000
	BrassMode=3
	InstantMode=2
	FlashMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.7000000
	bRapidFire=true
	DrawScale=0.9000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=512.0000000
}
