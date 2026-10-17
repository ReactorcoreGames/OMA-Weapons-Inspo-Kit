class WendigoSecondaryFire extends BallisticProProjectileFire;

function DoFireEffect()
{
	local Vector StartTrace, StartProj, X, Y, Z, Start,
		End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other, Other2;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Other = Trace(HitLocation, HitNormal, StartTrace, Start, true);
	// End:0xED
	if(Other != none)
	{
		StartProj = HitLocation;
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other2 = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x18E
	if(Other == none)
	{
		// End:0x17B
		if(Other2 != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);		
	}
	else
	{
		SpawnProjectile(StartProj, Aim);
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	//return;	
}

defaultproperties
{
	FlashBone="tip2"
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7500000
	FireRecoil=768.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=128.0000000
	YInaccuracy=128.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket2',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireAlt"
	FireEndAnim="None"
	FireRate=0.9000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	AmmoPerFire=20
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.Wendigo_EMPTorpedo'
	BotRefireRate=0.7000000
}
