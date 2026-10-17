class LeopardDust extends Emitter;

var(Dust) byte GrassVariance;
var(Dust) byte DirtVariance;
var byte DustType;

simulated function SetDustColor(Color DustColor)
{
	// End:0x61
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = 192;
		DustColor.G = 160;
		DustColor.B = 96;
	}
	DustColor.A = byte(255);
	// End:0xCA
	if((int(Level.DustColor.R) & int(Level.DustColor.B)) < (int(Level.DustColor.G) - int(GrassVariance)))
	{
		DustType = 1;		
	}
	else
	{
		// End:0x124
		if(int(Level.DustColor.B) <= (int(Level.DustColor.R) & (int(Level.DustColor.G) - int(DirtVariance))))
		{
			DustType = 2;			
		}
		else
		{
			// End:0x179
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
	Emitters[5].ColorScale[0].Color = DustColor;
	Emitters[5].ColorScale[1].Color = DustColor;
	//return;	
}

simulated function UpdateTrackDust(bool bActive)
{
	local int i;

	// End:0x5F
	if(!bActive)
	{
		i = 0;
		J0x12:

		// End:0x5C [Loop If]
		if(i < 6)
		{
			Emitters[i].InitialParticlesPerSecond = 0.0000000;
			Emitters[i].ParticlesPerSecond = 0.0000000;
			i++;
			// [Loop Continue]
			goto J0x12;
		}		
	}
	else
	{
		// End:0x9C
		if(bActive)
		{
			i = 0;
			J0x6F:

			// End:0x9C [Loop If]
			if(i < 6)
			{
				Emitters[i].AllParticlesDead = false;
				i++;
				// [Loop Continue]
				goto J0x6F;
			}
		}
	}
	// End:0x141
	if(int(Level.DetailMode) == int(0))
	{
		Emitters[0].Disabled = false;
		Emitters[0].SpinParticles = false;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
		Emitters[5].Disabled = true;		
	}
	else
	{
		// End:0x1E6
		if(int(Level.DetailMode) == int(1))
		{
			Emitters[0].Disabled = false;
			Emitters[0].SpinParticles = true;
			Emitters[1].Disabled = true;
			Emitters[2].Disabled = true;
			Emitters[3].Disabled = true;
			Emitters[4].Disabled = true;
			Emitters[5].Disabled = true;			
		}
		else
		{
			// End:0x3C7
			if(int(Level.DetailMode) == int(2))
			{
				// End:0x271
				if(int(DustType) == 0)
				{
					Emitters[1].UseCollision = true;
					Emitters[1].Disabled = false;
					Emitters[2].Disabled = true;
					Emitters[3].Disabled = true;
					Emitters[4].Disabled = true;					
				}
				else
				{
					// End:0x2D0
					if(int(DustType) == 1)
					{
						Emitters[1].Disabled = true;
						Emitters[2].Disabled = false;
						Emitters[3].Disabled = true;
						Emitters[4].Disabled = true;						
					}
					else
					{
						// End:0x330
						if(int(DustType) == 2)
						{
							Emitters[1].Disabled = true;
							Emitters[2].Disabled = true;
							Emitters[3].Disabled = false;
							Emitters[4].Disabled = true;							
						}
						else
						{
							// End:0x38D
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
				Emitters[0].Disabled = false;
				Emitters[0].SpinParticles = true;
				Emitters[5].Disabled = false;
			}
		}
	}
	//return;	
}

simulated function DustScale(float DustSize, float DustVelocity, float DustLife, float FadeTime, float DustAmmount)
{
	local int i;

	Emitters[0].StartSizeRange.X.Min = DustSize;
	Emitters[0].StartSizeRange.X.Max = DustSize;
	Emitters[0].StartSizeRange.Y.Min = DustSize;
	Emitters[0].StartSizeRange.Y.Max = DustSize;
	Emitters[0].StartSizeRange.Z.Min = DustSize;
	Emitters[0].StartSizeRange.Z.Max = DustSize;
	Emitters[5].StartSizeRange.X.Min = DustSize / 2.0000000;
	Emitters[5].StartSizeRange.X.Max = DustSize / 2.0000000;
	Emitters[5].StartSizeRange.Y.Min = DustSize / 2.0000000;
	Emitters[5].StartSizeRange.Y.Max = DustSize / 2.0000000;
	Emitters[5].StartSizeRange.Z.Min = DustSize / 2.0000000;
	Emitters[5].StartSizeRange.Z.Max = DustSize / 2.0000000;
	Emitters[0].StartVelocityRange.Z.Max = DustVelocity;
	Emitters[5].StartVelocityRange.Z.Max = DustVelocity / 3.0000000;
	Emitters[0].LifetimeRange.Min = DustLife;
	Emitters[0].LifetimeRange.Max = DustLife;
	Emitters[5].LifetimeRange.Min = DustLife / 1.7500000;
	Emitters[5].LifetimeRange.Max = DustLife / 1.7500000;
	Emitters[0].FadeOutStartTime = FadeTime;
	Emitters[5].FadeOutStartTime = FadeTime / 1.7500000;
	Emitters[0].InitialParticlesPerSecond = DustAmmount * 2.0000000;
	Emitters[0].ParticlesPerSecond = DustAmmount * 2.0000000;
	i = 1;
	J0x2E9:

	// End:0x333 [Loop If]
	if(i < 6)
	{
		Emitters[i].InitialParticlesPerSecond = DustAmmount;
		Emitters[i].ParticlesPerSecond = DustAmmount;
		i++;
		// [Loop Continue]
		goto J0x2E9;
	}
	//return;	
}

defaultproperties
{
	GrassVariance=48
	DirtVariance=24
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=150,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=64,A=255))
		FadeOutStartTime=5.5000000
		FadeInEndTime=0.5000000
		MaxParticles=140
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=0.0000000,Max=10.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		FadeInEndTime=0.5200000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		FadeInEndTime=0.5200000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		DrawStyle=1
		Texture=Texture'BenTropical01.Texture.PalmLeafFX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		FadeInEndTime=0.5000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		FadeInEndTime=0.5200000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		Texture=Texture'BenTex01.textures.SnowPuff'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
		Opacity=0.5000000
		FadeOutStartTime=3.5000000
		FadeInEndTime=0.5000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=0.0000000,Max=10.0000000))
	end object
	Emitters[5]=SpriteEmitter5
	CullDistance=16000.0000000
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=150,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=64,A=255))
	FadeOutStartTime=5.5000000
	FadeInEndTime=0.5000000
	MaxParticles=140
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=0.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	FadeInEndTime=0.5200000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	FadeInEndTime=0.5200000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	DrawStyle=1
	Texture=Texture'BenTropical01.Texture.PalmLeafFX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	FadeInEndTime=0.5000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	FadeInEndTime=0.5200000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	Texture=Texture'BenTex01.textures.SnowPuff'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=20.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardDust.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
	Opacity=0.5000000
	FadeOutStartTime=3.5000000
	FadeInEndTime=0.5000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=-20.0000000),Z=(Min=0.0000000,Max=10.0000000))
end object
