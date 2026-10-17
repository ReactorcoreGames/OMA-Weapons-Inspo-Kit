class ONSPRVSideGun extends ONSWeapon
	notplaceable;

var Class<ShockBeamEffect> BeamEffectClass;
var ONSSkyMine ComboTarget;
var float MinAim;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flash');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.purple_line');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_ring_a');
	L.AddPrecacheMaterial(Texture'XWeapons_rc.Effects.ShockBeamTex');
	L.AddPrecacheMaterial(Texture'XEffects.SaDScorcht');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core_low');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_Energy_green_faded');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.EclipseCircle');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flash');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.purple_line');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_ring_a');
	Level.AddPrecacheMaterial(Texture'XWeapons_rc.Effects.ShockBeamTex');
	Level.AddPrecacheMaterial(Texture'XEffects.SaDScorcht');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core_low');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_Energy_green_faded');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.EclipseCircle');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

function byte BestMode()
{
	local Bot B;

	// End:0x9E
	if((ComboTarget != none) && Vehicle(Instigator).bWeaponisAltFiring)
	{
		B = Bot(Instigator.Controller);
		// End:0x98
		if((((B == none) || B.Enemy == none) || B.Enemy != B.Target) || B.EnemyVisible())
		{
			return 1;
		}
		return 0;		
	}
	else
	{
		return 0;
	}
	//return;	
}

function Rotator AdjustAim(bool bAltFire)
{
	// End:0x2E
	if(bAltFire && ComboTarget != none)
	{
		return Rotator(ComboTarget.Location - WeaponFireLocation);
	}
	return super.AdjustAim(bAltFire);
	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	local ShockBeamEffect Beam;

	Beam = Spawn(BeamEffectClass,,, Start, Dir);
	Beam.Instigator = none;
	Beam.AimAt(HitLocation, HitNormal);
	//return;	
}

function SetComboTarget(ONSSkyMine S)
{
	// End:0x3A
	if((Bot(Instigator.Controller) == none) || Instigator.Controller.Enemy == none)
	{
		return;
	}
	ComboTarget = S;
	ComboTarget.Monitor(Bot(Instigator.Controller).Enemy);
	//return;	
}

function DoCombo()
{
	// End:0x4B
	if((Vehicle(Instigator) != none) && Instigator.Controller != none)
	{
		Instigator.StopWeaponFiring();
		Vehicle(Instigator).bWeaponisAltFiring = true;
	}
	//return;	
}

state InstantFireMode
{
	simulated function ClientSpawnHitEffects()
	{
		//return;		
	}

	function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
	{
		//return;		
	}

	function AltFire(Controller C)
	{
		local float CurAim, bestAim;
		local int X;
		local Projectile BestMine;

		ShakeView();
		FlashMuzzleFlash();
		// End:0x27
		if(AmbientEffectEmitter != none)
		{
			AmbientEffectEmitter.SetEmitterStatus(true);
		}
		// End:0x3E
		if(bAmbientFireSound)
		{
			AmbientSound = FireSoundClass;			
		}
		else
		{
			PlayOwnedSound(AltFireSoundClass, 0, AltFireSoundVolume / 255.0000000,, AltFireSoundRadius,, false);
		}
		bestAim = MinAim;
		X = 0;
		J0x71:

		// End:0x109 [Loop If]
		if(X < Projectiles.Length)
		{
			// End:0xA8
			if(Projectiles[X] == none)
			{
				Projectiles.Remove(X, 1);
				X--;
				// [Explicit Continue]
				goto J0xFF;
			}
			CurAim = Normal(Projectiles[X].Location - WeaponFireLocation) Dot Vector(WeaponFireRotation);
			// End:0xFF
			if(CurAim > bestAim)
			{
				BestMine = Projectiles[X];
				bestAim = CurAim;
			}
			J0xFF:

			X++;
			// [Loop Continue]
			goto J0x71;
		}
		// End:0x139
		if(BestMine != none)
		{
			TraceFire(WeaponFireLocation, Rotator(BestMine.Location - WeaponFireLocation));			
		}
		else
		{
			TraceFire(WeaponFireLocation, WeaponFireRotation);
		}
		//return;		
	}

	function Fire(Controller C)
	{
		local ONSSkyMine S;

		S = ONSSkyMine(SpawnProjectile(ProjectileClass, false));
		// End:0x48
		if((S != none) && Bot(Instigator.Controller) != none)
		{
			SetComboTarget(S);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	BeamEffectClass=Class'XWeapons.ShockBeamEffect'
	MinAim=0.9250000
	YawBone="SIDEgunBASE"
	PitchBone="SIDEgunBARREL"
	PitchUpLimit=8000
	PitchDownLimit=62500
	WeaponFireAttachmentBone="Firepoint"
	GunnerAttachmentBone="SideGunnerLocation"
	bInstantRotation=true
	bInstantFire=true
	bDoOffsetTrace=true
	RedSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVredSHAD'
	BlueSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVshad'
	FireInterval=0.4000000
	AltFireInterval=0.7500000
	FlashEmitterClass=Class'Onslaught.ONSPRVSideGunMuzzleFlash'
	FireSoundClass=Sound'ONSVehicleSounds-S.PRV.PRVFire01'
	AltFireSoundClass=Sound'ONSVehicleSounds-S.PRV.PRVFire02'
	FireForce="PRVSideFire"
	AltFireForce="PRVSideAltFire"
	DamageType=Class'Onslaught.DamTypePRVLaser'
	DamageMin=25
	DamageMax=25
	ProjectileClass=Class'Onslaught.ONSSkyMine'
	ShakeRotMag=(X=60.0000000,Y=20.0000000,Z=0.0000000)
	ShakeRotRate=(X=1000.0000000,Y=1000.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	AIInfo[0]=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.2000000,RefireRate=1.0000000)
	AIInfo[1]=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=true,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.0000000)
	CullDistance=6000.0000000
	Mesh=SkeletalMesh'ONSWeapons-A.PRVsideGun'
	DrawScale=0.8000000
}
