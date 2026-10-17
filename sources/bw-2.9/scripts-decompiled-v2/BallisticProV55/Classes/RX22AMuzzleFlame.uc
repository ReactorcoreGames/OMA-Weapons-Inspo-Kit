class RX22AMuzzleFlame extends BallisticEmitter;

simulated event PostBeginPlay()
{
	local int i;

	super.PostBeginPlay();
	i = 0;
	J0x0D:

	// End:0x3E [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].ZTest = true;
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.RX22AMuzzleFlame.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		Acceleration=(X=400.0000000,Y=0.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4428570,Color=(R=64,G=64,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.8964290,Color=(R=255,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		FadeOutFactor=(W=1.0000000,X=0.9500000,Y=1.0000000,Z=1.0000000)
		FadeOutStartTime=0.0400000
		FadeInEndTime=0.0100000
		CoordinateSystem=1
		MaxParticles=8
		StartLocationOffset=(X=-9.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.3500000,Max=0.4000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		LifetimeRange=(Min=0.3000000,Max=0.5000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22AMuzzleFlame.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.0800000
		CoordinateSystem=1
		MaxParticles=15
		StartLocationOffset=(X=-9.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=400.0000000,Max=800.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22AMuzzleFlame.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.5600000
		FadeOutStartTime=0.5600000
		FadeInEndTime=0.3700000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=7.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=24.0000000),Y=(Min=20.0000000,Max=24.0000000),Z=(Min=20.0000000,Max=24.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RX22AMuzzleFlame.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	Acceleration=(X=400.0000000,Y=0.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4428570,Color=(R=64,G=64,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.8964290,Color=(R=255,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	FadeOutFactor=(W=1.0000000,X=0.9500000,Y=1.0000000,Z=1.0000000)
	FadeOutStartTime=0.0400000
	FadeInEndTime=0.0100000
	CoordinateSystem=1
	MaxParticles=8
	StartLocationOffset=(X=-9.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.3500000,Max=0.4000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	LifetimeRange=(Min=0.3000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AMuzzleFlame.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.0800000
	CoordinateSystem=1
	MaxParticles=15
	StartLocationOffset=(X=-9.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=400.0000000,Max=800.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AMuzzleFlame.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.5600000
	FadeOutStartTime=0.5600000
	FadeInEndTime=0.3700000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=7.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=24.0000000),Y=(Min=20.0000000,Max=24.0000000),Z=(Min=20.0000000,Max=24.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
