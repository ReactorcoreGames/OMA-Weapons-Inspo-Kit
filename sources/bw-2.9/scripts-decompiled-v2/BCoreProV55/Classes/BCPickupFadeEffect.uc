class BCPickupFadeEffect extends Emitter;

simulated function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x2D
	if((Owner == none) || Owner.StaticMesh == none)
	{
		Destroy();		
	}
	else
	{
		SetLocation(Owner.Location - (Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation, Owner.PrePivot) * Owner.DrawScale));
		Emitters[0].Acceleration = (vect(0.0000000, 0.0000000, 1.0000000) << Rotation) * float(-8);
		MeshEmitter(Emitters[0]).StaticMesh = Owner.StaticMesh;
		MeshEmitter(Emitters[0]).SizeScale[0].RelativeSize = Owner.DrawScale;
		MeshEmitter(Emitters[0]).SizeScale[1].RelativeSize = Owner.DrawScale;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BCoreProV55.BCPickupFadeEffect.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.0000000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=0
	end object
	Emitters[0]=MeshEmitter1
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BCoreProV55.BCPickupFadeEffect.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.0000000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=0
end object
