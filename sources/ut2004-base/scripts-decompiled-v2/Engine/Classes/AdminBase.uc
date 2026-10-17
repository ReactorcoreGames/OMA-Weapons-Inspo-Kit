class AdminBase extends Object within PlayerController
	abstract
	native;

var bool bAdmin;
var AccessControl Manager;
var localized string Msg_PlayerList;
var localized string Msg_AllGameMaps;
var localized string Msg_AllMapLists;
var localized string Msg_MapRotationList;
var localized string Msg_NoMapsAdded;
var localized string Msg_AddedMapToList;
var localized string Msg_NoMapsRemoved;
var localized string Msg_RemovedFromList;
var localized string Msg_PlayerBanned;
var localized string Msg_SessionBanned;
var localized string Msg_PlayerKicked;
var localized string Msg_NextMapNotFound;
var localized string Msg_ChangingMapTo;
var localized string Msg_NoMapInRotation;
var localized string Msg_NoMapsFound;
var localized string Msg_MapIsInRotation;
var localized string Msg_MapNotInRotation;
var localized string Msg_UnknownParam;
var localized string Msg_NoParamsFound;
var localized string Msg_ParamModified;
var localized string Msg_ParamNotModified;
var localized string Msg_MapListAdded;
var localized string Msg_MapListRemoved;
var localized string Msg_MapIsNotInRotation;
var localized string Msg_EditingMapList;

function Created()
{
	// End:0x4C
	if(Outer.Level.Game.AccessControl != none)
	{
		Manager = Outer.Level.Game.AccessControl;
	}
	//return;	
}

function DoLogin(string Username, string Password)
{
	//return;	
}

function DoLogout()
{
	//return;	
}

function DoSwitch(string URL)
{
	Outer.Level.ServerTravel(URL, false);
	//return;	
}

function GoToNextMap()
{
	// End:0x70
	if(bAdmin)
	{
		Outer.Level.Game.bChangeLevels = true;
		Outer.Level.Game.bAlreadyChanged = false;
		Outer.Level.Game.RestartGame();
	}
	//return;	
}

function ShowCurrentMapList()
{
	local int i, C;
	local array<string> Ar;

	i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
	C = Outer.MapHandler.GetActiveList(i);
	Ar = Outer.MapHandler.GetCacheMapList(Outer.Level.Game.Acronym);
	SendComplexMsg(Ar, Msg_AllGameMaps @ Outer.MapHandler.GetMapListTitle(i, C));
	//return;	
}

function array<string> GetMapListNames(string GameType)
{
	local int i;
	local array<string> Ar;

	i = Outer.MapHandler.GetGameIndex(GameType);
	Ar = Outer.MapHandler.GetMapListNames(i);
	return Ar;
	//return;	
}

