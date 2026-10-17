class FlakGlow extends ScaledSprite;

function PostBeginPlay()
{
	// End:0x13
	if(Owner != none)
	{
		SetBase(Owner);
	}
	//return;	
}

singular function BaseChange()
{
	//return;	
}

defaultproperties
{
	bStatic=false
	bStasis=false
	RemoteRole=0
	Texture=Texture'XEffects.GoldGlow'
	DrawScale=0.2500000
	Style=3
	bUnlit=true
	bShouldBaseAtStartup=false
	bHardAttach=true
	Mass=0.0000000
}
