class ONSTurretController extends TurretController
	config(User);

function Possess(Pawn aPawn)
{
	super.Possess(aPawn);
	// End:0x55
	if((ONSWeaponPawn(aPawn) != none) && ONSWeaponPawn(aPawn).Gun != none)
	{
		ONSWeaponPawn(aPawn).Gun.bActive = true;
	}
	//return;	
}

function bool SameTeamAs(Controller C)
{
	// End:0x35
	if((ONSStationaryWeaponPawn(Pawn) == none) || ONSStationaryWeaponPawn(Pawn).bPowered)
	{
		return super(Controller).SameTeamAs(C);
	}
	return true;
	//return;	
}

state Engaged
{
	function BeginState()
	{
		Focus = Enemy;
		Target = Enemy;
		bFire = 1;
		Pawn.Fire(0.0000000);
		//return;		
	}
	stop;	
}

state WaitForTarget
{
	function BeginState()
	{
		Target = Enemy;
		bFire = 1;
		Pawn.Fire(0.0000000);
		//return;		
	}
	stop;	
}

