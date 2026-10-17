class IE_ProtonStream extends DGVEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
		FadeOutStartTime=0.0250000
		FadeInEndTime=0.0060000
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=16.0000000,Max=24.0000000),Y=(Min=16.0000000,Max=24.0000000),Z=(Min=16.0000000,Max=24.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1500000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.0410000
		FadeInEndTime=0.0080000
		CoordinateSystem=1
		MaxParticles=6
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0100000,Z=1.0000000)
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4821430,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0810000
		FadeInEndTime=0.0240000
		CoordinateSystem=1
		MaxParticles=30
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=100.0000000,Max=300.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=100.0000000))
	end object
	Emitters[2]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.6000000
		FadeOutStartTime=1.8900000
		FadeInEndTime=0.0300000
		MaxParticles=20
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
		VelocityLossRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
	end object
	Emitters[3]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.4000000
		FadeOutStartTime=0.0750000
		FadeInEndTime=0.0250000
		MaxParticles=60
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=4.0000000,Max=7.0000000),Z=(Min=4.0000000,Max=7.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=30.0000000,Max=40.0000000))
	end object
	Emitters[4]=SpriteEmitter6
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	FadeOutStartTime=0.0250000
	FadeInEndTime=0.0060000
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=16.0000000,Max=24.0000000),Y=(Min=16.0000000,Max=24.0000000),Z=(Min=16.0000000,Max=24.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1500000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.0410000
	FadeInEndTime=0.0080000
	CoordinateSystem=1
	MaxParticles=6
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0100000,Z=1.0000000)
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4821430,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0810000
	FadeInEndTime=0.0240000
	CoordinateSystem=1
	MaxParticles=30
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=100.0000000,Max=300.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.6000000
	FadeOutStartTime=1.8900000
	FadeInEndTime=0.0300000
	MaxParticles=20
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
	VelocityLossRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_ProtonStream.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.4000000
	FadeOutStartTime=0.0750000
	FadeInEndTime=0.0250000
	MaxParticles=60
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=4.0000000,Max=7.0000000),Z=(Min=4.0000000,Max=7.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=30.0000000,Max=40.0000000))
end object
