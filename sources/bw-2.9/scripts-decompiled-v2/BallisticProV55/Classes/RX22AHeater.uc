class RX22AHeater extends BallisticEmitter;

simulated function SetHeat(float NewHeat)
{
	// End:0x36
	if(NewHeat == float(0))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;		
	}
	else
	{
		// End:0x70
		if(Emitters[0].Disabled)
		{
			Emitters[0].Disabled = false;
			Emitters[1].Disabled = false;
		}
	}
	Emitters[0].Opacity = NewHeat;
	Emitters[1].Opacity = 0.4000000 * NewHeat;
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.RX22AHeater.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater'
		UseMeshBlendMode=false
		UseParticleColor=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.3000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-6.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.3700000
		FadeOutStartTime=0.1950000
		FadeInEndTime=0.1950000
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=12.0000000)
		StartLocationRange=(X=(Min=-12.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=12.0000000),Z=(Min=10.0000000,Max=12.0000000))
		DrawStyle=2
		Texture=Texture'BW_Core_WeaponTex.RX22A.WarpSmoke'
		LifetimeRange=(Min=0.3000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter6
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RX22AHeater.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater'
	UseMeshBlendMode=false
	UseParticleColor=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.3000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-6.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.3700000
	FadeOutStartTime=0.1950000
	FadeInEndTime=0.1950000
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=12.0000000)
	StartLocationRange=(X=(Min=-12.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=12.0000000),Z=(Min=10.0000000,Max=12.0000000))
	DrawStyle=2
	Texture=Texture'BW_Core_WeaponTex.RX22A.WarpSmoke'
	LifetimeRange=(Min=0.3000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=0.0000000))
end object
