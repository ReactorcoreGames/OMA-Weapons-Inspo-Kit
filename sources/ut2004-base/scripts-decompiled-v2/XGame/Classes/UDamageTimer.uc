class UDamageTimer extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int SoundCount;

function Timer()
{
	// End:0x15
	if(Pawn(Owner) == none)
	{
		Destroy();
		return;
	}
	// End:0x70
	if(SoundCount < 4)
	{
		SoundCount++;
		Pawn(Owner).PlaySound(Sound'PickupSounds.UDamagePickup', 0, 1.5000000 * Pawn(Owner).TransientSoundVolume,, 1000.0000000, 1.0000000);
		SetTimer(0.7500000, false);
		return;
	}
	Pawn(Owner).DisableUDamage();
	Destroy();
	//return;	
}

