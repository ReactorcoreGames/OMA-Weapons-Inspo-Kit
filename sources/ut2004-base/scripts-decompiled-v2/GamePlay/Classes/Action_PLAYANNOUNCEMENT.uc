class Action_PLAYANNOUNCEMENT extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) Sound Sound;
var bool bSoundsPrecached;

function bool InitActionFor(ScriptedController C)
{
	local PlayerController P;
	local name SoundName;

	// End:0x36
	if(int(C.Level.NetMode) == int(NM_Standalone))
	{
		SoundName = LastMinuteHack_ShipIt(C);		
	}
	else
	{
		SoundName = Sound.Name;
	}
	// End:0x7C
	foreach C.DynamicActors(Class'Engine.PlayerController', P)
	{
		P.QueueAnnouncement(SoundName, 1, 0);		
	}	
	return false;
	//return;	
}

function name LastMinuteHack_ShipIt(ScriptedController C)
{
	local PlayerController LocalPlayer;
	local name SoundName;

	LocalPlayer = C.Level.GetLocalPlayerController();
	// End:0x3D
	if(Sound != none)
	{
		SoundName = Sound.Name;
	}
	// End:0x93
	if(((Sound == none) && C.Tag == 'Play_Intro3') && C.MyScript.Tag == 'Hack_RIP_Epic_MegaCar')
	{
		SoundName = 'MotherShip_intro';		
	}
	else
	{
		// End:0x179
		if(C.MyScript.Tag == 'Hack_I_Love_Mina')
		{
			// End:0xFF
			if((C.Tag == 'Play_Brief4') && LocalPlayer.StatusAnnouncer.GetSound('Junkyard_brief4a') != none)
			{
				SoundName = 'Junkyard_brief4a';				
			}
			else
			{
				// End:0x179
				if(Sound == none)
				{
					// End:0x130
					if(C.Tag == 'Play_Brief5')
					{
						SoundName = 'Junkyard_brief5a';						
					}
					else
					{
						// End:0x156
						if(C.Tag == 'Play_Brief6')
						{
							SoundName = 'Junkyard_brief6a';							
						}
						else
						{
							// End:0x179
							if(C.Tag == 'Play_Brief7')
							{
								SoundName = 'Junkyard_brief7a';
							}
						}
					}
				}
			}
		}
	}
	return SoundName;
	//return;	
}

function string GetActionString()
{
	return ActionString @ string(Sound);
	//return;	
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
	// End:0x48
	if(!bRewardSounds && !bSoundsPrecached)
	{
		bSoundsPrecached = true;
		// End:0x48
		if(Sound != none)
		{
			V.PrecacheSound(Sound.Name);
		}
	}
	//return;	
}

defaultproperties
{
	ActionString="play announcement"
}
