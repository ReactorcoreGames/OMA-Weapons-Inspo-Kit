class Ballistic_ComboMiniMe extends Combo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function StartEffect(xPawn P)
{
	// End:0xA1
	if(int(P.Role) == int(ROLE_Authority))
	{
		P.SetDrawScale(0.5000000 * P.default.DrawScale);
		P.SetCollisionSize(P.CollisionRadius, 0.5000000 * P.CollisionHeight);
		P.BaseEyeHeight = 0.5000000 * P.default.BaseEyeHeight;
		P.bCanCrouch = false;
	}
	BallisticPawn(P).ClientSetCrouchAbility(false);
	//return;	
}

function StopEffect(xPawn P)
{
	// End:0x73
	if(int(P.Role) == int(ROLE_Authority))
	{
		P.SetDrawScale(P.default.DrawScale);
		P.BaseEyeHeight = P.default.BaseEyeHeight;
		P.ForceCrouch();
		P.bCanCrouch = true;
	}
	BallisticPawn(P).ClientSetCrouchAbility(true);
	//return;	
}

defaultproperties
{
	ExecMessage="Pint-Sized!"
	Duration=40.0000000
	ComboAnnouncementName="Pint_sized"
	keys[0]=2
	keys[1]=2
	keys[2]=1
	keys[3]=1
}
