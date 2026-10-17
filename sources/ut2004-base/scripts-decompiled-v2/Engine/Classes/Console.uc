class Console extends Interaction
	native
	config;

var config byte ConsoleHotKey;
var globalconfig int HistoryTop;
var globalconfig int HistoryBot;
var globalconfig int HistoryCur;
var string TypedStr;
var globalconfig string History[16];
var int TypedStrPos;
var bool bTyping;
var bool bIgnoreKeys;
var() transient bool bRunningDemo;
var() transient bool bHoldingStart;
var() transient bool bHoldingBack;
var() transient float TimeIdle;
var() transient float TimeHoldingReboot;
var() globalconfig float TimePerTitle;
var() globalconfig float TimePerDemo;
var() globalconfig float TimeTooIdle;
var() globalconfig float TimeBeforeReboot;
var() globalconfig float TimePerSoak;
var() globalconfig string DemoLevels[64];
var array<string> BufferedConsoleCommands;

event Initialized()
{
	// End:0x1F
	if(IsSoaking())
	{
		TimePerTitle = 1.0000000;
		TimePerDemo = TimePerSoak;
	}
	//return;	
}

event ViewportInitialized()
{
	// End:0x3C
	if(ViewportOwner.ConfiguredInternetSpeed == 0)
	{
		ViewportOwner.ResetConfig("ConfiguredInternetSpeed");
	}
	// End:0x73
	if(ViewportOwner.ConfiguredLanSpeed == 0)
	{
		ViewportOwner.ResetConfig("ConfiguredLanSpeed");
	}
	//return;	
}

event NativeConsoleOpen()
{
	//return;	
}

function UnPressButtons()
{
	local PlayerController PC;

	// End:0x39
	if(ViewportOwner != none)
	{
		PC = ViewportOwner.Actor;
		// End:0x39
		if(PC != none)
		{
			PC.UnPressButtons();
		}
	}
	//return;	
}

exec function Type()
{
	TypedStr = "";
	TypedStrPos = 0;
	TypingOpen();
	//return;	
}

exec function Talk()
{
	TypedStr = "Say ";
	TypedStrPos = 4;
	TypingOpen();
	//return;	
}

exec function TeamTalk()
{
	TypedStr = "TeamSay ";
	TypedStrPos = 8;
	TypingOpen();
	//return;	
}

exec function ConsoleOpen()
{
	//return;	
}

exec function ConsoleClose()
{
	//return;	
}

exec function ConsoleToggle()
{
	//return;	
}

exec function StartRollingDemo()
{
	local int i, tryCount;

	return;
	TimeIdle = 0.0000000;
	tryCount = 1024;
	J0x18:

	i = int(FRand() * float(64));
	tryCount--;
	// End:0x75
	if(tryCount < 0)
	{
		Log("Couldn't find a random level to StartRollingDemo", 'Error');
		return;
	}
	// End:0x18
	if(!(DemoLevels[i] != ""))
		goto J0x18;
	bRunningDemo = true;
	// End:0xE8
	if(InStr(DemoLevels[i], "NumBots") >= 0)
	{
		ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1", 0, false);		
	}
	else
	{
		ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1?bAutoNumBots=true", 0, false);
	}
	//return;	
}

exec function StopRollingDemo()
{
	bRunningDemo = false;
	TimeIdle = 0.0000000;
	ConsoleCommand("DISCONNECT");
	//return;	
}

event NotifyLevelChange()
{
	ConsoleClose();
	//return;	
}

function DelayedConsoleCommand(string Command)
{
	BufferedConsoleCommands.Length = BufferedConsoleCommands.Length + 1;
	BufferedConsoleCommands[BufferedConsoleCommands.Length - 1] = Command;
	//return;	
}

function Chat(coerce string Msg, float MsgLife, PlayerReplicationInfo PRI)
{
	//return;	
}

event Message(coerce string Msg, float MsgLife)
{
	//return;	
}

event bool KeyEvent(Interactions.EInputKey Key, Interactions.EInputAction Action, float Delta)
{
	// End:0x12
	if(int(Action) != int(1))
	{
		return false;
	}
	// End:0x3F
	if((int(Key) == int(ConsoleHotKey)) && int(Action) == int(3))
	{
		ConsoleOpen();
		return true;
	}
	// End:0x78
	if(int(Action) == int(1))
	{
		TimeIdle = 0.0000000;
		// End:0x78
		if(bRunningDemo && !IsSoaking())
		{
			StopRollingDemo();
			return true;
		}
	}
	return false;
	//return;	
}

function TypingOpen()
{
	bTyping = true;
	// End:0x47
	if((ViewportOwner != none) && ViewportOwner.Actor != none)
	{
		ViewportOwner.Actor.Typing(bTyping);
	}
	GotoState('Typing');
	//return;	
}

function TypingClose()
{
	bTyping = false;
	// End:0x47
	if((ViewportOwner != none) && ViewportOwner.Actor != none)
	{
		ViewportOwner.Actor.Typing(bTyping);
	}
	TypedStr = "";
	TypedStrPos = 0;
	// End:0x6A
	if(GetStateName() == 'Typing')
	{
		GotoState('None');
	}
	//return;	
}

simulated event Tick(float Delta)
{
	J0x00:
	// End:0x37 [Loop If]
	if(BufferedConsoleCommands.Length > 0)
	{
		ViewportOwner.Actor.ConsoleCommand(BufferedConsoleCommands[0]);
		BufferedConsoleCommands.Remove(0, 1);
		// [Loop Continue]
		goto J0x00;
	}
	//return;	
}

