class G28PrimaryFire extends BallisticHandGrenadeFire;

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

function float CalculateDetonateDelay(float DetonateDelay)
{
	// End:0x2E
	if(BallisticHandGrenade(Weapon).ClipReleaseTime == float(666))
	{
		return DetonateDelay - float(3);		
	}
	else
	{
		// End:0x79
		if(BallisticHandGrenade(Weapon).ClipReleaseTime > 0.0000000)
		{
			return DetonateDelay - (Level.TimeSeconds - BallisticHandGrenade(Weapon).ClipReleaseTime);			
		}
		else
		{
			return DetonateDelay;
		}
	}
	//return;	
}

defaultproperties
{
	NoClipPreFireAnim="PrepThrowAlt"
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_G28Grenades'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SKC_Pro.G28Thrown'
}
