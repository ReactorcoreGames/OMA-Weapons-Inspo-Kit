class G28SecondaryFire extends G28PrimaryFire;

function PlayPreFire()
{
	Weapon.SetBoneScale(0, 1.0000000, G28Grenade(Weapon).GrenadeBone);
	Weapon.SetBoneScale(1, 0.0000000, G28Grenade(Weapon).PinBone);
	// End:0x89
	if(BallisticHandGrenade(Weapon).ClipReleaseTime > float(0))
	{
		Weapon.PlayAnim(NoClipPreFireAnim, PreFireAnimRate, TweenTime);		
	}
	else
	{
		Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
	}
	//return;	
}

defaultproperties
{
	NoClipPreFireAnim="PrepRollAlt"
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=-14.0000000)
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	ProjectileClass=Class'BWBP_SKC_Pro.G28Rolled'
}
