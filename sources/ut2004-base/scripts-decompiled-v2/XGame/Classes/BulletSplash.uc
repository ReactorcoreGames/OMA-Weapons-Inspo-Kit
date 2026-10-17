class BulletSplash extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		RespawnDeadParticles=false
		UniformSize=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-210.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=137,G=240,B=245,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=88,G=231,B=223,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=20
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[0]=SpriteEmitter29
	// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=74,G=106,B=108,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=8
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		RangeVector=54268290000.0000000
	end object
	Emitters[1]=SpriteEmitter30
	// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-160.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=250,B=255,A=0))
		FadeOutStartTime=0.5000000
		MaxParticles=12
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CollisionHeight=true
		RemoteRole=0.0000000
		RelativeSize=0.2000000
	end object
	Emitters[2]=SpriteEmitter31
	AutoDestroy=true
	bNoDelete=false
	bHighDetail=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	RespawnDeadParticles=false
	UniformSize=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-210.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=137,G=240,B=245,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=88,G=231,B=223,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=20
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=74,G=106,B=108,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=8
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	RangeVector=54268290000.0000000
end object
// Reference: SpriteEmitter'XGame.BulletSplash.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-160.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=250,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=250,B=255,A=0))
	FadeOutStartTime=0.5000000
	MaxParticles=12
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CollisionHeight=true
	RemoteRole=0.0000000
	RelativeSize=0.2000000
end object
