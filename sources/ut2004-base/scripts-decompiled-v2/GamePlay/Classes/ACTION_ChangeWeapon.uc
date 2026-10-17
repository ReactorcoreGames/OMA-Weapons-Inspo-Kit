class ACTION_ChangeWeapon extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) Class<Weapon> newWeapon;

function bool InitActionFor(ScriptedController C)
{
	C.Pawn.PendingWeapon = Weapon(C.Pawn.FindInventoryType(newWeapon));
	C.Pawn.ChangedWeapon();
	return false;
	//return;	
}

