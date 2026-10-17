class RocketCorona extends Effects;

auto state Start
{
	simulated function Tick(float dt)
	{
		SetDrawScale(FMin(DrawScale + (dt * 12.0000000), 1.5000000));
		// End:0x36
		if(DrawScale >= 1.5000000)
		{
			GotoState('End');
		}
		//return;		
	}
	stop;	
}

state End
{
	simulated function Tick(float dt)
	{
		SetDrawScale(FMax(DrawScale - (dt * 12.0000000), 0.9000000));
		// End:0x36
		if(DrawScale <= 0.9000000)
		{
			GotoState('None');
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	bTrailerSameRotation=true
	Physics=10
	Texture=Texture'XEffects.RocketFlare'
	DrawScale=1.2000000
	DrawScale3D=(X=0.7000000,Y=0.3500000,Z=0.3500000)
	Skins[0]=Texture'XEffects.RocketFlare'
	Style=3
	Mass=13.0000000
}
