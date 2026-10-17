class ONSAttackCraftExhaust extends Emitter;

simulated function SetThrust(float Amount)
{
	Emitters[0].StartSizeRange.X.Min = -0.1000000 - (Amount * 0.3000000);
	Emitters[0].StartSizeRange.X.Max = -0.2000000 - (Amount * 0.8000000);
	Emitters[1].StartVelocityRange.X.Min = 150.0000000 + (Amount * float(250));
	Emitters[1].StartVelocityRange.X.Max = Emitters[1].StartVelocityRange.X.Min;
	Emitters[1].ParticlesPerSecond = 30.0000000 + (Amount * float(70));
	Emitters[1].InitialParticlesPerSecond = 30.0000000 + (Amount * float(70));
	//return;	
}

simulated function SetThrustEnabled(bool bDoThrust)
{
	// End:0x32
	if(bDoThrust)
	{
		Emitters[0].Disabled = false;
		Emitters[1].Disabled = false;		
	}
	else
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'Onslaught.ONSAttackCraftExhaust.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.TurretFlash'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.3300000,Color=(R=255,G=112,B=32,A=0))
		ColorScale[2]=(RelativeTime=0.6600000,Color=(R=255,G=112,B=32,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=3
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=-0.5000000,Max=-0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
	end object
	Emitters[0]=MeshEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSAttackCraftExhaust.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1250000,Color=(R=250,G=192,B=28,A=0))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=112,B=26,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=30
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=100.0000000
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter3
	AutoDestroy=true
	CullDistance=12000.0000000
	bNoDelete=false
	AmbientGlow=140
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSAttackCraftExhaust.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.TurretFlash'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.3300000,Color=(R=255,G=112,B=32,A=0))
	ColorScale[2]=(RelativeTime=0.6600000,Color=(R=255,G=112,B=32,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=3
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=-0.5000000,Max=-0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSAttackCraftExhaust.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1250000,Color=(R=250,G=192,B=28,A=0))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=112,B=26,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=30
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=100.0000000
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
