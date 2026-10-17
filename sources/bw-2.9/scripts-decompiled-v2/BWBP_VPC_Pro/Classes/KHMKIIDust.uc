class KHMKIIDust extends Emitter;

var(Dust) byte GrassVariance;
var(Dust) byte DirtVariance;
var(Dust) int MaxParticleSpawnRate;
var(Dust) Sound GroundSound;
var(Dust) Sound WaterSound;
var byte DustType;

simulated function SetDustColor(Color DustColor, bool bOverWater)
{
	// End:0x61
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = 192;
		DustColor.G = 160;
		DustColor.B = 96;
	}
	DustColor.A = byte(255);
	// End:0xD7
	if(((int(Level.DustColor.R) & int(Level.DustColor.B)) < (int(Level.DustColor.G) - int(GrassVariance))) && !bOverWater)
	{
		DustType = 1;		
	}
	else
	{
		// End:0x13E
		if((int(Level.DustColor.B) <= (int(Level.DustColor.R) & (int(Level.DustColor.G) - int(DirtVariance)))) && !bOverWater)
		{
			DustType = 2;			
		}
		else
		{
			// End:0x1A0
			if((((int(Level.DustColor.R) & int(Level.DustColor.G)) & int(Level.DustColor.B)) <= 48) && !bOverWater)
			{
				DustType = 0;				
			}
			else
			{
				// End:0x1B4
				if(bOverWater)
				{
					DustType = 4;					
				}
				else
				{
					DustType = 3;
				}
			}
		}
	}
	Emitters[0].ColorScale[0].Color = DustColor;
	Emitters[0].ColorScale[1].Color = DustColor;
	Emitters[0].ColorScale[2].Color = DustColor;
	Emitters[0].ColorScale[3].Color = DustColor;
	Emitters[5].ColorScale[0].Color = DustColor;
	Emitters[5].ColorScale[1].Color = DustColor;
	Emitters[6].ColorScale[0].Color = DustColor;
	Emitters[6].ColorScale[1].Color = DustColor;
	Emitters[6].ColorScale[2].Color = DustColor;
	Emitters[6].ColorScale[3].Color = DustColor;
	//return;	
}

