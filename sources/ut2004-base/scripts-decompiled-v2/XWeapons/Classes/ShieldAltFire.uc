class ShieldAltFire extends WeaponFire;

var ShieldEffect ShieldEffect;
var() float AmmoRegenTime;
var() float ChargeupTime;
var float RampTime;
var Sound ChargingSound;
var() byte ShieldSoundVolume;

simulated function DestroyEffects()
{
	// End:0x30
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x30
		if(ShieldEffect != none)
		{
			ShieldEffect.Destroy();
		}
	}
	super.DestroyEffects();
	//return;	
}

function DoFireEffect()
{
	local ShieldAttachment Attachment;

	Attachment = ShieldAttachment(Weapon.ThirdPersonActor);
	Instigator.AmbientSound = ChargingSound;
	Instigator.SoundVolume = ShieldSoundVolume;
	// End:0x7C
	if((Attachment != none) && Attachment.ShieldEffect3rd != none)
	{
		Attachment.ShieldEffect3rd.bHidden = false;
	}
	SetTimer(AmmoRegenTime, true);
	//return;	
}

function PlayFiring()
{
	ClientPlayForceFeedback("ShieldNoise");
	SetTimer(AmmoRegenTime, true);
	Weapon.LoopAnim('Shield');
	//return;	
}

function StopFiring()
{
	local ShieldAttachment Attachment;

	Attachment = ShieldAttachment(Weapon.ThirdPersonActor);
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	// End:0x94
	if((Attachment != none) && Attachment.ShieldEffect3rd != none)
	{
		Attachment.ShieldEffect3rd.bHidden = true;
		StopForceFeedback("ShieldNoise");
	}
	SetTimer(AmmoRegenTime, true);
	//return;	
}

function TakeHit(int Drain)
{
	// End:0x1F
	if(ShieldEffect != none)
	{
		ShieldEffect.Flash(Drain);
	}
	SetBrightness(true);
	//return;	
}

function StartBerserk()
{
	//return;	
}

function StopBerserk()
{
	//return;	
}

function StartSuperBerserk()
{
	//return;	
}

function SetBrightness(bool bHit)
{
	local ShieldAttachment Attachment;
	local float Brightness;

	Brightness = float(Weapon.AmmoAmount(1));
	// End:0x3A
	if(RampTime < ChargeupTime)
	{
		Brightness *= (RampTime / ChargeupTime);
	}
	// End:0x5B
	if(ShieldEffect != none)
	{
		ShieldEffect.SetBrightness(int(Brightness));
	}
	Attachment = ShieldAttachment(Weapon.ThirdPersonActor);
	// End:0x9B
	if(Attachment != none)
	{
		Attachment.SetBrightness(int(Brightness), bHit);
	}
	//return;	
}

function DrawMuzzleFlash(Canvas Canvas)
{
	super.DrawMuzzleFlash(Canvas);
	// End:0x32
	if(ShieldEffect == none)
	{
		ShieldEffect = Weapon.Spawn(Class'XWeapons.ShieldEffect', Instigator);
	}
	// End:0xAA
	if(bIsFiring && Weapon.AmmoAmount(1) > 0)
	{
		ShieldEffect.SetLocation(Weapon.GetEffectStart());
		ShieldEffect.SetRotation(Instigator.GetViewRotation());
		Canvas.DrawActor(ShieldEffect, false, false, Weapon.DisplayFOV);
	}
	//return;	
}

function Timer()
{
	// End:0x4E
	if(!bIsFiring)
	{
		RampTime = 0.0000000;
		// End:0x3F
		if(!Weapon.AmmoMaxed(1))
		{
			Weapon.AddAmmo(1, 1);			
		}
		else
		{
			SetTimer(0.0000000, false);
		}		
	}
	else
	{
		// End:0x99
		if(!Weapon.ConsumeAmmo(1, 1.0000000))
		{
			// End:0x90
			if(int(Weapon.ClientState) == int(4))
			{
				Weapon.PlayIdle();
			}
			StopFiring();			
		}
		else
		{
			RampTime += AmmoRegenTime;
		}
	}
	SetBrightness(false);
	//return;	
}

defaultproperties
{
	AmmoRegenTime=0.2000000
	ChargeupTime=3.0000000
	ChargingSound=Sound'WeaponSounds.BaseFiringSounds.BShield1'
	ShieldSoundVolume=220
	bPawnRapidFireAnim=true
	bWaitForRelease=true
	FireAnim="None"
	FireLoopAnim="None"
	FireEndAnim="Idle"
	FireSound=SoundGroup'WeaponSounds.Translocator.TranslocatorModuleRegeneration'
	FireForce="TranslocatorModuleRegeneration"
	FireRate=1.0000000
	AmmoClass=Class'XWeapons.ShieldAmmo'
	AmmoPerFire=15
	BotRefireRate=1.0000000
}
