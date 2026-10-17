class BulletHitEffect extends Emitter;

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
	// End:0x63
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = byte(255);
		DustColor.G = 150;
		DustColor.B = 64;
	}
	DustColor.A = byte(255);
	// End:0xCC
	if((int(Level.DustColor.R) & int(Level.DustColor.B)) < (int(Level.DustColor.G) - int(GrassVariance)))
	{
		DustType = 1;		
	}
	else
	{
		// End:0x126
		if(int(Level.DustColor.B) <= (int(Level.DustColor.R) & (int(Level.DustColor.G) - int(DirtVariance))))
		{
			DustType = 2;			
		}
		else
		{
			// End:0x17B
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
	Emitters[0].ColorScale[0].Color = DustColor;
	Emitters[0].ColorScale[1].Color = DustColor;
	Emitters[2].ColorScale[0].Color = DustColor;
	Emitters[2].ColorScale[1].Color = DustColor;
	// End:0x258
	if(int(DustType) == 0)
	{
		Emitters[1].Disabled = false;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;		
	}
	else
	{
		// End:0x2B7
		if(int(DustType) == 1)
		{
			Emitters[1].Disabled = true;
			Emitters[2].Disabled = false;
			Emitters[3].Disabled = true;
			Emitters[4].Disabled = true;			
		}
		else
		{
			// End:0x317
			if(int(DustType) == 2)
			{
				Emitters[1].Disabled = true;
				Emitters[2].Disabled = true;
				Emitters[3].Disabled = false;
				Emitters[4].Disabled = true;				
			}
			else
			{
				// End:0x374
				if(int(DustType) == 3)
				{
					Emitters[1].Disabled = true;
					Emitters[2].Disabled = true;
					Emitters[3].Disabled = true;
					Emitters[4].Disabled = false;
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
	// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter0'
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=4
		DetailMode=1
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=30.0000000,Max=50.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		MaxParticles=4
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		MaxParticles=4
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BenTropical01.Texture.PalmLeafFX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		MaxParticles=4
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=3.0000000,Max=5.0000000),Z=(Min=3.0000000,Max=5.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		MaxParticles=4
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BenTex01.textures.SnowPuff'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: MeshEmitter'BWBP_VPC_Pro.BulletHitEffect.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.Volumetric1'
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutoDestroy=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=32,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=32,A=255))
		FadeOutStartTime=0.1500000
		CoordinateSystem=1
		MaxParticles=1
		RotationOffset=(Pitch=63350,Yaw=0,Roll=0)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		InitialParticlesPerSecond=800.0000000
		DrawStyle=1
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=-6.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[5]=MeshEmitter0
	AutoDestroy=true
	CullDistance=3000.0000000
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter0'
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=4
	DetailMode=1
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=30.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	MaxParticles=4
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	MaxParticles=4
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BenTropical01.Texture.PalmLeafFX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	MaxParticles=4
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=3.0000000,Max=5.0000000),Z=(Min=3.0000000,Max=5.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.BulletHitEffect.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	MaxParticles=4
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BenTex01.textures.SnowPuff'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=40.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.BulletHitEffect.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.Volumetric1'
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutoDestroy=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=32,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=32,A=255))
	FadeOutStartTime=0.1500000
	CoordinateSystem=1
	MaxParticles=1
	RotationOffset=(Pitch=63350,Yaw=0,Roll=0)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	InitialParticlesPerSecond=800.0000000
	DrawStyle=1
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=-6.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