event ConnectFailure(string FailCode, string URL)
{
	//return;	
}

function SetMusic(string NewSong)
{
	//return;	
}

function string SetInitialMusic(string NewSong)
{
	return NewSong;
	//return;	
}

simulated event Tidyup()
{
	SaveConfig();
	//return;	
}

state Typing
{
	exec function Type()
	{
		TypedStr = "";
		TypedStrPos = 0;
		TypingClose();
		//return;		
	}

	function bool KeyType(Interactions.EInputKey Key, optional string Unicode)
	{
		// End:0x0B
		if(bIgnoreKeys)
		{
			return true;
		}
		// End:0x95
		if(int(Key) >= 32)
		{
			// End:0x58
			if(Unicode != "")
			{
				TypedStr = (Left(TypedStr, TypedStrPos) $ Unicode) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);				
			}
			else
			{
				TypedStr = (Left(TypedStr, TypedStrPos) $ Chr(int(Key))) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
			}
			TypedStrPos++;
			return true;
		}
		return false;
		//return;		
	}

	function bool KeyEvent(Interactions.EInputKey Key, Interactions.EInputAction Action, float Delta)
	{
		local string Temp;

		// End:0x18
		if(int(Action) == int(1))
		{
			bIgnoreKeys = false;
		}
		// End:0x5E
		if(int(Key) == int(27))
		{
			// End:0x53
			if(TypedStr != "")
			{
				TypedStr = "";
				TypedStrPos = 0;
				HistoryCur = HistoryTop;
				return true;				
			}
			else
			{
				TypingClose();
				return true;
			}			
		}
		else
		{
			// End:0x73
			if(int(Action) != int(1))
			{
				return false;				
			}
			else
			{
				// End:0x188
				if(int(Key) == int(13))
				{
					// End:0x17D
					if(TypedStr != "")
					{
						// End:0x116
						if(History[int(float((16 + HistoryTop) - 1) % float(16))] != TypedStr)
						{
							History[HistoryTop] = TypedStr;
							HistoryTop = int(float(HistoryTop + 1) % float(16));
							// End:0x116
							if((HistoryBot == -1) || HistoryBot == HistoryTop)
							{
								HistoryBot = int(float(HistoryBot + 1) % float(16));
							}
						}
						HistoryCur = HistoryTop;
						Temp = TypedStr;
						TypedStr = "";
						TypedStrPos = 0;
						// End:0x170
						if(!ConsoleCommand(Temp))
						{
							Message(Localize("Errors", "Exec", "Core"), 6.0000000);
						}
						Message("", 6.0000000);
					}
					TypingClose();
					return true;					
				}
				else
				{
					// End:0x200
					if(int(Key) == int(38))
					{
						// End:0x1FB
						if(HistoryBot >= 0)
						{
							// End:0x1C0
							if(HistoryCur == HistoryBot)
							{
								HistoryCur = HistoryTop;								
							}
							else
							{
								HistoryCur--;
								// End:0x1DD
								if(HistoryCur < 0)
								{
									HistoryCur = 16 - 1;
								}
							}
							TypedStr = History[HistoryCur];
							TypedStrPos = Len(TypedStr);
						}
						return true;						
					}
					else
					{
						// End:0x271
						if(int(Key) == int(40))
						{
							// End:0x26E
							if(HistoryBot >= 0)
							{
								// End:0x238
								if(HistoryCur == HistoryTop)
								{
									HistoryCur = HistoryBot;									
								}
								else
								{
									HistoryCur = int(float(HistoryCur + 1) % float(16));
								}
								TypedStr = History[HistoryCur];
								TypedStrPos = Len(TypedStr);
							}							
						}
						else
						{
							// End:0x2C4
							if(int(Key) == int(8))
							{
								// End:0x2BF
								if(TypedStrPos > 0)
								{
									TypedStr = Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
									TypedStrPos--;
								}
								return true;								
							}
							else
							{
								// End:0x316
								if(int(Key) == int(46))
								{
									// End:0x311
									if(TypedStrPos < Len(TypedStr))
									{
										TypedStr = Left(TypedStr, TypedStrPos) $ Right(TypedStr, (Len(TypedStr) - TypedStrPos) - 1);
									}
									return true;									
								}
								else
								{
									// End:0x33C
									if(int(Key) == int(37))
									{
										TypedStrPos = Max(0, TypedStrPos - 1);
										return true;										
									}
									else
									{
										// End:0x368
										if(int(Key) == int(39))
										{
											TypedStrPos = Min(Len(TypedStr), TypedStrPos + 1);
											return true;											
										}
										else
										{
											// End:0x384
											if(int(Key) == int(36))
											{
												TypedStrPos = 0;
												return true;												
											}
											else
											{
												// End:0x3A3
												if(int(Key) == int(35))
												{
													TypedStrPos = Len(TypedStr);
													return true;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return true;
		//return;		
	}

	function BeginState()
	{
		bTyping = true;
		bVisible = true;
		bIgnoreKeys = true;
		HistoryCur = HistoryTop;
		//return;		
	}

	function EndState()
	{
		ConsoleCommand("toggleime 0");
		bTyping = false;
		bVisible = false;
		//return;		
	}
	stop;	
}

defaultproperties
{
	HistoryBot=-1
	TimePerDemo=300.0000000
	TimeTooIdle=60.0000000
	TimeBeforeReboot=5.0000000
	bRequiresTick=true
}
