class DefibFistsPickup extends BallisticWeaponPickup;

var() int HealingAmount;
var() bool bSuperHeal;
var() float AdrenalineAmount;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Defist.LCestus');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Defist.LCestus');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupLo');
	//return;	
}

static simulated function UpdateHUD(HUD H)
{
	H.LastPickupTime = H.Level.TimeSeconds;
	H.LastHealthPickupTime = H.LastPickupTime;
	H.LastWeaponPickupTime = H.LastPickupTime;
	//return;	
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
	return default.PickupMessage $ string(default.HealingAmount);
	//return;	
}

function int GetHealMax(Pawn P)
{
	// End:0x1A
	if(bSuperHeal)
	{
		return int(P.SuperHealthMax);
	}
	return int(P.HealthMax);
	//return;	
}

auto state Pickup
{
	function BeginState()
	{
		// End:0x36
		if(!bDropped && Class<BallisticWeapon>(InventoryType) != none)
		{
			MagAmmo = Class<BallisticWeapon>(InventoryType).default.MagAmmo;
		}
		super.BeginState();
		//return;		
	}

	function Touch(Actor Other)
	{
		local Pawn P;
		local xPawn X;

		X = xPawn(Other);
		// End:0x8B
		if(ValidTouch(Other))
		{
			P = Pawn(Other);
			// End:0x8B
			if(P.GiveHealth(HealingAmount, GetHealMax(P)) || bSuperHeal && !Level.Game.bTeamGame)
			{
				AnnouncePickup(P);
				SetRespawn();
			}
		}
		//return;		
	}

	function bool ValidTouch(Actor Other)
	{
		// End:0x63
		if(((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none)
		{
			return false;
		}
		// End:0x80
		if(!FastTrace(Other.Location, Location))
		{
			return false;
		}
		// End:0xCE
		if(Level.Game.PickupQuery(Pawn(Other), self))
		{
			LastPickedUpBy = Pawn(Other);
			TriggerEvent(Event, self, Pawn(Other));
			return true;
		}
		return false;
		//return;		
	}
	stop;	
}

defaultproperties
{
	HealingAmount=50
	bSuperHeal=true
	AdrenalineAmount=100.0000000
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.DefibFists.DefibFistsPickupLo'
	PickupDrawScale=1.0000000
	InventoryType=Class'BWBP_OP_Pro.DefibFists'
	RespawnTime=70.0000000
	PickupMessage="You got the Combat Defibrillators."
	StaticMesh=StaticMesh'BWBP_SKC_Static.DefibFists.DefibFistsPickupHi'
	Physics=0
	DrawScale=0.8200000
	TransientSoundVolume=0.6000000
	TransientSoundRadius=128.0000000
	CollisionRadius=16.0000000
	CollisionHeight=28.0000000
	Mass=10.0000000
}
