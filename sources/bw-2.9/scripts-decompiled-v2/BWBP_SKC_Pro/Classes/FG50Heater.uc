class FG50Heater extends BallisticEmitter;

simulated function SetHeat(float NewHeat)
{
	// End:0x36
	if(NewHeat == float(0))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;		
	}
	else
	{
		// End:0x70
		if(Emitters[0].Disabled)
		{
			Emitters[0].Disabled = false;
			Emitters[1].Disabled = false;
		}
	}
	Emitters[0].Opacity = NewHeat;
	Emitters[1].Opacity = 0.4000000 * NewHeat;
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SKC_Pro.FG50Heater.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_SKC_Static.FG50.FG50Barrel'
		UseMeshBlendMode=false
		UseParticleColor=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=1.6700000,Max=1.6700000),Y=(Min=1.6700000,Max=1.6700000),Z=(Min=1.6700000,Max=1.6700000))
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=MeshEmitter1
	Emitters[1]=SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter3'
	Emitters[2]=SpriteEmitter'BallisticProV55.RX22AHeater.SpriteEmitter6'
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.FG50Heater.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_SKC_Static.FG50.FG50Barrel'
	UseMeshBlendMode=false
	UseParticleColor=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=1.6700000,Max=1.6700000),Y=(Min=1.6700000,Max=1.6700000),Z=(Min=1.6700000,Max=1.6700000))
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
