class MACWeapon_TW extends MACWeapon
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

simulated function ApplyAimToView()
{
	local Rotator AimPivotDelta, RecoilPivotDelta;

	// End:0x47
	if(((Instigator.Controller == none) || AIController(Instigator.Controller) != none) || !Instigator.IsLocallyControlled())
	{
		return;
	}
	RecoilPivotDelta = RcComponent.CalcViewPivotDelta();
	AimPivotDelta = AimComponent.CalcViewPivotDelta();
	// End:0xA2
	if(RcComponent.ShouldUpdateView())
	{
		Instigator.SetViewRotation(AimPivotDelta + RecoilPivotDelta);		
	}
	else
	{
		Instigator.SetViewRotation(AimPivotDelta);
	}
	//return;	
}

simulated function GetViewAxes(out Vector XAxis, out Vector YAxis, out Vector ZAxis)
{
	GetAxes(Instigator.GetViewRotation(), XAxis, YAxis, ZAxis);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x5B
	if((Level.TimeSeconds >= NextBeaconTime) && MACPrimaryFire(FireMode[0]) != none)
	{
		NextBeaconTime = Level.TimeSeconds + float(1);
		MACPrimaryFire(FireMode[0]).TurretLaunchBeacon();
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local int i;

	super.BringUp(PrevWeapon);
	SetBoneScale(2, 1.0000000, Shells[2]);
	i = 0;
	J0x27:

	// End:0xB1 [Loop If]
	if(i < 2)
	{
		// End:0x8C
		if((bPendingShellLoad && MagAmmo <= i) || !bPendingShellLoad && (MagAmmo - 1) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i]);
			// [Explicit Continue]
			goto J0xA7;
		}
		SetBoneScale(i, 1.0000000, Shells[i]);
		J0xA7:

		i++;
		// [Loop Continue]
		goto J0x27;
	}
	//return;	
}

simulated function bool WeaponCentered()
{
	return true;
	//return;	
}

function InitTurretWeapon(BallisticTurret Turret)
{
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	//return;	
}

simulated function PostBeginPlay()
{
	super(BallisticWeapon).PostBeginPlay();
	bFireMode[0].FirePushbackForce = 0.0000000;
	bFireMode[0].FireChaos = 0.0500000;
	bFireMode[0].FireRecoil = 256.0000000;
	BallisticFire(FireMode[0]).BrassOffset = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(BallisticWeapon).PostNetBeginPlay();
	// End:0x7B
	if(((BallisticTurret(Owner) != none) && BallisticTurret(Owner).bWeaponDeployed) || (BallisticTurret(Instigator) != none) && BallisticTurret(Instigator).bWeaponDeployed)
	{
		SelectAnim = IdleAnim;
		SelectAnimRate = IdleAnimRate;
		BringUpTime = 0.1000000;
	}
	//return;	
}

simulated event Timer()
{
	// End:0x38
	if((int(ClientState) == int(2)) && BallisticTurret(Instigator) != none)
	{
		BallisticTurret(Instigator).bWeaponDeployed = true;
	}
	super(BallisticWeapon).Timer();
	//return;	
}

simulated function Notify_Undeploy()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7B [Loop If]
	if(i < Beacons.Length)
	{
		// End:0x44
		if(Beacons[i].Trail != none)
		{
			Beacons[i].Trail.Destroy();
		}
		// End:0x71
		if(Beacons[i].Sphere != none)
		{
			Beacons[i].Sphere.Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	PlaySound(UndeploySound, 3, 0.7000000,, 64.0000000, 1.0000000, true);
	// End:0xCC
	if((BallisticTurret(Instigator) != none) && int(Role) == int(ROLE_Authority))
	{
		BallisticTurret(Instigator).UndeployTurret();
	}
	//return;	
}

simulated function Notify_Deploy()
{
	//return;	
}

simulated function PreDrawFPWeapon()
{
	SetRotation(Instigator.Rotation);
	//return;	
}

function AttachToPawn(Pawn P)
{
	Instigator = P;
	// End:0x41
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);		
	}
	else
	{
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	ThirdPersonActor.SetLocation(P.Location);
	ThirdPersonActor.SetBase(P);
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	DisplayFOV = Instigator.Controller.FovAngle;
	super.RenderOverlays(C);
	//return;	
}

simulated function ApplyAimRotation()
{
	ApplyAimToView();
	BallisticTurret(Instigator).WeaponPivot = GetFireRot() * (DisplayFOV / Instigator.Controller.FovAngle);
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

defaultproperties
{
	ParamsClasses[0]=Class'BallisticProV55.MACTW_WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MACTW_WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MACTW_WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MACTW_WeaponParamsTactical'
	bUseSpecialAim=true
	GunLength=0.0000000
	FireModeClass=Class'BallisticProV55.MACTW_PrimaryFire'
	SelectAnim="Deploy"
	BringUpTime=1.5000000
	bCanThrow=false
	bNoInstagibReplace=true
	DisplayFOV=90.0000000
	ClientState=2
	Priority=1
	PlayerViewOffset=(X=-2.0000000,Y=0.0000000,Z=5.0000000)
	ItemName="HAMR Turret"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HAMRTurret_FPm'
	DrawScale=0.2500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=8.0000000)
}
