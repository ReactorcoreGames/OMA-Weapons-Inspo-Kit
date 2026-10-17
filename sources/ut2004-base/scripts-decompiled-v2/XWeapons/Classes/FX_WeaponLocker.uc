class FX_WeaponLocker extends Emitter;

function TurnOff(float t)
{
	bHidden = true;
	SetTimer(t, false);
	//return;	
}

function Timer()
{
	bHidden = false;
	//return;	
}

simulated function NotifyLocalPlayerDead(PlayerController PC)
{
	bHidden = false;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XWeapons.FX_WeaponLocker.SpriteEmitter60'
	begin object name="SpriteEmitter60" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=255,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.6700000
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		SpinsPerSecondRange=(X=(Min=0.0100000,Max=0.0400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RangeVector=13244750.0000000
	end object
	Emitters[0]=SpriteEmitter60
	// Reference: SpriteEmitter'XWeapons.FX_WeaponLocker.SpriteEmitter61'
	begin object name="SpriteEmitter61" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=224,G=255,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.3300000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		SpinsPerSecondRange=(X=(Min=0.0050000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RangeVector=13244750.0000000
	end object
	Emitters[1]=SpriteEmitter61
	CullDistance=7000.0000000
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XWeapons.FX_WeaponLocker.SpriteEmitter60'
begin object name="SpriteEmitter60" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=255,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.6700000
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	SpinsPerSecondRange=(X=(Min=0.0100000,Max=0.0400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RangeVector=13244750.0000000
end object
// Reference: SpriteEmitter'XWeapons.FX_WeaponLocker.SpriteEmitter61'
begin object name="SpriteEmitter61" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=224,G=255,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.3300000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	SpinsPerSecondRange=(X=(Min=0.0050000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RangeVector=13244750.0000000
end object
