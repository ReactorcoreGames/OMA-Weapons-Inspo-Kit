class WaterRing extends Emitter;

function PostBeginPlay()
{
	local float F;

	super(Actor).PostBeginPlay();
	// End:0xFE
	if(Instigator != none)
	{
		F = (70.0000000 + (float(30) * FRand())) * Sqrt(Instigator.CollisionRadius / float(25));
		Emitters[0].StartSizeRange.X.Min = F;
		Emitters[0].StartSizeRange.X.Max = F;
		Emitters[0].StartSizeRange.Y.Min = F;
		Emitters[0].StartSizeRange.Y.Max = F;
		Emitters[0].StartSizeRange.Z.Min = F;
		Emitters[0].StartSizeRange.Z.Max = F;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XGame.WaterRing.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=168,G=234,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RangeVector=54268290000.0000000
	end object
	Emitters[0]=SpriteEmitter9
	AutoDestroy=true
	bNoDelete=false
	bHighDetail=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XGame.WaterRing.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=168,G=234,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RangeVector=54268290000.0000000
end object
