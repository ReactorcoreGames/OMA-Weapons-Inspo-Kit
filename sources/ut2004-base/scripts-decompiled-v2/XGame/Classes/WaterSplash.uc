class WaterSplash extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=168,G=234,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=253,G=253,B=253,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=3
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RangeVector=54268290000.0000000
	end object
	Emitters[0]=SpriteEmitter9
	// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		RespawnDeadParticles=false
		UniformSize=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-180.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=137,G=240,B=245,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=88,G=231,B=223,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=25
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[1]=SpriteEmitter10
	// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-180.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=200,G=250,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		RangeVector=54268290000.0000000
	end object
	Emitters[2]=SpriteEmitter11
	// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=250,B=255,A=0))
		FadeOutStartTime=0.5000000
		MaxParticles=12
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CollisionHeight=true
		RemoteRole=0.0000000
		RelativeSize=0.2000000
	end object
	Emitters[3]=SpriteEmitter12
	AutoDestroy=true
	bNoDelete=false
	bHighDetail=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=168,G=234,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=253,G=253,B=253,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=3
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RangeVector=54268290000.0000000
end object
// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	RespawnDeadParticles=false
	UniformSize=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-180.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=137,G=240,B=245,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=88,G=231,B=223,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=25
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-180.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=200,G=250,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	RangeVector=54268290000.0000000
end object
// Reference: SpriteEmitter'XGame.WaterSplash.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=250,B=255,A=0))
	FadeOutStartTime=0.5000000
	MaxParticles=12
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CollisionHeight=true
	RemoteRole=0.0000000
	RelativeSize=0.2000000
end object
