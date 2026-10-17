class BallisticTurretIntermediary extends Actor
	notplaceable;

var Pawn myPawn;
var Class<BallisticWeapon> GunClass;
var BallisticWeapon BW;
var int MagAmmo;
var byte LayoutIndex;
var byte CamoIndex;
var int TurretAmmoAmount;
var int WeaponMode;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientConfirmWeaponReceived, GunClass;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAcknowledgeWepReceive;
}

function PostBeginPlay()
{
	SetTimer(0.2000000, false);
	//return;	
}

simulated function Timer()
{
	// End:0x143
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x36
		if((myPawn == none) || myPawn.Health == 0)
		{
			Destroy();
			return;
		}
		// End:0x4D
		if(BW != none)
		{
			BW.Destroy();
		}
		// End:0x137
		if((myPawn.Controller != none) && PlayerController(myPawn.Controller).AcknowledgedPawn == myPawn)
		{
			BW = Spawn(GunClass, myPawn,,, rot(0, 0, 0));
			// End:0x131
			if(BW != none)
			{
				BW.GenerateLayout(LayoutIndex);
				BW.GenerateCamo(CamoIndex);
				BW.GiveTo(myPawn);
				BW.MagAmmo = MagAmmo;
				BW.SetAmmoTo(TurretAmmoAmount, 0);
				BW.CurrentWeaponMode = byte(WeaponMode);
			}
			ClientConfirmWeaponReceived();
		}
		SetTimer(1.0000000, false);		
	}
	else
	{
		// End:0x171
		if(Controller(Owner).Pawn.FindInventoryType(GunClass) != none)
		{
			ServerAcknowledgeWepReceive();
		}
	}
	//return;	
}

simulated function ClientConfirmWeaponReceived()
{
	SetTimer(0.1000000, false);
	//return;	
}

function ServerAcknowledgeWepReceive()
{
	SetTimer(0.0000000, false);
	Destroy();
	//return;	
}

defaultproperties
{
	bHidden=true
	bOnlyRelevantToOwner=true
	RemoteRole=2
}
