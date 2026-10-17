class KHMKIIRocketFlare extends Effects;

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
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	DrawScale=0.1000000
	Skins[0]=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	Style=3
	Mass=13.0000000
}
