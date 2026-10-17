class Mut_BWVehicles extends Mutator
	config(BallisticVehiclesProV55)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct VSwap
{
	var() config array< Class<Vehicle> > NewVehicles;
	var() config Class<Vehicle> OldVehicle;
};

var() config array<VSwap> Swaps;

function PostBeginPlay()
{
	SetTimer(60.0000000, true);
	Timer();
	super(Actor).PostBeginPlay();
	//return;	
}

event Timer()
{
	local int i, j;
	local ONSVehicleFactory FactoryONS;
	local ASVehicleFactory FactoryAS;

	// End:0x8B
	foreach AllActors(Class'Onslaught.ONSVehicleFactory', FactoryONS)
	{
		i = 0;
		J0x17:

		// End:0x8A [Loop If]
		if(i < Swaps.Length)
		{
			// End:0x80
			if(Swaps[i].OldVehicle == FactoryONS.VehicleClass)
			{
				FactoryONS.VehicleClass = Swaps[i].NewVehicles[Rand(Swaps[i].NewVehicles.Length)];
				// End:0x8A
				continue;
			}
			i++;
			// [Loop Continue]
			goto J0x17;
		}		
	}	
	// End:0x117
	foreach AllActors(Class'UT2k4Assault.ASVehicleFactory', FactoryAS)
	{
		j = 0;
		J0xA3:

		// End:0x116 [Loop If]
		if(j < Swaps.Length)
		{
			// End:0x10C
			if(Swaps[j].OldVehicle == FactoryAS.VehicleClass)
			{
				FactoryAS.VehicleClass = Swaps[j].NewVehicles[Rand(Swaps[j].NewVehicles.Length)];
				// End:0x116
				continue;
			}
			j++;
			// [Loop Continue]
			goto J0xA3;
		}		
	}	
	//return;	
}

defaultproperties
{
	Swaps[0]=(NewVehicles=(Class'BWBP_VPC_Pro.DCTVThorTank'),OldVehicle=Class'Onslaught.ONSHoverTank')
	Swaps[1]=(NewVehicles=(Class'BWBP_VPC_Pro.Albatross'),OldVehicle=Class'Onslaught.ONSAttackCraft')
	Swaps[2]=(NewVehicles=(Class'BWBP_VPC_Pro.KHMKII'),OldVehicle=Class'OnslaughtBP.ONSDualAttackCraft')
	Swaps[3]=(NewVehicles=(Class'BWBP_VPC_Pro.LeopardTank'),OldVehicle=Class'Onslaught.ONSPRV')
	Swaps[4]=(NewVehicles=(Class'BWBP_VPC_Pro.StingRay'),OldVehicle=Class'Onslaught.ONSHoverBike')
	Swaps[5]=(NewVehicles=(Class'BWBP_VPC_Pro.Tarantula'),OldVehicle=Class'Onslaught.ONSRV')
	OldVehicle=Class'Onslaught.ONSRV'
}
