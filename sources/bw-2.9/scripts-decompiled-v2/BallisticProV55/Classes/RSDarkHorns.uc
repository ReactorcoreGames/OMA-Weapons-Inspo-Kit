class RSDarkHorns extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.2500000, true);
	Timer();
	//return;	
}

simulated event Timer()
{
	// End:0x33
	if(!Level.GetLocalPlayerController().LineOfSightTo(self))
	{
		Emitters[2].ZTest = true;		
	}
	else
	{
		Emitters[2].ZTest = false;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.RSDarkHorns.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.Horns'
		UseMeshBlendMode=false
		UseParticleColor=true
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.9900000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=8.0000000,Y=-1.0000000,Z=1.0000000)
		StartSpinRange=(X=(Min=-0.2000000,Max=-0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2400000,Max=0.2400000))
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: MeshEmitter'BallisticProV55.RSDarkHorns.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.Horns'
		UseMeshBlendMode=false
		UseParticleColor=true
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=8.0000000,Y=-1.0000000,Z=-1.0000000)
		StartSpinRange=(X=(Min=-0.2000000,Max=-0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2600000,Max=0.2600000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSDarkHorns.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter0
	Physics=10
	AmbientSound=Sound'BW_Core_WeaponSound.DarkStar.Dark-DemonWail'
	bFullVolume=true
	SoundVolume=255
	SoundRadius=32.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RSDarkHorns.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.Horns'
	UseMeshBlendMode=false
	UseParticleColor=true
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.9900000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=8.0000000,Y=-1.0000000,Z=1.0000000)
	StartSpinRange=(X=(Min=-0.2000000,Max=-0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2400000,Max=0.2400000))
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'BallisticProV55.RSDarkHorns.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.Horns'
	UseMeshBlendMode=false
	UseParticleColor=true
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=8.0000000,Y=-1.0000000,Z=-1.0000000)
	StartSpinRange=(X=(Min=-0.2000000,Max=-0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2600000,Max=0.2600000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkHorns.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
