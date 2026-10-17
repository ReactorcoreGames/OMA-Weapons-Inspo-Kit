class XOXOPrimaryFire extends BallisticProProjectileFire;

state Bomb
{
	simulated function Vector GetFireSpread()
	{
		local float fX;
		local Rotator R;

		// End:0x1C
		if(BW.bScopeView)
		{
			return super(BallisticProProjectileFire).GetFireSpread();			
		}
		else
		{
			fX = FRand();
			R.Yaw = int((float(2048) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
			R.Pitch = int((float(2048) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
			return Vector(R);
		}
		//return;		
	}
	stop;	
}

state Shockwave
{
	simulated function bool AllowFire()
	{
		// End:0x57
		if((!XOXOStaff(BW).bLoveMode && XOXOStaff(BW).Lewdness < float(1)) || XOXOStaff(BW).Lewdness < 0.5000000)
		{
			return false;
		}
		return super(BallisticFire).AllowFire();
		//return;		
	}

	function DoFireEffect()
	{
		XOXOStaff(BW).Shockwave();
		XOXOAttachment(BW.ThirdPersonActor).Shockwave3rd();
		XOXOStaff(BW).AddLewd(-1.5000000);
		super(BallisticFire).DoFireEffect();
		//return;		
	}
	stop;	
}

state Sexplosion
{
	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0xEC
		if(bIsJammed)
		{
			// End:0xC3
			if(BW.FireCount == 0)
			{
				bIsJammed = false;
				// End:0x6A
				if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
				{
					ConsumedLoad += int(load);
					Timer();
				}
				// End:0xB3
				if(int(UnjamMethod) == int(3))
				{
					NextFireTime += FireRate;
					NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
					BW.FireCount++;
					return;
				}
				// End:0xC0
				if(!AllowFire())
				{
					return;
				}				
			}
			else
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				return;
			}
		}
		// End:0x16C
		if(BW != none)
		{
			BW.bPreventReload = true;
			BW.FireCount++;
			// End:0x16C
			if(int(BW.ReloadState) != int(0))
			{
				// End:0x15B
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					BW.bServerReloading = false;
				}
				BW.ReloadState = 0;
			}
		}
		// End:0x18D
		if(MaxHoldTime > 0.0000000)
		{
			HoldTime = FMin(HoldTime, MaxHoldTime);
		}
		ConsumedLoad += int(load);
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
		// End:0x2D9
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			// End:0x1F6
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x232
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
			// End:0x2D9
			if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
			{
				Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
			}
		}
		// End:0x301
		if(!BW.bScopeView)
		{
			BW.AddFireChaos(FireChaos);
		}
		// End:0x32E
		if(Instigator.IsLocallyControlled())
		{
			ShakeView();
			PlayFiring();
			FlashMuzzleFlash();
			StartMuzzleSmoke();			
		}
		else
		{
			ServerPlayFiring();
		}
		// End:0x37A
		if(bFireOnRelease)
		{
			// End:0x35C
			if(bIsFiring)
			{
				NextFireTime += (MaxHoldTime + FireRate);				
			}
			else
			{
				NextFireTime = Level.TimeSeconds + FireRate;
			}			
		}
		else
		{
			// End:0x410
			if(bBurstMode)
			{
				BurstCount++;
				// End:0x3DF
				if(BurstCount >= MaxBurst)
				{
					NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * 0.2500000)));
					NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
					BurstCount = 0;					
				}
				else
				{
					NextFireTime += (FireRate * 0.7500000);
					NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				}				
			}
			else
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}
		}
		load = float(AmmoPerFire);
		HoldTime = 0.0000000;
		// End:0x494
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		// End:0x50E
		if(BW != none)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
			// End:0x50E
			if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
			{
				BW.bNeedCock = true;
			}
		}
		XOXOStaff(Weapon).ArousalDepleted();
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	FireModes[0]=(mProjClass=Class'BWBP_OP_Pro.XOXOBomb',mFireRate=1.3500000,mFireChaos=0.7500000,mFireSound=Sound'BWBP_OP_Sounds.XOXO.XOXO-FireBig',mFireAnim="Fire",bLoopedAnim=false,mFireEndAnim="None",mRecoil=1024.0000000,mAmmoPerFire=16,TargetState="Bomb",bModeLead=true,bModeInstantHit=false,bModeSplash=true,bModeRecommendSplash=false,mBotRefireRate=0.0000000,mWarnTargetPct=0.0000000)
	FireModes[1]=(mProjClass=none,mFireRate=0.9000000,mFireChaos=0.0000000,mFireSound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Shockwave',mFireAnim="LustWave",bLoopedAnim=false,mFireEndAnim="None",mRecoil=0.0000000,mAmmoPerFire=0,TargetState="Shockwave",bModeLead=false,bModeInstantHit=true,bModeSplash=false,bModeRecommendSplash=true,mBotRefireRate=0.0000000,mWarnTargetPct=0.0000000)
	FireModes[2]=(mProjClass=Class'BWBP_OP_Pro.XOXONukeProjectile',mFireRate=0.5000000,mFireChaos=1.0000000,mFireSound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Sexplosion-Fire',mFireAnim="Fire",bLoopedAnim=false,mFireEndAnim="None",mRecoil=1024.0000000,mAmmoPerFire=1,TargetState="Sexplosion",bModeLead=true,bModeInstantHit=false,bModeSplash=true,bModeRecommendSplash=true,mBotRefireRate=0.0000000,mWarnTargetPct=0.0000000)
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireRecoil=160.0000000
	FireChaos=0.0600000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireAnim="Fire2"
	FireEndAnim="None"
	FireRate=0.1700000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_XOXO'
	AmmoPerFire=3
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.XOXOProjectile'
	WarnTargetPct=0.2000000
}
