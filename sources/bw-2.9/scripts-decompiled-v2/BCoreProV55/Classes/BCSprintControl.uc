class BCSprintControl extends Inventory;

struct SlowInfo
{
	var float factor;
	var float Duration;
};

var float Stamina;
var float MaxStamina;
var() float StaminaDrainRate;
var() float StaminaChargeRate;
var() float StaminaRechargeDelay;
var bool bSprinting;
var bool bSprintActive;
var() float SpeedFactor;
var float SprintRechargeDelay;
var float NextAlignmentCheckTime;
var float JumpDrain;
var array<SlowInfo> ActiveSlows;
var float SlowFactor;
var float NextTimerPop;
var float BaseGroundSpeed;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientDelayRecharge, ClientJumped, 
		bSprintActive;
}

simulated function PostBeginPlay()
{
	StaminaChargeRate = float(Class'BCoreProV55.BallisticReplicationInfo'.default.StaminaChargeRate);
	StaminaDrainRate = float(Class'BCoreProV55.BallisticReplicationInfo'.default.StaminaDrainRate);
	StaminaRechargeDelay = Class'BCoreProV55.BallisticReplicationInfo'.default.StaminaRechargeDelay;
	SpeedFactor = Class'BCoreProV55.BallisticReplicationInfo'.default.SprintSpeedFactor;
	JumpDrain = Class'BCoreProV55.BallisticReplicationInfo'.default.JumpDrain;
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Inventory Inv;

	super(Actor).PostNetBeginPlay();
	// End:0x13
	if(Instigator == none)
	{
		return;
	}
	Inv = Instigator.Inventory;
	J0x27:

	// End:0x6E [Loop If]
	if(Inv != none)
	{
		// End:0x57
		if(BallisticWeapon(Inv) != none)
		{
			BallisticWeapon(Inv).SprintControl = self;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x27;
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	UpdateSpeed();
	//return;	
}

function UpdateSpeed(optional float NewSpeedFactor)
{
	local float NewSpeed;

	NewSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed;
	// End:0x50
	if(BallisticWeapon(Instigator.Weapon) != none)
	{
		NewSpeed *= BallisticWeapon(Instigator.Weapon).PlayerSpeedFactor;
	}
	// End:0x7A
	if(ComboSpeed(xPawn(Instigator).CurrentCombo) != none)
	{
		NewSpeed *= 1.4000000;
	}
	// End:0x8F
	if(bSprintActive)
	{
		NewSpeed *= SpeedFactor;
	}
	NewSpeed *= SlowFactor;
	// End:0xB6
	if(NewSpeedFactor > 0.0000000)
	{
		NewSpeed *= NewSpeedFactor;
	}
	// End:0xE2
	if(Instigator.GroundSpeed != NewSpeed)
	{
		Instigator.GroundSpeed = NewSpeed;
	}
	BaseGroundSpeed = NewSpeed;
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x0E
	if(Instigator == none)
	{
		Destroy();
	}
	TickSprint(dt);
	//return;	
}

function StartSprint()
{
	// End:0x31
	if((AIController(Instigator.Controller) == none) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bEnableSprint)
	{
		return;
	}
	// End:0x87
	if(((((Stamina <= float(0)) || int(Instigator.Physics) != int(1)) || Instigator.bIsCrouched) || bSprintActive) || !CheckDirection())
	{
		return;
	}
	bSprintActive = true;
	// End:0xA0
	if(Instigator != none)
	{
		UpdateSpeed();
	}
	//return;	
}

function StopSprint()
{
	// End:0x16
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bEnableSprint)
	{
		return;
	}
	// End:0x23
	if(!bSprintActive)
	{
		return;
	}
	bSprintActive = false;
	// End:0x3C
	if(Instigator != none)
	{
		UpdateSpeed();
	}
	DelayRecharge();
	ClientDelayRecharge();
	//return;	
}

function OwnerEvent(name EventName)
{
	super.OwnerEvent(EventName);
	// End:0x47
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x47
		if((EventName == 'Jumped') || EventName == 'Dodged')
		{
			Jumped();
			ClientJumped();
		}
	}
	//return;	
}

simulated function DelayRecharge()
{
	SprintRechargeDelay = Level.TimeSeconds + StaminaRechargeDelay;
	//return;	
}

simulated function Jumped()
{
	DelayRecharge();
	Stamina = FMax(0.0000000, Stamina - JumpDrain);
	//return;	
}

