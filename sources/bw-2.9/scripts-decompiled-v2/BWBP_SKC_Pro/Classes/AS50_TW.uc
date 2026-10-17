class AS50_TW extends AS50Rifle
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var() Sound MountFireSound;

function InitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	// End:0x48
	if(!Instigator.IsLocallyControlled())
	{
		ClientInitWeaponFromTurret(Turret);
	}
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

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

function InitTurretWeapon(BallisticTurret Turret)
{
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	//return;	
}

simulated function PostBeginPlay()
{
	super(BallisticWeapon).PostBeginPlay();
	bFireMode[0].FirePushbackForce = 0.0000000;
	bFireMode[0].BrassOffset = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

simulated function Notify_Undeploy()
{
	// End:0x36
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

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super(BallisticWeapon).GiveTo(Other, Pickup);
	//return;	
}

simulated event Timer()
{
	local int Mode;

	AimComponent.Reaim(0.1000000);
	// End:0x185
	if(int(ClientState) == int(2))
	{
		Mode = 0;
		J0x2B:

		// End:0x67 [Loop If]
		if(Mode < 2)
		{
			// End:0x5D
			if(FireMode[Mode] != none)
			{
				FireMode[Mode].InitEffects();
			}
			Mode++;
			// [Loop Continue]
			goto J0x2B;
		}
		PlayIdle();
		ClientState = 4;
		// End:0xEC
		if(((int(CrosshairMode) != int(2)) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = false;
		}
		// End:0x106
		if(bNeedCock)
		{
			// End:0x106
			if(MagAmmo > 0)
			{
				CommonCockGun();
			}
		}
		// End:0x118
		if(int(Role) < int(ROLE_Authority))
		{
			return;
		}
		// End:0x157
		if(ThirdPersonActor != none)
		{
			ThirdPersonActor.Destroy();
			ThirdPersonActor = Spawn(AttachmentClass, Owner);
			InventoryAttachment(ThirdPersonActor).InitFor(self);
		}
		ThirdPersonActor.SetLocation(Instigator.Location);
		ThirdPersonActor.SetBase(Instigator);		
	}
	else
	{
		// End:0x26F
		if(int(ClientState) == int(3))
		{
			// End:0x1B3
			if(SightFX != none)
			{
				SightFX.Destroy();
				SightFX = none;
			}
			// End:0x1D8
			if(Instigator.PendingWeapon == none)
			{
				PlayIdle();
				ClientState = 4;				
			}
			else
			{
				ClientState = 1;
				Instigator.ChangedWeapon();
				Mode = 0;
				J0x1F6:

				// End:0x232 [Loop If]
				if(Mode < 2)
				{
					// End:0x228
					if(FireMode[Mode] != none)
					{
						FireMode[Mode].DestroyEffects();
					}
					Mode++;
					// [Loop Continue]
					goto J0x1F6;
				}
				// End:0x26C
				if((PlayerSpeedFactor != float(0)) && PlayerSpeedUp)
				{
					Instigator.GroundSpeed *= (float(1) / PlayerSpeedFactor);
					PlayerSpeedUp = false;
				}
			}			
		}
		else
		{
			// End:0x2B1
			if(((int(ClientState) == int(0)) && Instigator.PendingWeapon == none) && bNeedCock)
			{
				// End:0x2B1
				if(MagAmmo > 0)
				{
					CommonCockGun();
				}
			}
		}
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim == 'Undeploy')
	{
		Notify_Undeploy();
		return;
	}
	super(BallisticWeapon).AnimEnd(Channel);
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

simulated function PlayReload()
{
	ReloadAnim = 'Reload';
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function Notify_CockAfterReload()
{
	// End:0x1E
	if(bNeedCock && MagAmmo > 0)
	{
		CommonCockGun(2);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x2B
	if((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x70
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	ParamsClasses[0]=Class'BWBP_SKC_Pro.FG50TW_WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.FG50TW_WeaponParamsComp'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical'
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-ClipHit',Volume=0.0000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-ClipOut',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-ClipIn',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SightingTime=0.0000010
	bUseSpecialAim=true
	GunLength=0.0000000
	SelectAnim="Deploy"
	BringUpTime=1.0000000
	bCanThrow=false
	bNoInstagibReplace=true
	DisplayFOV=90.0000000
	ClientState=2
	Priority=1
	PlayerViewOffset=(X=-80.0000000,Y=4.0000000,Z=-5.0000000)
	ItemName="FG50 Turret"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FSSG-50Turret_FPm'
	DrawScale=0.5000000
	CollisionHeight=24.0000000
}
