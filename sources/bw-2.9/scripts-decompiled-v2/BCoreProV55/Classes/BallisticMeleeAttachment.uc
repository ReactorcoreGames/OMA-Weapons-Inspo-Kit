class BallisticMeleeAttachment extends BallisticAttachment;

var bool BlockNotify;
var name MeleeOffhandStrikeAnim;
var name MeleeAltStrikeAnim;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		BlockNotify;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	bHeavy = true;
	//return;	
}

function SetBlocked(bool bNewAimed)
{
	bIsAimed = bNewAimed;
	// End:0x2D
	if(bIsAimed)
	{
		Instigator.SetAnimAction('Raise');		
	}
	else
	{
		Instigator.SetAnimAction('Lower');
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(BlockNotify != default.BlockNotify)
	{
		default.BlockNotify = BlockNotify;
		BlockHitEffects();
	}
	super.PostNetReceive();
	//return;	
}

simulated function BlockHitEffects()
{
	local Rotator R;

	R = Instigator.GetViewRotation();
	R.Pitch += (-4000 + Rand(8000));
	R.Yaw += (-5000 + Rand(10000));
	// End:0xC3
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && ImpactManager != none)
	{
		ImpactManager.static.StartSpawn((Instigator.Location + Instigator.EyePosition()) + (Vector(R) * float(12)), Vector(Instigator.Rotation), 3, Instigator);
	}
	//return;	
}

simulated function PlayPawnFiring(byte Mode)
{
	// End:0x12
	if(xPawn(Instigator) == none)
	{
		return;
	}
	// End:0xDA
	if(!Instigator.IsA('BallisticPawn'))
	{
		// End:0x88
		if(((int(TrackAnimMode) == int(2)) || (int(TrackAnimMode) == int(0)) && int(Mode) == 0) || (int(TrackAnimMode) == int(1)) && int(Mode) == 1)
		{
			PlayPawnTrackAnim(Mode);			
		}
		else
		{
			// End:0xB3
			if(int(FiringMode) == 0)
			{
				xPawn(Instigator).StartFiring(true, bRapidFire);				
			}
			else
			{
				xPawn(Instigator).StartFiring(true, bAltRapidFire);
			}
			SetTimer(WeaponLightTime, false);
		}		
	}
	else
	{
		xPawn(Instigator).StartFiring(int(Mode) == 1, false);
	}
	//return;	
}

function UpdateBlockHit()
{
	BlockNotify = !BlockNotify;
	BlockHitEffects();
	//return;	
}

defaultproperties
{
	MeleeAltStrikeAnim="Blade_Smash"
	IdleHeavyAnim="Blade_Idle"
	IdleRifleAnim="Blade_Idle"
	MeleeStrikeAnim="Blade_Swing"
	MeleeBlockAnim="Blade_Block"
}