simulated function ClientDelayRecharge()
{
	// End:0x1F
	if(int(Level.NetMode) == int(NM_Client))
	{
		DelayRecharge();
	}
	//return;	
}

simulated function ClientJumped()
{
	// End:0x1F
	if(int(Level.NetMode) == int(NM_Client))
	{
		Jumped();
	}
	//return;	
}

simulated function bool CheckDirection()
{
	// End:0x2E
	if((Normal(Instigator.Velocity) Dot Vector(Instigator.Rotation)) < 0.2000000)
	{
		return false;
	}
	NextAlignmentCheckTime = Level.TimeSeconds + 0.3500000;
	return true;
	//return;	
}

simulated function TickSprint(float dt)
{
	// End:0x18C
	if(((bSprintActive && int(Instigator.Physics) != int(2)) && VSize(Instigator.Acceleration) > float(100)) && VSize(Instigator.Velocity) > float(50))
	{
		// End:0xE2
		if(!bSprinting)
		{
			bSprinting = true;
			// End:0xA4
			if(BallisticWeapon(Instigator.Weapon) != none)
			{
				BallisticWeapon(Instigator.Weapon).PlayerSprint(true);
			}
			// End:0xE2
			if((Instigator != none) && Instigator.Inventory != none)
			{
				Instigator.Inventory.OwnerEvent('StartSprint');
			}
		}
		// End:0x111
		if(Instigator.bIsCrouched)
		{
			Stamina -= ((StaminaDrainRate * dt) * 1.5000000);			
		}
		else
		{
			Stamina -= (StaminaDrainRate * dt);
		}
		// End:0x189
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0x189
			if(((Stamina <= float(0)) || int(Instigator.Physics) != int(1)) || (Level.TimeSeconds >= NextAlignmentCheckTime) && !CheckDirection())
			{
				StopSprint();
			}
		}		
	}
	else
	{
		// End:0x2BE
		if(int(Instigator.Physics) != int(2))
		{
			// End:0x22B
			if(bSprinting)
			{
				bSprinting = false;
				// End:0x1ED
				if(BallisticWeapon(Instigator.Weapon) != none)
				{
					BallisticWeapon(Instigator.Weapon).PlayerSprint(false);
				}
				// End:0x22B
				if((Instigator != none) && Instigator.Inventory != none)
				{
					Instigator.Inventory.OwnerEvent('StopSprint');
				}
			}
			// End:0x2BE
			if(Stamina < MaxStamina)
			{
				// End:0x268
				if(VSize(Instigator.Velocity) == float(0))
				{
					Stamina += (StaminaChargeRate * dt);					
				}
				else
				{
					// End:0x293
					if(Instigator.bIsCrouched)
					{
						Stamina += ((StaminaChargeRate * dt) / float(2));
					}
				}
				// End:0x2BE
				if(Level.TimeSeconds > SprintRechargeDelay)
				{
					Stamina += (StaminaChargeRate * dt);
				}
			}
		}
	}
	Stamina = FClamp(Stamina, 0.0000000, MaxStamina);
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	local float ScaleFactor, SprintFactor;

	ScaleFactor = C.ClipX / float(1600);
	// End:0x182
	if(Stamina < MaxStamina)
	{
		SprintFactor = Stamina / MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0xDE
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x107
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

static function AddSlowTo(Pawn P, float myFactor, float myDuration)
{
	local BCSprintControl Control;

	Control = BCSprintControl(P.FindInventoryType(Class'BCoreProV55.BCSprintControl'));
	// End:0x43
	if(Control != none)
	{
		Control.AddSlow(myFactor, myDuration);
	}
	//return;	
}

static function SetSlowTo(Pawn P, float myFactor, float myDuration)
{
	local BCSprintControl Control;

	Control = BCSprintControl(P.FindInventoryType(Class'BCoreProV55.BCSprintControl'));
	// End:0x43
	if(Control != none)
	{
		Control.SetSlow(myFactor, myDuration);
	}
	//return;	
}

function AddSlow(float myFactor, float myDuration)
{
	local int i;
	local float LowestDuration, LowestFactor;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if((i < ActiveSlows.Length) && ActiveSlows[i].factor != myFactor)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x191
	if(i == ActiveSlows.Length)
	{
		LowestDuration = myDuration;
		LowestFactor = myFactor;
		i = 0;
		J0x6A:

		// End:0x124 [Loop If]
		if(i < ActiveSlows.Length)
		{
			ActiveSlows[i].Duration -= TimerCounter;
			// End:0xBA
			if(ActiveSlows[i].Duration < 0.1000000)
			{
				ActiveSlows.Remove(i, 1);
				// [Explicit Continue]
				goto J0x11A;
			}
			// End:0xEA
			if(ActiveSlows[i].Duration < LowestDuration)
			{
				LowestDuration = ActiveSlows[i].Duration;
			}
			// End:0x11A
			if(ActiveSlows[i].factor < LowestFactor)
			{
				LowestFactor = ActiveSlows[i].factor;
			}
			J0x11A:

			i++;
			// [Loop Continue]
			goto J0x6A;
		}
		AddNewSlow();
		ActiveSlows[ActiveSlows.Length - 1].factor = myFactor;
		ActiveSlows[ActiveSlows.Length - 1].Duration = myDuration;
		SetTimer(LowestDuration, false);
		NextTimerPop = TimerRate;
		SlowFactor = LowestFactor;
		// End:0x18E
		if(Instigator != none)
		{
			UpdateSpeed();
		}		
	}
	else
	{
		ActiveSlows[i].Duration += myDuration;
	}
	//return;	
}

function SetSlow(float myFactor, float myDuration)
{
	local int i;
	local float LowestDuration, LowestFactor;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if((i < ActiveSlows.Length) && ActiveSlows[i].factor != myFactor)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x186
	if(i == ActiveSlows.Length)
	{
		LowestDuration = myDuration;
		LowestFactor = myFactor;
		i = 0;
		J0x6A:

		// End:0x124 [Loop If]
		if(i < ActiveSlows.Length)
		{
			ActiveSlows[i].Duration -= TimerCounter;
			// End:0xBA
			if(ActiveSlows[i].Duration < 0.1000000)
			{
				ActiveSlows.Remove(i, 1);
				// [Explicit Continue]
				goto J0x11A;
			}
			// End:0xEA
			if(ActiveSlows[i].Duration < LowestDuration)
			{
				LowestDuration = ActiveSlows[i].Duration;
			}
			// End:0x11A
			if(ActiveSlows[i].factor < LowestFactor)
			{
				LowestFactor = ActiveSlows[i].factor;
			}
			J0x11A:

			i++;
			// [Loop Continue]
			goto J0x6A;
		}
		AddNewSlow();
		ActiveSlows[ActiveSlows.Length - 1].factor = myFactor;
		ActiveSlows[ActiveSlows.Length - 1].Duration = myDuration;
		SetTimer(LowestDuration, false);
		NextTimerPop = TimerRate;
		SlowFactor = LowestFactor;
		UpdateSpeed();		
	}
	else
	{
		ActiveSlows[i].Duration = myDuration;
	}
	//return;	
}

function Timer()
{
	local int i;
	local float LowestDuration, LowestFactor;
	local bool bRemovedSlow;

	i = 0;
	J0x07:

	// End:0xEA [Loop If]
	if(i < ActiveSlows.Length)
	{
		ActiveSlows[i].Duration -= NextTimerPop;
		// End:0x66
		if(ActiveSlows[i].Duration < 0.1000000)
		{
			ActiveSlows.Remove(i, 1);
			bRemovedSlow = true;
			i--;
			// [Explicit Continue]
			goto J0xE0;
		}
		// End:0xA3
		if((i == 0) || ActiveSlows[i].Duration < LowestDuration)
		{
			LowestDuration = ActiveSlows[i].Duration;
		}
		// End:0xE0
		if((i == 0) || ActiveSlows[i].factor < LowestFactor)
		{
			LowestFactor = ActiveSlows[i].factor;
		}
		J0xE0:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x10C
	if(ActiveSlows.Length == 0)
	{
		SlowFactor = 1.0000000;
		LowestDuration = 0.0000000;
	}
	// End:0x11B
	if(bRemovedSlow)
	{
		UpdateSpeed();
	}
	NextTimerPop = LowestDuration;
	SetTimer(LowestDuration, false);
	//return;	
}

function AddNewSlow()
{
	local SlowInfo S;

	ActiveSlows[ActiveSlows.Length] = S;
	//return;	
}

defaultproperties
{
	Stamina=100.0000000
	MaxStamina=100.0000000
	StaminaDrainRate=25.0000000
	StaminaChargeRate=25.0000000
	SpeedFactor=1.5000000
	JumpDrain=10.0000000
	SlowFactor=1.0000000
	bReplicateInstigator=true
}
