class ProtonStreamAttachment extends BallisticAttachment;

var bool bStreamOn;
var bool bUseAlt;
var ProtonStreamEffect StreamEffect;
var Sound StreamAmbientSound;
var Sound StreamAmbientSoundAlt;
var Actor LockedTarget;
var Actor Pack;
var byte ModeColor;
var Actor BoostMuzzleFlash;
var Class<BallisticEmitter> BoostMuzzleFlashClass;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ModeColor, StreamEffect;
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
	Pack = Spawn(Class'BWBP_OP_Pro.ProtonStreamPack');
	// End:0x3F
	if(Instigator.GetTeamNum() == 1)
	{
		Pack.Skins[0] = Shader'BWBP_OP_Tex.ProtonPack.proton_pack_SH_1';
	}
	// End:0x63
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
	// End:0x12D
	if(StreamEffect == none)
	{
		// End:0x6D
		if(!bUseAlt)
		{
			StreamEffect = Spawn(Class'BWBP_OP_Pro.ProtonStreamEffect', self);			
		}
		else
		{
			StreamEffect = Spawn(Class'BWBP_OP_Pro.ProtonStreamEffectAlt', self);
		}
		StreamEffect.SetAltColor(bool(ModeColor));
		StreamEffect.SetLocation(GetBoneCoords('tip2').Origin);
		StreamEffect.SetBase(self);
		// End:0xF6
		if(ProtonStreamer(Instigator.Weapon) != none)
		{
			ProtonStreamer(Instigator.Weapon).StreamEffect = StreamEffect;
		}
		StreamEffect.Instigator = Instigator;
		StreamEffect.Target = LockedTarget;
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
	StreamEffect.Target = NewTarget;
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
	//return;	
}

defaultproperties
{
	StreamAmbientSound=Sound'BWBP_OP_Sounds.ProtonPack.Proton-FireLoop'
	StreamAmbientSoundAlt=Sound'BWBP_OP_Sounds.ProtonPack.Proton-FireLoopAlt'
	BoostMuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitterBoost'
	WeaponClass=Class'BWBP_OP_Pro.ProtonStreamer'
	MuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitterAlt'
	ImpactManager=Class'BWBP_OP_Pro.IM_ProtonStream'
	WeaponLightTime=0.2000000
	FlashScale=0.6000000
	BrassMode=3
	InstantMode=2
	FlashMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.7000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.ProtonPack_TPm'
	DrawScale=0.7000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=512.0000000
}
