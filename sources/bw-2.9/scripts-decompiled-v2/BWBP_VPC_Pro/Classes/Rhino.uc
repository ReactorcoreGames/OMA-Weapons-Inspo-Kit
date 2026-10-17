class Rhino extends ONSPRV
	config(User);

event TakeImpactDamage(float AccelMag)
{
	// End:0xC5
	if((((Driver != none) && Vehicle(ImpactInfo.Other) != none) && Vehicle(ImpactInfo.Other).GetTeamNum() != Controller.Pawn.GetTeamNum()) && (Normal(ImpactInfo.pos - Location) Dot Vector(Rotation)) >= 0.7500000)
	{
		ImpactInfo.Other.TakeDamage(int(AccelMag * 0.0250000), self, ImpactInfo.pos, ImpactInfo.impactVel * 0.7000000, Class'Onslaught.DamTypeONSVehicle');
	}
	super(ONSVehicle).TakeImpactDamage(AccelMag);
	//return;	
}

function float ImpactDamageModifier()
{
	local float Multiplier;

	// End:0x34
	if((Normal(ImpactInfo.pos - Location) Dot Vector(Rotation)) >= 0.7500000)
	{
		Multiplier = 0.0050000;		
	}
	else
	{
		Multiplier = 1.0000000;
	}
	return super(ONSWheeledCraft).ImpactDamageModifier() * Multiplier;
	//return;	
}

defaultproperties
{
	TorqueCurve=(Points=((InVal=0.0000000,OutVal=40.0000000),(InVal=200.0000000,OutVal=19.0000000),(InVal=1500.0000000,OutVal=20.0000000),(InVal=2800.0000000,OutVal=0.0000000)))
	TransRatio=0.1500000
	PassengerWeapons[0]=(WeaponPawnClass=Class'BWBP_VPC_Pro.RhinoMGPawn',WeaponBone="Dummy01")
	PassengerWeapons[1]=(WeaponPawnClass=Class'Onslaught.ONSPRVRearGunPawn',WeaponBone="Dummy02")
	ImpactDamageMult=0.0003000
	VehicleMass=6.0000000
	VehiclePositionString="in a Rhino"
	VehicleNameString="Rhino"
}
