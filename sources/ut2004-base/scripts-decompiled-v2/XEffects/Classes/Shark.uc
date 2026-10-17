class Shark extends Decoration;

simulated function PostBeginPlay()
{
	LoopAnim('Path');
	super(Actor).PostBeginPlay();
	//return;	
}

defaultproperties
{
	bStatic=false
	bNoDelete=true
	Mesh=SkeletalMesh'XEffects.SharkMesh'
	// Reference: FinalBlend'XEffects.Shark.SharkFB'
	begin object name="SharkFB" class=Engine.FinalBlend
		FrameBufferBlending=2
		AlphaRef=80
	end object
	Skins[0]=SharkFB
	bShouldBaseAtStartup=false
	CollisionRadius=0.0000000
	CollisionHeight=0.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FinalBlend'XEffects.Shark.SharkFB'
begin object name="SharkFB" class=Engine.FinalBlend
	FrameBufferBlending=2
	AlphaRef=80
end object
