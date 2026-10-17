class ONSHoverBikeJumpEffect extends Emitter;

defaultproperties
{
	// Reference: MeshEmitter'Onslaught.ONSHoverBikeJumpEffect.MeshEmitter14'
	begin object name="MeshEmitter14" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=21.0000000,Y=75.0000000,Z=-20.0000000)
		SpinsPerSecondRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.5000000))
		InitialParticlesPerSecond=50.0000000
		DrawStyle=6
		LifetimeRange=(Min=0.5000000,Max=0.7500000)
	end object
	Emitters[0]=MeshEmitter14
	// Reference: MeshEmitter'Onslaught.ONSHoverBikeJumpEffect.MeshEmitter15'
	begin object name="MeshEmitter15" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=21.0000000,Y=-75.0000000,Z=-20.0000000)
		SpinsPerSecondRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.5000000))
		InitialParticlesPerSecond=50.0000000
		DrawStyle=6
		LifetimeRange=(Min=0.5000000,Max=0.7500000)
	end object
	Emitters[1]=MeshEmitter15
	AutoDestroy=true
	CullDistance=5000.0000000
	bNoDelete=false
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSHoverBikeJumpEffect.MeshEmitter14'
begin object name="MeshEmitter14" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=21.0000000,Y=75.0000000,Z=-20.0000000)
	SpinsPerSecondRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.5000000))
	InitialParticlesPerSecond=50.0000000
	DrawStyle=6
	LifetimeRange=(Min=0.5000000,Max=0.7500000)
end object
// Reference: MeshEmitter'Onslaught.ONSHoverBikeJumpEffect.MeshEmitter15'
begin object name="MeshEmitter15" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=21.0000000,Y=-75.0000000,Z=-20.0000000)
	SpinsPerSecondRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.5000000))
	InitialParticlesPerSecond=50.0000000
	DrawStyle=6
	LifetimeRange=(Min=0.5000000,Max=0.7500000)
end object
