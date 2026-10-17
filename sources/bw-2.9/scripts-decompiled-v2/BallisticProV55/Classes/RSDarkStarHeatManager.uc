class RSDarkStarHeatManager extends BallisticEmitter;

var int ConsecutiveHits;
var float NextHeatDecayTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ConsecutiveHits;
}

function Reset()
{
	Destroy();
	//return;	
}

simulated event TornOff()
{
	Kill();
	//return;	
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x32
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
	}
	NextHeatDecayTime = Level.TimeSeconds + 0.1600000;
	//return;	
}

function AddHeat()
{
	// End:0x0E
	if(ConsecutiveHits == 4)
	{
		return;
	}
	++ConsecutiveHits;
	NextHeatDecayTime = Level.TimeSeconds + 0.1600000;
	//return;	
}

simulated function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x63
	if(int(Level.NetMode) == int(NM_Client))
	{
		Emitters[0].Opacity = float(ConsecutiveHits) / 4.0000000;
		SoundVolume = byte(int(byte(float(ConsecutiveHits) / 4.0000000)) * 150);
		return;
	}
	// End:0xAE
	if(Level.TimeSeconds > NextHeatDecayTime)
	{
		SetBase(none);
		bTearOff = true;
		// End:0xA6
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Destroy();			
		}
		else
		{
			Kill();
		}
		return;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSDarkStarHeatManager.RSDarkHeatSmoke'
	begin object name="RSDarkHeatSmoke" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=140.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.6300000
		FadeOutStartTime=1.5300000
		FadeInEndTime=0.3000000
		MaxParticles=40
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2000000)
		SizeScale[2]=(RelativeTime=2.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.7000000,Max=0.7000000))
	end object
	Emitters[0]=RSDarkHeatSmoke
	RemoteRole=2
	AmbientSound=Sound'GeneralAmbience.firefx9'
	SoundVolume=15
	SoundRadius=256.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSDarkStarHeatManager.RSDarkHeatSmoke'
begin object name="RSDarkHeatSmoke" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=140.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.6300000
	FadeOutStartTime=1.5300000
	FadeInEndTime=0.3000000
	MaxParticles=40
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2000000)
	SizeScale[2]=(RelativeTime=2.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.7000000,Max=0.7000000))
end object