simulated function UpdateBladeDust(bool bActive, float HoverHeight)
{
	local float Force;
	local byte i;

	Force = 1.0000000 - HoverHeight;
	// End:0x1EC
	if(bActive && int(DustType) == 4)
	{
		// End:0x74
		if(int(Level.DetailMode) == int(2))
		{
			AmbientSound = WaterSound;
			SoundVolume = byte((Force * float(255)) / 1.5000000);
			SoundPitch = 32;			
		}
		else
		{
			// End:0xBD
			if(int(Level.DetailMode) == int(1))
			{
				AmbientSound = WaterSound;
				SoundVolume = byte((Force * float(255)) / 4.5000000);
				SoundPitch = 32;				
			}
			else
			{
				// End:0xFF
				if(int(Level.DetailMode) == int(0))
				{
					AmbientSound = none;
					SoundVolume = byte((Force * float(255)) / 4.5000000);
					SoundPitch = 32;
				}
			}
		}
		Emitters[0].StartSizeRange.X.Min = Force * 60.0000000;
		Emitters[0].StartSizeRange.X.Max = Force * 60.0000000;
		Emitters[0].StartSizeRange.Y.Min = Force * 60.0000000;
		Emitters[0].StartSizeRange.Y.Max = Force * 60.0000000;
		Emitters[0].StartSizeRange.Z.Min = Force * 60.0000000;
		Emitters[0].StartSizeRange.Z.Max = Force * 60.0000000;		
	}
	else
	{
		// End:0x3C6
		if(bActive && int(DustType) < 4)
		{
			// End:0x24E
			if(int(Level.DetailMode) == int(2))
			{
				AmbientSound = GroundSound;
				SoundVolume = byte((Force * float(255)) / 1.5000000);
				SoundPitch = 64;				
			}
			else
			{
				// End:0x297
				if(int(Level.DetailMode) == int(1))
				{
					AmbientSound = GroundSound;
					SoundVolume = byte((Force * float(255)) / 1.5000000);
					SoundPitch = 64;					
				}
				else
				{
					// End:0x2D9
					if(int(Level.DetailMode) == int(0))
					{
						AmbientSound = none;
						SoundVolume = byte((Force * float(255)) / 2.5000000);
						SoundPitch = 64;
					}
				}
			}
			Emitters[0].StartSizeRange.X.Min = Force * 40.0000000;
			Emitters[0].StartSizeRange.X.Max = Force * 40.0000000;
			Emitters[0].StartSizeRange.Y.Min = Force * 40.0000000;
			Emitters[0].StartSizeRange.Y.Max = Force * 40.0000000;
			Emitters[0].StartSizeRange.Z.Min = Force * 40.0000000;
			Emitters[0].StartSizeRange.Z.Max = Force * 40.0000000;			
		}
		else
		{
			// End:0x3F3
			if(!bActive)
			{
				AmbientSound = none;
				SoundVolume = byte(Force * float(255));
				SoundPitch = 64;
			}
		}
	}
	// End:0x459
	if(!bActive)
	{
		i = 0;
		J0x406:

		// End:0x456 [Loop If]
		if(int(i) < 7)
		{
			Emitters[int(i)].ParticlesPerSecond = 0.0000000;
			Emitters[int(i)].InitialParticlesPerSecond = 0.0000000;
			i++;
			// [Loop Continue]
			goto J0x406;
		}		
	}
	else
	{
		i = 0;
		J0x461:

		// End:0x4DC [Loop If]
		if(int(i) < 5)
		{
			Emitters[int(i)].ParticlesPerSecond = float(MaxParticleSpawnRate) * Force;
			Emitters[int(i)].InitialParticlesPerSecond = float(MaxParticleSpawnRate) * Force;
			Emitters[int(i)].AllParticlesDead = false;
			i++;
			// [Loop Continue]
			goto J0x461;
		}
		Emitters[5].ParticlesPerSecond = 20.0000000;
		Emitters[5].InitialParticlesPerSecond = 20.0000000;
		Emitters[5].AllParticlesDead = false;
		Emitters[0].Opacity = 0.3500000 * Force;
		i = 1;
		J0x543:

		// End:0x577 [Loop If]
		if(int(i) < 6)
		{
			Emitters[int(i)].Opacity = Force;
			i++;
			// [Loop Continue]
			goto J0x543;
		}
		Emitters[6].Opacity = Force;
		Emitters[6].ParticlesPerSecond = float(MaxParticleSpawnRate) * Force;
		Emitters[6].InitialParticlesPerSecond = float(MaxParticleSpawnRate) * Force;
		Emitters[6].AllParticlesDead = false;
	}
	// End:0x69B
	if(int(Level.DetailMode) == int(0))
	{
		Emitters[0].Disabled = true;
		Emitters[0].SpinParticles = false;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
		Emitters[5].Disabled = true;
		Emitters[6].Disabled = true;		
	}
	else
	{
		// End:0x754
		if(int(Level.DetailMode) == int(1))
		{
			Emitters[0].Disabled = false;
			Emitters[0].SpinParticles = true;
			Emitters[1].Disabled = true;
			Emitters[2].Disabled = true;
			Emitters[3].Disabled = true;
			Emitters[4].Disabled = true;
			Emitters[5].Disabled = true;
			Emitters[6].Disabled = true;			
		}
		else
		{
			// End:0xA36
			if(int(Level.DetailMode) == int(2))
			{
				// End:0x7F4
				if(int(DustType) == 0)
				{
					Emitters[1].Disabled = false;
					Emitters[2].Disabled = true;
					Emitters[3].Disabled = true;
					Emitters[4].Disabled = true;
					Emitters[5].Disabled = true;
					Emitters[6].Disabled = true;					
				}
				else
				{
					// End:0x87B
					if(int(DustType) == 1)
					{
						Emitters[1].Disabled = true;
						Emitters[2].Disabled = false;
						Emitters[3].Disabled = true;
						Emitters[4].Disabled = true;
						Emitters[5].Disabled = true;
						Emitters[6].Disabled = true;						
					}
					else
					{
						// End:0x903
						if(int(DustType) == 2)
						{
							Emitters[1].Disabled = true;
							Emitters[2].Disabled = true;
							Emitters[3].Disabled = false;
							Emitters[4].Disabled = true;
							Emitters[5].Disabled = true;
							Emitters[6].Disabled = true;							
						}
						else
						{
							// End:0x98B
							if(int(DustType) == 3)
							{
								Emitters[1].Disabled = true;
								Emitters[2].Disabled = true;
								Emitters[3].Disabled = true;
								Emitters[4].Disabled = false;
								Emitters[5].Disabled = true;
								Emitters[6].Disabled = true;								
							}
							else
							{
								// End:0xA10
								if(int(DustType) == 4)
								{
									Emitters[1].Disabled = true;
									Emitters[2].Disabled = true;
									Emitters[3].Disabled = true;
									Emitters[4].Disabled = true;
									Emitters[5].Disabled = false;
									Emitters[6].Disabled = false;
								}
							}
						}
					}
				}
				Emitters[0].Disabled = false;
				Emitters[0].SpinParticles = true;
			}
		}
	}
	//return;	
}

