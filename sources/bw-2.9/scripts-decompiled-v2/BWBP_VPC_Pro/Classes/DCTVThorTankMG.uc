class DCTVThorTankMG extends ONSTankSecondaryTurret;

state InstantFireMode
{
	simulated function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
	{
		local PlayerController PC;

		PC = Level.GetLocalPlayerController();
		// End:0x1FE
		if((PC != none) && ((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - HitLocation) < float(5000))
		{
			// End:0xA8
			if(Vehicle(HitActor) != none)
			{
				Class'BallisticProV55.IM_BigBullet'.static.StartSpawn(HitLocation, HitNormal, 3, PC);				
			}
			else
			{
				Class'BallisticProV55.IM_BigBullet'.static.StartSpawn(HitLocation, HitNormal, 0, PC);
			}
			// End:0x1FE
			if(!Level.bDropDetail && int(Level.DetailMode) != int(0))
			{
				// End:0x163
				if(Base != none)
				{
					Base.bTraceWater = true;
					HitActor = Base.Trace(HitLocation, HitNormal, HitLocation, Location + (float(200) * Normal(HitLocation - Location)), true);
					Base.bTraceWater = false;					
				}
				else
				{
					bTraceWater = true;
					HitActor = Trace(HitLocation, HitNormal, HitLocation, Location + (float(200) * Normal(HitLocation - Location)), true);
					bTraceWater = false;
				}
				// End:0x1FE
				if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
				{
					Spawn(Class'XGame.BulletSplash',,, HitLocation, rot(16384, 0, 0));
				}
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	YawBone="MGStand"
	PitchBone="MG"
	WeaponFireAttachmentBone="MuzzleMG"
	WeaponFireOffset=0.0000000
	DualFireOffset=0.0000000
	RotationsPerSecond=1.0000000
	bInstantRotation=false
	bAmbientFireSound=false
	RedSkin=Texture'BWBP_Vehicles_Tex.ThorTank.MG'
	BlueSkin=Texture'BWBP_Vehicles_Tex.ThorTank.MG'
	FireInterval=0.1500000
	EffectEmitterClass=Class'BWBP_VPC_Pro.DCTVMGFlash'
	AmbientEffectEmitterClass=none
	FireSoundClass=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankMG'
	FireSoundVolume=512.0000000
	DamageType=Class'BWBP_VPC_Pro.DT_ThorTankMG'
	DamageMin=30
	DamageMax=40
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.ThorTankMG'
}