function MaplistCommand(string Cmd, string Extra)
{
	local array<string> Values;
	local string str;
	local int i, C;

	// End:0x44C
	if(CanPerform("Ml"))
	{
		Cmd = Caps(Cmd);
		i = Outer.MapHandler.GetGameIndex(string(Outer.Level.Game.Class));
		switch(Cmd)
		{
			// End:0xD0
			case "LIST":
				Values = Outer.MapHandler.GetMapListNames(i);
				SendComplexMsg(Values, Repl(Msg_AllMapLists, "%gametype%", string(Outer.Level.Game.Class)));
				// End:0x44C
				break;
			// End:0x18D
			case "USED":
				// End:0x10B
				if(Extra == "")
				{
					C = Outer.MapHandler.GetActiveList(i);					
				}
				else
				{
					C = int(Extra);
				}
				str = Outer.MapHandler.GetMapListTitle(i, C);
				Values = Outer.MapHandler.GetMapList(i, C);
				SendComplexMsg(Values, Repl(Msg_MapRotationList, "%maplist%", str));
				// End:0x44C
				break;
			// End:0x1FF
			case "SWITCH":
				// End:0x1CA
				if(Extra == "")
				{
					C = Outer.MapHandler.GetActiveList(i);					
				}
				else
				{
					C = int(Extra);
				}
				str = Outer.MapHandler.GetMapListTitle(i, C);
			// End:0x324
			case "ADD":
				C = Outer.MapHandler.GetActiveList(i);
				Split(Extra, ",", Values);
				// End:0x28B
				if(Values.Length == 0)
				{
					Outer.ClientMessage(Repl(Msg_NoMapsAdded, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));					
				}
				else
				{
					i = Values.Length - 1;
					J0x29A:

					// End:0x2ED [Loop If]
					if(i >= 0)
					{
						// End:0x2E3
						if(!Outer.MapHandler.AddMap(i, C, Values[i]))
						{
							Values.Remove(i, 1);
						}
						i--;
						// [Loop Continue]
						goto J0x29A;
					}
					SendComplexMsg(Values, Msg_AddedMapToList @ Outer.MapHandler.GetMapListTitle(i, C));
				}
				// End:0x44C
				break;
			// End:0x449
			case "DEL":
				C = Outer.MapHandler.GetActiveList(i);
				Split(Extra, ",", Values);
				// End:0x3B0
				if(Values.Length == 0)
				{
					Outer.ClientMessage(Repl(Msg_NoMapsRemoved, "%maplist%", Outer.MapHandler.GetMapListTitle(i, C)));					
				}
				else
				{
					i = Values.Length - 1;
					J0x3BF:

					// End:0x412 [Loop If]
					if(i >= 0)
					{
						// End:0x408
						if(!Outer.MapHandler.RemoveMap(i, C, Values[i]))
						{
							Values.Remove(i, 1);
						}
						i--;
						// [Loop Continue]
						goto J0x3BF;
					}
					SendComplexMsg(Values, Msg_RemovedFromList @ Outer.MapHandler.GetMapListTitle(i, C));
				}
				// End:0x44C
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		//return;		
	}
}

function RestartCurrentMap()
{
	Outer.Level.ServerTravel("?restart", false);
	//return;	
}

exec function PlayerList()
{
	local PlayerReplicationInfo PRI;

	// End:0x60
	if(CanPerform("Xp"))
	{
		Log(Msg_PlayerList);
		// End:0x5F
		foreach Outer.DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
		{
			Log(((PRI.PlayerName @ "( ping") @ string(PRI.Ping)) $ ")");			
		}		
	}
	//return;	
}

exec function Kick(string Cmd, string Extra)
{
	local array<string> Params;
	local PlayerController C;
	local int i;

	// End:0x317
	if((CanPerform("Kp")) || CanPerform("Kb"))
	{
		// End:0xC4
		if(Cmd ~= "List")
		{
			// End:0xC1
			foreach Outer.__NFUN_325__(Class'Engine.PlayerController', C)
			{
				// End:0xC0
				if((C.PlayerReplicationInfo != none) && C.Player != none)
				{
					Outer.ClientMessage((Right("   " $ string(C.PlayerReplicationInfo.PlayerID), 3) $ ")") @ C.PlayerReplicationInfo.PlayerName);
				}				
			}			
			return;
		}
		// End:0xFC
		if((Cmd ~= "Ban") || Cmd ~= "Session")
		{
			Params = SplitParams(Extra);			
		}
		else
		{
			// End:0x123
			if(Extra != "")
			{
				Params = SplitParams(Cmd @ Extra);				
			}
			else
			{
				Params = SplitParams(Cmd);
			}
		}
		// End:0x316
		foreach Outer.__NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0x315
			if((C != Outer.Owner) && C.PlayerReplicationInfo != none)
			{
				i = 0;
				J0x182:

				// End:0x315 [Loop If]
				if(i < Params.Length)
				{
					// End:0x30B
					if(((IsNumeric(Params[i])) && C.PlayerReplicationInfo.PlayerID == int(Params[i])) || MaskedCompare(C.PlayerReplicationInfo.PlayerName, Params[i]))
					{
						// End:0x25B
						if(Cmd ~= "Ban")
						{
							Outer.ClientMessage(Repl(Msg_PlayerBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
							Manager.BanPlayer(C);							
						}
						else
						{
							// End:0x2BD
							if(Cmd ~= "Session")
							{
								Outer.ClientMessage(Repl(Msg_SessionBanned, "%Player%", C.PlayerReplicationInfo.PlayerName));
								Manager.BanPlayer(C, true);								
							}
							else
							{
								Manager.KickPlayer(C);
								Outer.ClientMessage(Repl(Msg_PlayerKicked, "%Player%", C.PlayerReplicationInfo.PlayerName));
							}
						}
						// End:0x315
						continue;
					}
					i++;
					// [Loop Continue]
					goto J0x182;
				}
			}			
		}		
	}
	//return;	
}

exec function KickBan(string S)
{
	Kick("ban", S);
	//return;	
}

exec function RestartMap()
{
	RestartCurrentMap();
	//return;	
}

exec function NextMap()
{
	GoToNextMap();
	//return;	
}

exec function Map(string Cmd)
{
	// End:0x32
	if(Cmd ~= "Restart")
	{
		Outer.ConsoleCommand("RestartMap");		
	}
	else
	{
		// End:0x4B
		if(Cmd ~= "Next")
		{
			GoToNextMap();			
		}
		else
		{
			// End:0x64
			if(Cmd ~= "List")
			{
				ShowCurrentMapList();				
			}
			else
			{
				DoSwitch(Cmd);
			}
		}
	}
	//return;	
}

exec function MapList(string Cmd, string Extra)
{
	MaplistCommand(Cmd, Extra);
	//return;	
}

exec function Switch(string URL)
{
	DoSwitch(URL);
	//return;	
}

protected function bool CanPerform(string priv)
{
	return Manager.CanPerform(Outer, priv);
	//return;	
}

protected function string FindGameType(string GameType)
{
	local int i;
	local array<GameRecord> Records;

	Class'Engine.CacheManager'.static.GetGameTypeList(Records);
	i = 0;
	J0x18:

	// End:0xE5 [Loop If]
	if(i < Records.Length)
	{
		// End:0x45
		if(GameType ~= Records[i].ClassName)
		{
			// [Explicit Break]
			goto J0xE5;
		}
		// End:0x62
		if(GameType ~= Records[i].GameAcronym)
		{
			// [Explicit Break]
			goto J0xE5;
		}
		// End:0x7F
		if(GameType ~= Records[i].TextName)
		{
			// [Explicit Break]
			goto J0xE5;
		}
		// End:0xAD
		if(Right(Records[i].ClassName, Len(GameType) + 1) ~= ("." $ GameType))
		{
			// [Explicit Break]
			goto J0xE5;
		}
		// End:0xDB
		if(Right(Records[i].TextName, Len(GameType) + 1) ~= ("." $ GameType))
		{
			// [Explicit Break]
			goto J0xE5;
		}
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	J0xE5:

	// End:0x106
	if(i < Records.Length)
	{
		return Records[i].ClassName;
	}
	return "";
	//return;	
}

protected function SendComplexMsg(array<string> Arr, string Title)
{
	local int i, Longest;
	local string Line, Border, Prefix, Suffix;

	i = 0;
	J0x07:

	// End:0x4B [Loop If]
	if(i < Arr.Length)
	{
		// End:0x41
		if(Len(Arr[i]) > Longest)
		{
			Longest = Len(Arr[i]);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Longest += 8;
	Border = "";
	J0x5C:

	// End:0x80 [Loop If]
	if(Len(Border) < Longest)
	{
		Border = Border $ "-";
		// [Loop Continue]
		goto J0x5C;
	}
	Outer.ClientMessage(Title);
	Outer.ClientMessage(Border);
	i = 0;
	J0xAF:

	// End:0x167 [Loop If]
	if(i < Arr.Length)
	{
		Prefix = Right("[] " $ string(i), 4) $ ")";
		Suffix = " []";
		Line = (Prefix $ Arr[i]) $ Suffix;
		J0x106:

		// End:0x149 [Loop If]
		if(Len(Line) < Longest)
		{
			Suffix = " " $ Suffix;
			Line = (Prefix $ Arr[i]) $ Suffix;
			// [Loop Continue]
			goto J0x106;
		}
		Outer.ClientMessage(Line);
		i++;
		// [Loop Continue]
		goto J0xAF;
	}
	Outer.ClientMessage(Border);
	//return;	
}

protected function bool MaskedCompare(string SettingName, string Mask)
{
	local bool bMaskLeft, bMaskRight;
	local int MaskLen;

	// End:0x1F
	if((Mask == "*") || Mask == "**")
	{
		return true;
	}
	MaskLen = Len(Mask);
	bMaskLeft = Left(Mask, 1) == "*";
	bMaskRight = Right(Mask, 1) == "*";
	// End:0x88
	if(bMaskLeft && bMaskRight)
	{
		return InStr(Caps(SettingName), Mid(Caps(Mask), 1, MaskLen - 2)) >= 0;
	}
	// End:0xB2
	if(bMaskLeft)
	{
		return Left(SettingName, MaskLen - 1) ~= Left(Mask, MaskLen - 1);
	}
	// End:0xDC
	if(bMaskRight)
	{
		return Right(SettingName, MaskLen - 1) ~= Right(Mask, MaskLen - 1);
	}
	return SettingName ~= Mask;
	//return;	
}

function bool IsNumeric(string Param, optional bool bPositiveOnly)
{
	local int P;

	P = 0;
	J0x07:

	// End:0x26 [Loop If]
	if(Mid(Param, P, 1) == " ")
	{
		P++;
		// [Loop Continue]
		goto J0x07;
	}
	J0x26:

	// End:0x5C [Loop If]
	if((Mid(Param, P, 1) >= "0") && Mid(Param, P, 1) <= "9")
	{
		P++;
		// [Loop Continue]
		goto J0x26;
	}
	J0x5C:

	// End:0x7B [Loop If]
	if(Mid(Param, P, 1) == " ")
	{
		P++;
		// [Loop Continue]
		goto J0x5C;
	}
	// End:0x90
	if(Mid(Param, P) != "")
	{
		return false;
	}
	return true;
	//return;	
}

function array<string> SplitParams(string Params)
{
	local array<string> Splitted;
	local string Delim;
	local int P, Start;

	J0x00:
	// End:0x160 [Loop If]
	if(Params != "")
	{
		P = 0;
		J0x13:

		// End:0x32 [Loop If]
		if(Mid(Params, P, 1) == " ")
		{
			P++;
			// [Loop Continue]
			goto J0x13;
		}
		// End:0x48
		if(Mid(Params, P) == "")
		{
			// [Explicit Break]
			goto J0x160;
		}
		Start = P;
		// End:0xEF
		if(Mid(Params, P, 1) == "\"")
		{
			P++;
			Start++;
			J0x76:

			// End:0xAB [Loop If]
			if((Mid(Params, P, 1) != "") && Mid(Params, P, 1) != "\"")
			{
				P++;
				// [Loop Continue]
				goto J0x76;
			}
			// End:0xEC
			if(Mid(Params, P, 1) == "\"")
			{
				Splitted[Splitted.Length] = Mid(Params, Start, P - Start);
				P++;
			}			
		}
		else
		{
			J0xEF:

			// End:0x126 [Loop If]
			if((Mid(Params, P, 1) != "") && Mid(Params, P, 1) != Delim)
			{
				P++;
				// [Loop Continue]
				goto J0xEF;
			}
			Splitted[Splitted.Length] = Mid(Params, Start, P - Start);
		}
		Params = Mid(Params, P);
		// [Loop Continue]
		goto J0x00;
	}
	J0x160:

	return Splitted;
	//return;	
}

defaultproperties
{
	Msg_PlayerList="Player List:"
	Msg_AllGameMaps="Maps that are valid (can be added) to"
	Msg_AllMapLists="Available maplists for %gametype%."
	Msg_MapRotationList="Active maps for maplist %maplist%."
	Msg_NoMapsAdded="No maps added to the maplist %maplist%."
	Msg_AddedMapToList="Maps successfully added to maplist"
	Msg_NoMapsRemoved="No maps were removed from the maplist %maplist%."
	Msg_RemovedFromList="Maps successfully removed from maplist"
	Msg_PlayerBanned="%Player% has been banned from this server"
	Msg_SessionBanned="%Player% has been banned for this match"
	Msg_PlayerKicked="%Player% has been kicked"
	Msg_NextMapNotFound="Next map not found; Restarting same map"
	Msg_ChangingMapTo="Changing Map to %NextMap%"
	Msg_NoMapInRotation="No maps configured for %maplist%."
	Msg_NoMapsFound="No matching maps in maplist %maplist% were found."
	Msg_MapIsInRotation="Matching %maplist% maps"
	Msg_MapNotInRotation="Matching maps which are not members of %maplist%."
	Msg_UnknownParam="Unknown Parameter : %Value%"
	Msg_NoParamsFound="No Parameters found!"
	Msg_ParamModified="Modification Successful"
	Msg_ParamNotModified="Could not Modify Parameter"
	Msg_MapListAdded="Maplist %listname% successfully added for gametype"
	Msg_MapListRemoved="Maplist %listname% successfully removed from gametype"
	Msg_EditingMapList="Now editing maplist"
}
