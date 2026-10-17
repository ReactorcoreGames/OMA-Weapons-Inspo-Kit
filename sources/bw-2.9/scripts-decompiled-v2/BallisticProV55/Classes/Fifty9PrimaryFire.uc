class Fifty9PrimaryFire extends BallisticProInstantFire;

function EjectBrass()
{
	local Vector Start, X, Y, Z;
	local Coords C;
	local Actor BrassActor;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4C
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x59
	if(BrassClass == none)
	{
		return;
	}
	// End:0x97
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB2
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	C = Weapon.GetBoneCoords(BrassBone);
	Weapon.GetViewAxes(X, Y, Z);
	Start = ((C.Origin + (X * BrassOffset.X)) + (Y * BrassOffset.Y)) + (Z * BrassOffset.Z);
	BrassActor = Spawn(BrassClass, Weapon,, Start, Rotator(C.XAxis));
	// End:0x21F
	if(BrassActor != none)
	{
		BrassActor.bHidden = true;
		Fifty9MachinePistol(Weapon).UziBrassList.Length = Fifty9MachinePistol(Weapon).UziBrassList.Length + 1;
		Fifty9MachinePistol(Weapon).UziBrassList[Fifty9MachinePistol(Weapon).UziBrassList.Length - 1].Actor = BrassActor;
		Fifty9MachinePistol(Weapon).UziBrassList[Fifty9MachinePistol(Weapon).UziBrassList.Length - 1].KillTime = Level.TimeSeconds + 0.1500000;
	}
	//return;	
}

defaultproperties
{
	BrassClass=Class'BallisticProV55.Brass_Uzi'
	BrassOffset=(X=-18.0000000,Y=0.0000000,Z=0.0000000)
	bDryUncock=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_FiftyNine'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
