class XMV500Minigun_TW extends XMV500Minigun
	transient
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

function InitAutoTurretWeapon(BallisticAutoTurret AutoTurret)
{
	Ammo[0].AmmoAmount = AutoTurret.AmmoAmount[0];
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	FireMode[0].FireAnim = 'Idle';
	FireMode[0].FireLoopAnim = 'Idle';
	bFireMode[0].FirePushbackForce = 0.0000000;
	BallisticFire(FireMode[0]).BrassOffset = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

simulated function Notify_Undeploy()
{
	PlaySound(UndeploySound, 3, 0.7000000,, 64.0000000, 1.0000000, true);
	// End:0x51
	if((BallisticAutoTurret(Instigator) != none) && int(Role) == int(ROLE_Authority))
	{
		BallisticAutoTurret(Instigator).UndeployTurret();
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

simulated event RenderOverlays(Canvas C)
{
	DisplayFOV = Instigator.Controller.FovAngle;
	super.RenderOverlays(C);
	//return;	
}

simulated function ApplyAimRotation()
{
	ApplyAimToView();
	BallisticAutoTurret(Instigator).WeaponPivot = GetFireRot() * (DisplayFOV / Instigator.Controller.FovAngle);
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

defaultproperties
{
	ParamsClasses[0]=Class'BWBP_APC_Pro.XMV500TW_WeaponParams'
	ParamsClasses[1]=Class'BWBP_APC_Pro.XMV500TW_WeaponParams'
	ParamsClasses[2]=none
	ParamsClasses[3]=Class'BWBP_APC_Pro.XMV500TW_WeaponParams'
	ParamsClasses[4]=Class'BWBP_APC_Pro.XMV500TW_WeaponParams'
	bUseSights=false
	bUseSpecialAim=true
	GunLength=0.0000000
	FireModeClass=Class'BWBP_APC_Pro.XMV500TW_PrimaryFire'
	SelectAnim="Deploy"
	SelectAnimRate=1.0000000
	BringUpTime=1.4000000
	bCanThrow=false
	bNoInstagibReplace=true
	DisplayFOV=90.0000000
	ClientState=2
	Priority=1
	PlayerViewOffset=(X=20.0000000,Y=0.0000000,Z=-50.0000000)
	ItemName="XMB-500 Smart Minigun Turret"
	DrawScale=0.3500000
}
