class BulldogHeadlight extends DynamicProjector;

function Tick(float Delta)
{
	//return;	
}

defaultproperties
{
	FrameBufferBlendingOp=3
	ProjTexture=Texture'VehicleFX.Projected.BullHeadlights'
	FOV=30
	MaxTraceDistance=2048
	bClipBSP=true
	bProjectOnUnlit=true
	bGradient=true
	bProjectOnAlpha=true
	bProjectOnParallelBSP=true
	bLightChanged=true
	DrawScale=0.6500000
	bHardAttach=true
}
