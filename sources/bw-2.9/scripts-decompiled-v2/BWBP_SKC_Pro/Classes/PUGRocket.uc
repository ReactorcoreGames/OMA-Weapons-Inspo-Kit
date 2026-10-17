class PUGRocket extends LS14Rocket;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PUGCloudControl C;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xD5
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BWBP_SKC_Pro.PUGCloudControl', self,, HitLocation - (HitNormal * float(2)));
		// End:0xD5
		if(C != none)
		{
			C.Instigator = Instigator;
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	ImpactManager=Class'BWBP_SKC_Pro.IM_TearGasProjLarge'
	TrailClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTPugFRAGRadius'
	MotionBlurRadius=130.0000000
	AccelSpeed=50000.0000000
	Speed=200.0000000
	MaxSpeed=100000.0000000
	Damage=90.0000000
	DamageRadius=96.0000000
	MomentumTransfer=0.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTPugFRAG'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
}
