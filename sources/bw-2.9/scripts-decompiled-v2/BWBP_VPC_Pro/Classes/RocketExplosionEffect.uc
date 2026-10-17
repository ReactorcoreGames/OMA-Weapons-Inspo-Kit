class RocketExplosionEffect extends Emitter;

var(Dust) byte GrassVariance;
var(Dust) byte DirtVariance;
var byte DustType;

simulated function PreBeginPlay()
{
	SetDustColor(Level.DustColor);
	//return;	
}

simulated function SetDustColor(Color DustColor)
{
	local Color DarkDustColor;

	// End:0x63
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = byte(255);
		DustColor.G = 150;
		DustColor.B = 64;
	}
	DustColor.A = byte(255);
	DarkDustColor.R = 32;
	DarkDustColor.G = 32;
	DarkDustColor.B = 32;
	DarkDustColor.A = byte(255);
	// End:0x102
	if((int(Level.DustColor.R) & int(Level.DustColor.B)) < (int(Level.DustColor.G) - int(GrassVariance)))
	{
		DustType = 1;		
	}
	else
	{
		// End:0x15C
		if(int(Level.DustColor.B) <= (int(Level.DustColor.R) & (int(Level.DustColor.G) - int(DirtVariance))))
		{
			DustType = 2;			
		}
		else
		{
			// End:0x1B1
			if(((int(Level.DustColor.R) & int(Level.DustColor.G)) & int(Level.DustColor.B)) <= 48)
			{
				DustType = 0;				
			}
			else
			{
				DustType = 3;
			}
		}
	}
	Emitters[0].ColorScale[0].Color = DarkDustColor;
	Emitters[0].ColorScale[1].Color = DustColor;
	Emitters[0].ColorScale[2].Color = DustColor;
	// End:0x271
	if(int(DustType) == 0)
	{
		Emitters[4].Disabled = false;
		Emitters[5].Disabled = true;
		Emitters[6].Disabled = true;
		Emitters[7].Disabled = true;		
	}
	else
	{
		// End:0x2D1
		if(int(DustType) == 1)
		{
			Emitters[4].Disabled = true;
			Emitters[5].Disabled = false;
			Emitters[6].Disabled = true;
			Emitters[7].Disabled = true;			
		}
		else
		{
			// End:0x332
			if(int(DustType) == 2)
			{
				Emitters[4].Disabled = true;
				Emitters[5].Disabled = true;
				Emitters[6].Disabled = false;
				Emitters[7].Disabled = true;				
			}
			else
			{
				// End:0x390
				if(int(DustType) == 3)
				{
					Emitters[4].Disabled = true;
					Emitters[5].Disabled = true;
					Emitters[6].Disabled = true;
					Emitters[7].Disabled = false;
				}
			}
		}
	}
	//return;	
}

defaultproperties
{
	GrassVariance=48
	DirtVariance=24
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-80.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=255,G=150,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=64,A=255))
		Opacity=0.7500000
		FadeOutStartTime=2.0000000
		CoordinateSystem=1
		MaxParticles=100
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=6.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=800.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=200.0000000,Max=400.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=2.0000000
		CoordinateSystem=1
		MaxParticles=25
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=6.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=20.0000000,Max=50.0000000),Z=(Min=20.0000000,Max=50.0000000))
		InitialParticlesPerSecond=100.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=300.0000000))
		VelocityLossRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.1000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
		Opacity=0.7500000
		FadeOutStartTime=1.5000000
		FadeInEndTime=0.5000000
		CoordinateSystem=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=100.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=50.0000000,Max=400.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		RespawnDeadParticles=false
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.9000000
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=15
		DetailMode=1
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.2000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100.0000000
		DrawStyle=5
		Texture=Texture'EpicParticles.Fire.SprayFire1'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=50.0000000,Max=800.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
		FadeOutStartTime=3.5200000
		MaxParticles=20
		DetailMode=2
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
		FadeOutStartTime=3.5200000
		MaxParticles=20
		DetailMode=2
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		DrawStyle=1
		Texture=Texture'BenTropical01.Texture.PalmLeafFX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
		FadeOutStartTime=3.5200000
		MaxParticles=20
		DetailMode=2
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[6]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
		FadeOutStartTime=3.5200000
		MaxParticles=20
		DetailMode=2
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BenTex01.textures.SnowPuff'
		StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[7]=SpriteEmitter7
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.6500000,Max=1.0000000),Z=(Min=0.6500000,Max=1.0000000))
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=30
		DetailMode=1
		StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=35.0000000),Y=(Min=10.0000000,Max=35.0000000),Z=(Min=10.0000000,Max=35.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'EmitterTextures.Flares.EFlarelong2'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-1400.0000000,Max=1400.0000000),Y=(Min=-1400.0000000,Max=1400.0000000),Z=(Min=200.0000000,Max=1400.0000000))
	end object
	Emitters[8]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=4
		StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=40.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=200.0000000),Y=(Min=75.0000000,Max=200.0000000),Z=(Min=75.0000000,Max=200.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[9]=SpriteEmitter9
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-80.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=255,G=150,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=64,A=255))
	Opacity=0.7500000
	FadeOutStartTime=2.0000000
	CoordinateSystem=1
	MaxParticles=100
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=6.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=800.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=200.0000000,Max=400.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=2.0000000
	CoordinateSystem=1
	MaxParticles=25
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=6.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=20.0000000,Max=50.0000000),Z=(Min=20.0000000,Max=50.0000000))
	InitialParticlesPerSecond=100.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=300.0000000))
	VelocityLossRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.1000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
	Opacity=0.7500000
	FadeOutStartTime=1.5000000
	FadeInEndTime=0.5000000
	CoordinateSystem=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=100.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=50.0000000,Max=400.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	RespawnDeadParticles=false
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.9000000
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=15
	DetailMode=1
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.2000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100.0000000
	DrawStyle=5
	Texture=Texture'EpicParticles.Fire.SprayFire1'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=50.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
	FadeOutStartTime=3.5200000
	MaxParticles=20
	DetailMode=2
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
	FadeOutStartTime=3.5200000
	MaxParticles=20
	DetailMode=2
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	DrawStyle=1
	Texture=Texture'BenTropical01.Texture.PalmLeafFX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
	FadeOutStartTime=3.5200000
	MaxParticles=20
	DetailMode=2
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
	FadeOutStartTime=3.5200000
	MaxParticles=20
	DetailMode=2
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-40.0000000,Max=-16.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BenTex01.textures.SnowPuff'
	StartVelocityRadialRange=(Min=400.0000000,Max=600.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=128,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.6500000,Max=1.0000000),Z=(Min=0.6500000,Max=1.0000000))
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=30
	DetailMode=1
	StartLocationRange=(X=(Min=-32.0000000,Max=32.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=35.0000000),Y=(Min=10.0000000,Max=35.0000000),Z=(Min=10.0000000,Max=35.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'EmitterTextures.Flares.EFlarelong2'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-1400.0000000,Max=1400.0000000),Y=(Min=-1400.0000000,Max=1400.0000000),Z=(Min=200.0000000,Max=1400.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.RocketExplosionEffect.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=4
	StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=40.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=200.0000000),Y=(Min=75.0000000,Max=200.0000000),Z=(Min=75.0000000,Max=200.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
