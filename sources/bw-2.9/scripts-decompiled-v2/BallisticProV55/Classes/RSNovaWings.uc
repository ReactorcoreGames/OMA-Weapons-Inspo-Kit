class RSNovaWings extends BallisticEmitter;

function UpdateWings(float Phase)
{
	Emitters[0].StartSpinRange.Z.Min = 0.8500000 + (Phase * 0.1500000);
	Emitters[0].StartSpinRange.Z.Max = Emitters[0].StartSpinRange.Z.Min;
	Emitters[1].StartSpinRange.Z.Min = -0.8500000 - (Phase * 0.1500000);
	Emitters[1].StartSpinRange.Z.Max = Emitters[1].StartSpinRange.Z.Min;
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.RSNovaWings.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Wing'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=240,G=240,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=240,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.0750000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-11.0000000,Y=0.0000000,Z=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0100000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9500000,Max=0.9500000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.2500000,Max=1.2500000),Z=(Min=1.0000000,Max=1.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1250000,Max=0.1250000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: MeshEmitter'BallisticProV55.RSNovaWings.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Wing'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=240,G=240,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=240,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.0750000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-11.0000000,Y=0.0000000,Z=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0100000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=-0.9500000,Max=-0.9500000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.2500000,Max=-1.2500000),Z=(Min=1.0000000,Max=1.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1250000,Max=0.1250000)
	end object
	Emitters[1]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNovaWings.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.6100000
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.3900000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=20.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=80.0000000,Max=90.0000000),Y=(Min=80.0000000,Max=90.0000000),Z=(Min=80.0000000,Max=90.0000000))
		Texture=Texture'BW_Core_WeaponTex.NovaStaff.NovaAura'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter2
	Physics=10
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Flight'
	bOwnerNoSee=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RSNovaWings.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Wing'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=240,G=240,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=240,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.0750000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-11.0000000,Y=0.0000000,Z=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0100000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9500000,Max=0.9500000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.2500000,Max=1.2500000),Z=(Min=1.0000000,Max=1.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1250000,Max=0.1250000)
end object
// Reference: MeshEmitter'BallisticProV55.RSNovaWings.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Wing'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=240,G=240,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=240,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.0750000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-11.0000000,Y=0.0000000,Z=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0100000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=-0.9500000,Max=-0.9500000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.2500000,Max=-1.2500000),Z=(Min=1.0000000,Max=1.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1250000,Max=0.1250000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaWings.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.6100000
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.3900000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=20.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=80.0000000,Max=90.0000000),Y=(Min=80.0000000,Max=90.0000000),Z=(Min=80.0000000,Max=90.0000000))
	Texture=Texture'BW_Core_WeaponTex.NovaStaff.NovaAura'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
