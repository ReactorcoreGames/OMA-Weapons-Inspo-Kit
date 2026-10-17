class ShockBeamEffect extends xEmitter;

var Vector HitNormal;
var Class<ShockBeamCoil> CoilClass;
var Class<ShockMuzFlash> MuzFlashClass;
var Class<ShockMuzFlash3rd> MuzFlash3Class;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		HitNormal;
}

function AimAt(Vector hl, Vector hn)
{
	HitNormal = hn;
	mSpawnVecA = hl;
	// End:0x35
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SpawnEffects();
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x16
	if(int(Role) < int(ROLE_Authority))
	{
		SpawnEffects();
	}
	//return;	
}

simulated function SpawnImpactEffects(Rotator HitRot, Vector EffectLoc)
{
	Spawn(Class'XEffects.ShockImpactFlare',,, EffectLoc, HitRot);
	Spawn(Class'XEffects.ShockImpactRing',,, EffectLoc, HitRot);
	Spawn(Class'XEffects.ShockImpactScorch',,, EffectLoc, Rotator(-HitNormal));
	Spawn(Class'XEffects.ShockExplosionCore',,, EffectLoc + (HitNormal * float(8)), HitRot);
	//return;	
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
	return !P.BeyondViewDistance(SpawnLocation, 3000.0000000);
	//return;	
}

simulated function SpawnEffects()
{
	local ShockBeamCoil Coil;
	local xWeaponAttachment Attachment;

	// End:0x14E
	if(Instigator != none)
	{
		// End:0x95
		if(Instigator.IsFirstPerson())
		{
			// End:0x72
			if((Instigator.Weapon != none) && Instigator.Weapon.Instigator == Instigator)
			{
				SetLocation(Instigator.Weapon.GetEffectStart());				
			}
			else
			{
				SetLocation(Instigator.Location);
			}
			Spawn(MuzFlashClass,,, Location);			
		}
		else
		{
			Attachment = xPawn(Instigator).WeaponAttachment;
			// End:0xF6
			if((Attachment != none) && (Level.TimeSeconds - Attachment.LastRenderTime) < float(1))
			{
				SetLocation(Attachment.GetTipLocation());				
			}
			else
			{
				SetLocation((Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (Normal(mSpawnVecA - Instigator.Location) * 25.0000000));
			}
			Spawn(MuzFlash3Class);
		}
	}
	// End:0x1A2
	if((EffectIsRelevant(mSpawnVecA + (HitNormal * float(2)), false)) && HitNormal != vect(0.0000000, 0.0000000, 0.0000000))
	{
		SpawnImpactEffects(Rotator(HitNormal), mSpawnVecA + (HitNormal * float(2)));
	}
	// End:0x26E
	if((((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && VSize(Location - mSpawnVecA) > float(40)) && !Level.GetLocalPlayerController().BeyondViewDistance(Location, 0.0000000)) || (Instigator != none) && Instigator.IsFirstPerson())
	{
		Coil = Spawn(CoilClass,,, Location, Rotation);
		// End:0x26E
		if(Coil != none)
		{
			Coil.mSpawnVecA = mSpawnVecA;
		}
	}
	//return;	
}

defaultproperties
{
	CoilClass=Class'XEffects.ShockBeamCoil'
	MuzFlashClass=Class'XEffects.ShockMuzFlash'
	MuzFlash3Class=Class'XEffects.ShockMuzFlash3rd'
	mParticleType=6
	mMaxParticles=3
	mLifeRange=0.7500000
	mRegenDist=150.0000000
	mSizeRange[0]=24.0000000
	mSizeRange[1]=48.0000000
	mAttenKa=0.1000000
	bReplicateInstigator=true
	bReplicateMovement=false
	RemoteRole=2
	NetPriority=3.0000000
	LifeSpan=0.7500000
	Texture=Texture'XWeapons_rc.Effects.ShockBeamTex'
	Skins[0]=Texture'XWeapons_rc.Effects.ShockBeamTex'
	Style=6
}