defaultproperties
{
	GrassVariance=48
	DirtVariance=24
	MaxParticleSpawnRate=30
	GroundSound=Sound'BWBP_Vehicles_Sound.Cobra.BladeWind'
	WaterSound=Sound'BWBP_Vehicles_Sound.Cobra.BladeSplash'
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
		Opacity=0.3500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=0.3000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=10.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=164,G=128,B=96,A=255))
		Opacity=0.7500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=0.3000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
		Opacity=0.7500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=0.3000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'BenTropical01.Texture.PalmLeafFX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
		Opacity=0.7500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=0.3000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
		Opacity=0.7500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=0.3000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'BenTex01.textures.SnowPuff'
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: MeshEmitter'BWBP_VPC_Pro.KHMKIIDust.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.SplashMesh'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		FadeOutStartTime=1.5000000
		FadeInEndTime=0.5000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-64.0000000,Max=0.0000000))
		RotationOffset=(Pitch=16201,Yaw=0,Roll=0)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
		RotationNormal=(X=0.0000000,Y=0.0000000,Z=32768.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=70.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=70.0000000)
		StartSizeRange=(X=(Min=0.1000000,Max=0.2500000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=6
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=64,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=64,A=0))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=1.5000000
		FadeInEndTime=0.3000000
		MaxParticles=100
		StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EmitterTextures.SingleFrame.WaterDrop'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[6]=SpriteEmitter5
	CullDistance=12000.0000000
	bNoDelete=false
	bFullVolume=true
	bHardAttach=true
	SoundVolume=255
	SoundRadius=200.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
	Opacity=0.3500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=0.3000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=10.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=164,G=128,B=96,A=255))
	Opacity=0.7500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=0.3000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
	Opacity=0.7500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=0.3000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'BenTropical01.Texture.PalmLeafFX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
	Opacity=0.7500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=0.3000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Dirt.DirtClumps'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
	Opacity=0.7500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=0.3000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'BenTex01.textures.SnowPuff'
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.KHMKIIDust.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.SplashMesh'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	FadeOutStartTime=1.5000000
	FadeInEndTime=0.5000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-64.0000000,Max=0.0000000))
	RotationOffset=(Pitch=16201,Yaw=0,Roll=0)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
	RotationNormal=(X=0.0000000,Y=0.0000000,Z=32768.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=70.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=70.0000000)
	StartSizeRange=(X=(Min=0.1000000,Max=0.2500000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=6
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIDust.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=64,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=64,A=0))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=1.5000000
	FadeInEndTime=0.3000000
	MaxParticles=100
	StartLocationRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EmitterTextures.SingleFrame.WaterDrop'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-750.0000000,Max=-750.0000000)
	GetVelocityDirectionFrom=3
end object
