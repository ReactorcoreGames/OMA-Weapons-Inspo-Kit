class AH104FireHit extends DGVEmitter;

struct FlameHit
{
	var Vector HitLoc;
	var Vector HitNorm;
	var float HitTime;
};

var array<FlameHit> FlameHits;
var float KillFlameTime;
var bool bLost;
var bool bStarted;

simulated function AddHit(Vector loc, Vector Norm, float Time)
{
	FlameHits.Length = FlameHits.Length + 1;
	FlameHits[FlameHits.Length - 1].HitLoc = loc;
	FlameHits[FlameHits.Length - 1].HitNorm = Norm;
	FlameHits[FlameHits.Length - 1].HitTime = Time;
	KillFlameTime = Time + 0.1200000;
	//return;	
}

simulated event Tick(float dt)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xCC [Loop If]
	if(i < FlameHits.Length)
	{
		// End:0xC2
		if(Level.TimeSeconds >= FlameHits[i].HitTime)
		{
			SetLocation(FlameHits[i].HitLoc);
			SetRotation(Rotator(FlameHits[i].HitNorm));
			FlameHits.Remove(i, 1);
			i--;
			// End:0xC2
			if(!bStarted)
			{
				Emitters[0].AutomaticInitialSpawning = true;
				Emitters[1].AutomaticInitialSpawning = true;
				Emitters[2].AutomaticInitialSpawning = true;
				bStarted = true;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0xF2
	if(Level.TimeSeconds >= KillFlameTime)
	{
		bLost = true;
		Kill();
	}
	super(Actor).Tick(dt);
	Emitters[0].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[0].StartSpinRange.X.Min = Emitters[0].StartSpinRange.X.Max;
	Emitters[0].StartSpinRange.Y.Max = float(Rotation.Pitch) / float(65536);
	Emitters[0].StartSpinRange.Y.Min = Emitters[0].StartSpinRange.Y.Max;
	// End:0x1E7
	if(Rotation != OldRotation)
	{
		OldRotation = Rotation;
		AlignVelocity();
	}
	//return;	
}

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

simulated function AlignVelocity()
{
	local int i;
	local Vector X, Y, Z, VMax, vmin;

	GetAxes(Rotation, X, Y, Z);
	i = 0;
	J0x1D:

	// End:0x81A [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x53
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0x810;
		}
		// End:0x17A
		if(bVerticalZ)
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Min);
			// End:0x177
			if(bYIsSpread)
			{
				VMax = VMax + ((Z * SVY[i].Max) * Abs(X.Z));
				vmin = vmin + ((Z * SVY[i].Min) * Abs(X.Z));
			}			
		}
		else
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (Z * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (Z * SVZ[i].Min);
		}
		Emitters[i].StartVelocityRange = VtoRV(VMax, vmin);
		VMax = ((X * default.Emitters[i].StartLocationRange.X.Max) + (Y * default.Emitters[i].StartLocationRange.Y.Max)) + (Z * default.Emitters[i].StartLocationRange.Z.Max);
		vmin = ((X * default.Emitters[i].StartLocationRange.X.Min) + (Y * default.Emitters[i].StartLocationRange.Y.Min)) + (Z * default.Emitters[i].StartLocationRange.Z.Min);
		Emitters[i].StartLocationRange = VtoRV(VMax, vmin);
		Emitters[i].StartLocationOffset = ((X * default.Emitters[i].StartLocationOffset.X) + (Y * default.Emitters[i].StartLocationOffset.Y)) + (Z * default.Emitters[i].StartLocationOffset.Z);
		// End:0x470
		if(SpriteEmitter(Emitters[i]) != none)
		{
			SpriteEmitter(Emitters[i]).ProjectionNormal = ((X * SpriteEmitter(default.Emitters[i]).ProjectionNormal.X) + (Y * SpriteEmitter(default.Emitters[i]).ProjectionNormal.Y)) + (Z * SpriteEmitter(default.Emitters[i]).ProjectionNormal.Z);
		}
		// End:0x810
		if(bModifyLossRange)
		{
			VMax.X = (Abs(X.X * default.Emitters[i].VelocityLossRange.X.Max) + Abs(X.Y * default.Emitters[i].VelocityLossRange.X.Max)) + Abs(X.Z * default.Emitters[i].VelocityLossRange.X.Max);
			VMax.Y = (Abs(Y.X * default.Emitters[i].VelocityLossRange.Y.Max) + Abs(Y.Y * default.Emitters[i].VelocityLossRange.Y.Max)) + Abs(Y.Z * default.Emitters[i].VelocityLossRange.Y.Max);
			VMax.Z = (Abs(Z.X * default.Emitters[i].VelocityLossRange.Z.Max) + Abs(Z.Y * default.Emitters[i].VelocityLossRange.Z.Max)) + Abs(Z.Z * default.Emitters[i].VelocityLossRange.Z.Max);
			vmin.X = (Abs(X.X * default.Emitters[i].VelocityLossRange.X.Min) + Abs(X.Y * default.Emitters[i].VelocityLossRange.X.Min)) + Abs(X.Z * default.Emitters[i].VelocityLossRange.X.Min);
			vmin.Y = (Abs(Y.X * default.Emitters[i].VelocityLossRange.Y.Min) + Abs(Y.Y * default.Emitters[i].VelocityLossRange.Y.Min)) + Abs(Y.Z * default.Emitters[i].VelocityLossRange.Y.Min);
			vmin.Z = (Abs(Z.X * default.Emitters[i].VelocityLossRange.Z.Min) + Abs(Z.Y * default.Emitters[i].VelocityLossRange.Z.Min)) + Abs(Z.Z * default.Emitters[i].VelocityLossRange.Z.Min);
			Emitters[i].VelocityLossRange = VtoRV(VMax, vmin);
		}
		J0x810:

		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	//return;	
}

defaultproperties
{
	bVerticalZ=false
	bYIsSpread=false
	// Reference: MeshEmitter'BWBP_SKC_Pro.AH104FireHit.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.1610000
		FadeInEndTime=0.1190000
		MaxParticles=4
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.7000000)
	end object
	Emitters[0]=MeshEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AH104FireHit.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.2150000
		FadeInEndTime=0.1050000
		MaxParticles=40
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.5500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AH104FireHit.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.2040000
		MaxParticles=2
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSizeRange=(X=(Min=180.0000000,Max=220.0000000),Y=(Min=180.0000000,Max=220.0000000),Z=(Min=180.0000000,Max=220.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
	end object
	Emitters[2]=SpriteEmitter4
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.AH104FireHit.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.1610000
	FadeInEndTime=0.1190000
	MaxParticles=4
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AH104FireHit.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.2150000
	FadeInEndTime=0.1050000
	MaxParticles=40
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.5500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AH104FireHit.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.2040000
	MaxParticles=2
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSizeRange=(X=(Min=180.0000000,Max=220.0000000),Y=(Min=180.0000000,Max=220.0000000),Z=(Min=180.0000000,Max=220.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
end object
