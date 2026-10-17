class RSDarkFireHit extends DGVEmitter;

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

	// End:0xF4 [Loop If]
	if(i < FlameHits.Length)
	{
		// End:0xEA
		if(Level.TimeSeconds >= FlameHits[i].HitTime)
		{
			SetLocation(FlameHits[i].HitLoc);
			SetRotation(Rotator(FlameHits[i].HitNorm));
			FlameHits.Remove(i, 1);
			i--;
			// End:0xEA
			if(!bStarted)
			{
				Emitters[0].AutomaticInitialSpawning = true;
				Emitters[1].AutomaticInitialSpawning = true;
				Emitters[2].AutomaticInitialSpawning = true;
				Emitters[3].AutomaticInitialSpawning = true;
				Emitters[4].AutomaticInitialSpawning = true;
				bStarted = true;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x11A
	if(Level.TimeSeconds >= KillFlameTime)
	{
		bLost = true;
		Kill();
	}
	super(Actor).Tick(dt);
	Emitters[2].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[2].StartSpinRange.X.Min = Emitters[2].StartSpinRange.X.Max;
	Emitters[2].StartSpinRange.Y.Max = float(Rotation.Pitch) / float(65536);
	Emitters[2].StartSpinRange.Y.Min = Emitters[2].StartSpinRange.Y.Max;
	// End:0x215
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
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3360000
		FadeInEndTime=0.1540000
		MaxParticles=3
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-B-AlphaAdd'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	end object
	Emitters[0]=SpriteEmitter5
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.8785710,Color=(R=64,G=24,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.1500000,Max=0.1500000))
		FadeOutStartTime=0.7000000
		FadeInEndTime=0.1610000
		MaxParticles=3
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		AlphaRef=64
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[1]=SpriteEmitter6
	// Reference: MeshEmitter'BallisticProV55.RSDarkFireHit.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=0.1800000
		FadeInEndTime=0.0960000
		MaxParticles=3
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=2.5000000),Y=(Min=1.0000000,Max=2.5000000),Z=(Min=1.0000000,Max=2.5000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[2]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3142860,Color=(R=192,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.6571430,Color=(R=128,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.0450000
		MaxParticles=25
		StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=-300.0000000,Max=-300.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.7000000
		FadeInEndTime=0.0630000
		MaxParticles=2
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=240.0000000),Y=(Min=200.0000000,Max=240.0000000),Z=(Min=200.0000000,Max=240.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.7000000)
	end object
	Emitters[4]=SpriteEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3360000
	FadeInEndTime=0.1540000
	MaxParticles=3
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-B-AlphaAdd'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.8785710,Color=(R=64,G=24,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.1500000,Max=0.1500000))
	FadeOutStartTime=0.7000000
	FadeInEndTime=0.1610000
	MaxParticles=3
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	AlphaRef=64
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.RSDarkFireHit.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=0.1800000
	FadeInEndTime=0.0960000
	MaxParticles=3
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=2.5000000),Y=(Min=1.0000000,Max=2.5000000),Z=(Min=1.0000000,Max=2.5000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3142860,Color=(R=192,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.6571430,Color=(R=128,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.0450000
	MaxParticles=25
	StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=-300.0000000,Max=-300.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFireHit.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.7000000
	FadeInEndTime=0.0630000
	MaxParticles=2
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=240.0000000),Y=(Min=200.0000000,Max=240.0000000),Z=(Min=200.0000000,Max=240.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.7000000)
end object
