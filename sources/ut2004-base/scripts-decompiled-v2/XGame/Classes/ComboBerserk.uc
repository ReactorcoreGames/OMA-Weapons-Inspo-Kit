class ComboBerserk extends Combo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var xEmitter Effect;

function StartEffect(xPawn P)
{
	// End:0x49
	if(int(P.Role) == int(ROLE_Authority))
	{
		Effect = Spawn(Class'XEffects.OffensiveEffect', P,, P.Location, P.Rotation);
	}
	// End:0x75
	if(P.Weapon != none)
	{
		P.Weapon.StartBerserk();
	}
	P.bBerserk = true;
	//return;	
}

function StopEffect(xPawn P)
{
	local Inventory Inv;

	// End:0x17
	if(Effect != none)
	{
		Effect.Destroy();
	}
	Inv = P.Inventory;
	J0x2B:

	// End:0x75 [Loop If]
	if(Inv != none)
	{
		// End:0x5E
		if(Inv.IsA('Weapon'))
		{
			Weapon(Inv).StopBerserk();
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x2B;
	}
	P.bBerserk = false;
	//return;	
}

defaultproperties
{
	ExecMessage="Berserk!"
	ComboAnnouncementName="Berzerk"
	keys[0]=2
	keys[1]=2
	keys[2]=1
	keys[3]=1
}
