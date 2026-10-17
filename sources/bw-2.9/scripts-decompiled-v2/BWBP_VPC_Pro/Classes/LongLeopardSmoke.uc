class LongLeopardSmoke extends Emitter;

simulated function SetTeamColor(byte Team)
{
	local Color BlueColor, RedColor;

	RedColor.R = 112;
	RedColor.G = 64;
	RedColor.B = 64;
	RedColor.A = byte(255);
	BlueColor.R = 64;
	BlueColor.G = 64;
	BlueColor.B = 112;
	BlueColor.A = byte(255);
	// End:0xED
	if(int(Team) == 1)
	{
		Emitters[0].ColorScale[0].Color = BlueColor;
		Emitters[0].ColorScale[1].Color = BlueColor;
		Emitters[1].ColorScale[0].Color = BlueColor;
		Emitters[1].ColorScale[1].Color = BlueColor;
	}
	// End:0x16E
	if(int(Team) == 0)
	{
		Emitters[0].ColorScale[0].Color = RedColor;
		Emitters[0].ColorScale[1].Color = RedColor;
		Emitters[1].ColorScale[0].Color = RedColor;
		Emitters[1].ColorScale[1].Color = RedColor;
	}
	//return;	
}

simulated function ActivateSmoke(bool bActive)
{
	// End:0x66
	if(!bActive)
	{
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].ParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;		
	}
	else
	{
		Emitters[0].AllParticlesDead = false;
		Emitters[0].ParticlesPerSecond = 1.0000000;
		Emitters[0].InitialParticlesPerSecond = 1.0000000;
		Emitters[1].AllParticlesDead = false;
		Emitters[1].ParticlesPerSecond = 5.0000000;
		Emitters[1].InitialParticlesPerSecond = 5.0000000;
	}
	// End:0x126
	if(int(Level.DetailMode) == int(0))
	{
		Emitters[0].Disabled = false;
		Emitters[1].SpinParticles = false;		
	}
	else
	{
		// End:0x168
		if(int(Level.DetailMode) == int(1))
		{
			Emitters[0].Disabled = false;
			Emitters[1].SpinParticles = true;			
		}
		else
		{
			// End:0x1A7
			if(int(Level.DetailMode) == int(2))
			{
				Emitters[0].Disabled = false;
				Emitters[1].SpinParticles = true;
			}
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_VPC_Pro.LongLeopardSmoke.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.Volumetric1'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
		DrawStyle=6
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LongLeopardSmoke.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		Opacity=0.5000000
		FadeOutStartTime=5.0000000
		MaxParticles=100
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff'
		LifetimeRange=(Min=8.0000000,Max=8.0000000)
		StartVelocityRange=(X=(Min=-12.0000000,Max=12.0000000),Y=(Min=-12.0000000,Max=12.0000000),Z=(Min=60.0000000,Max=80.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_VPC_Pro.LongLeopardSmoke.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.Volumetric1'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	DrawStyle=6
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LongLeopardSmoke.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	Opacity=0.5000000
	FadeOutStartTime=5.0000000
	MaxParticles=100
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff'
	LifetimeRange=(Min=8.0000000,Max=8.0000000)
	StartVelocityRange=(X=(Min=-12.0000000,Max=12.0000000),Y=(Min=-12.0000000,Max=12.0000000),Z=(Min=60.0000000,Max=80.0000000))
end object
