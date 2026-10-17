class BallisticProInteractions extends Interaction
	config(User);

var config bool bShowTabOnInit;
var config Interactions.EInputKey ADSKey;
var config Interactions.EInputKey ReloadKey;
var config Interactions.EInputKey WpnSpcKey;
var config Interactions.EInputKey SprintKey;
var config Interactions.EInputKey DualSelectKey;
var config Interactions.EInputKey FireModeKey;
var config Interactions.EInputKey LoadoutKey;
var config Interactions.EInputKey StreakKey;
var config Interactions.EInputKey MeleeKey;
var config Interactions.EInputKey PreferencesKey;
var config bool bADSKeyEnabled;
var config bool bReloadKeyEnabled;
var config bool bWpnSpcKeyEnabled;
var config bool bSprintKeyEnabled;
var config bool bFireModeKeyEnabled;
var config bool bDualSelectKeyEnabled;
var config bool bLoadoutKeyEnabled;
var config bool bStreakKeyEnabled;
var config bool bMeleeKeyEnabled;
var config bool bPreferencesKeyEnabled;
var localized string MenuName;
var localized string MenuHelp;
var localized string ConfigBWText;
var bool bScopeIsUp;
var bool bSprinting;
var bool bReloading;
var bool bUsingSpecial;
var bool bSwitchingFireMode;
var bool bStreakKeyHeld;
var bool bMeleeKeyHeld;
var private editconst bool bMenuModified;

event Initialized()
{
	local export editinline UT2K4PlayerLoginMenu Menu;

	// End:0x19C
	if(default.bShowTabOnInit)
	{
		// End:0x5B
		if(!GUIController(ViewportOwner.Actor.Player.GUIController).OpenMenu(UnrealPlayer(ViewportOwner.Actor).LoginMenuClass))
		{
			return;
		}
		// End:0x6C
		if(!bMenuModified)
		{
			ModifyMenu();
		}
		Menu = UT2K4PlayerLoginMenu(GUIController(ViewportOwner.Actor.Player.GUIController).FindPersistentMenuByName(UnrealPlayer(ViewportOwner.Actor).LoginMenuClass));
		// End:0x19C
		if(Menu != none)
		{
			Menu.c_Main.ActivateTabByName(MenuName, true);
			Class'BWInteractions3.BallisticProInteractions'.default.bShowTabOnInit = false;
			Class'BWInteractions3.BallisticProInteractions'.static.StaticSaveConfig();
			GUIController(ViewportOwner.Actor.Player.GUIController).OpenMenu("GUI2K4.GUI2K4QuestionPage");
			GUIQuestionPage(GUIController(ViewportOwner.Actor.Player.GUIController).TopPage()).SetupQuestion(ConfigBWText, 1, 1);
		}
	}
	//return;	
}

private final function ModifyMenu()
{
	local export editinline UT2K4PlayerLoginMenu Menu;
	local export editinline GUITabPanel Panel;

	Menu = UT2K4PlayerLoginMenu(GUIController(ViewportOwner.Actor.Player.GUIController).FindPersistentMenuByName(UnrealPlayer(ViewportOwner.Actor).LoginMenuClass));
	// End:0xC7
	if(Menu != none)
	{
		Log("BWInteractions3: Menu found");
		Panel = Menu.c_Main.AddTab(MenuName, string(Class'BWInteractions3.BallisticProMenuPanel'),, MenuHelp);
		bMenuModified = true;
		Disable('Tick');
		bRequiresTick = false;
	}
	//return;	
}

function Tick(float DeltaTime)
{
	// End:0x11
	if(!bMenuModified)
	{
		ModifyMenu();
	}
	//return;	
}

function bool KeyEvent(Interactions.EInputKey Key, Interactions.EInputAction Action, float Delta)
{
	// End:0x54
	if((ViewportOwner.Actor.Pawn == none) && int(Key) != int(Class'BWInteractions3.BallisticProInteractions'.default.LoadoutKey))
	{
		return super.KeyEvent(Key, Action, Delta);		
	}
	else
	{
		// End:0xB7
		if(((int(Action) == int(1)) && bADSKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.ADSKey))
		{
			// End:0xB2
			if(bScopeIsUp == false)
			{
				ConsoleCommand("ScopeView");
				bScopeIsUp = true;
			}
			return true;			
		}
		else
		{
			// End:0x121
			if(((int(Action) == int(3)) && bADSKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.ADSKey))
			{
				// End:0x11C
				if(bScopeIsUp == true)
				{
					ConsoleCommand("ScopeViewRelease");
					bScopeIsUp = false;
				}
				return true;				
			}
			else
			{
				// End:0x181
				if(((int(Action) == int(1)) && bReloadKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.ReloadKey))
				{
					// End:0x17C
					if(bReloading == false)
					{
						ConsoleCommand("Reload");
						bReloading = true;
					}
					return true;					
				}
				else
				{
					// End:0x1E8
					if(((int(Action) == int(3)) && bReloadKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.ReloadKey))
					{
						// End:0x1E3
						if(bReloading == true)
						{
							ConsoleCommand("ReloadRelease");
							bReloading = false;
						}
						return true;						
					}
					else
					{
						// End:0x24B
						if(((int(Action) == int(1)) && bMeleeKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.MeleeKey))
						{
							// End:0x246
							if(bMeleeKeyHeld == false)
							{
								ConsoleCommand("MeleeHold");
								bMeleeKeyHeld = true;
							}
							return true;							
						}
						else
						{
							// End:0x2B1
							if(((int(Action) == int(3)) && bMeleeKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.MeleeKey))
							{
								// End:0x2AC
								if(bMeleeKeyHeld == true)
								{
									ConsoleCommand("MeleeRelease");
									bMeleeKeyHeld = false;
								}
								return true;								
							}
							else
							{
								// End:0x305
								if(((int(Action) == int(1)) && bLoadoutKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.LoadoutKey))
								{
									ConsoleCommand("Mutate Loadout");
									return true;									
								}
								else
								{
									// End:0x354
									if(((int(Action) == int(1)) && bPreferencesKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.PreferencesKey))
									{
										ConsoleCommand("Ballistic");
										return true;										
									}
									else
									{
										// End:0x3A4
										if(((int(Action) == int(1)) && bDualSelectKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.DualSelectKey))
										{
											ConsoleCommand("dualselect");
											return true;											
										}
										else
										{
											// End:0x40B
											if(((int(Action) == int(1)) && bWpnSpcKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.WpnSpcKey))
											{
												// End:0x406
												if(bUsingSpecial == false)
												{
													ConsoleCommand("WeaponSpecial");
													bUsingSpecial = true;
												}
												return true;												
											}
											else
											{
												// End:0x479
												if(((int(Action) == int(3)) && bWpnSpcKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.WpnSpcKey))
												{
													// End:0x474
													if(bUsingSpecial == true)
													{
														ConsoleCommand("WeaponSpecialRelease");
														bUsingSpecial = false;
													}
													return true;													
												}
												else
												{
													// End:0x4E6
													if(((int(Action) == int(1)) && bSprintKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.SprintKey))
													{
														// End:0x4E1
														if(bSprinting == false)
														{
															ConsoleCommand("Mutate BStartSprint");
															bSprinting = true;
														}
														return true;														
													}
													else
													{
														// End:0x552
														if(((int(Action) == int(3)) && bSprintKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.SprintKey))
														{
															// End:0x54D
															if(bSprinting == true)
															{
																ConsoleCommand("Mutate BStopSprint");
																bSprinting = false;
															}
															return true;															
														}
														else
														{
															// End:0x5BC
															if(((int(Action) == int(1)) && bFireModeKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.FireModeKey))
															{
																// End:0x5B7
																if(bSwitchingFireMode == false)
																{
																	ConsoleCommand("SwitchWeaponMode");
																	bSwitchingFireMode = true;
																}
																return true;																
															}
															else
															{
																// End:0x627
																if(((int(Action) == int(3)) && bFireModeKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.FireModeKey))
																{
																	// End:0x622
																	if(bSwitchingFireMode == true)
																	{
																		ConsoleCommand("WeaponModeRelease");
																		bSwitchingFireMode = false;
																	}
																	return true;																	
																}
																else
																{
																	// End:0x692
																	if(((int(Action) == int(1)) && bStreakKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.StreakKey))
																	{
																		// End:0x68D
																		if(bStreakKeyHeld == false)
																		{
																			ConsoleCommand("mutate Killstreak");
																			bStreakKeyHeld = true;
																		}
																		return true;																		
																	}
																	else
																	{
																		// End:0x6D5
																		if(((int(Action) == int(3)) && bStreakKeyEnabled) && int(Key) == int(Class'BWInteractions3.BallisticProInteractions'.default.StreakKey))
																		{
																			bStreakKeyHeld = false;
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
							}
						}
					}
				}
			}
		}
	}
	return super.KeyEvent(Key, Action, Delta);
	//return;	
}

event NotifyLevelChange()
{
	local export editinline UT2K4PlayerLoginMenu LoginMenu;

	// End:0x2D
	foreach AllObjects(Class'GUI2K4.UT2K4PlayerLoginMenu', LoginMenu)
	{
		LoginMenu.c_Main.RemoveTab(MenuName);		
	}	
	Master.RemoveInteraction(self);
	//return;	
}

defaultproperties
{
	bShowTabOnInit=true
	ADSKey=16
	ReloadKey=74
	WpnSpcKey=75
	SprintKey=72
	DualSelectKey=76
	FireModeKey=80
	LoadoutKey=79
	StreakKey=73
	MeleeKey=78
	PreferencesKey=77
	bADSKeyEnabled=true
	bReloadKeyEnabled=true
	bWpnSpcKeyEnabled=true
	bSprintKeyEnabled=true
	bFireModeKeyEnabled=true
	bDualSelectKeyEnabled=true
	bLoadoutKeyEnabled=true
	bStreakKeyEnabled=true
	bMeleeKeyEnabled=true
	bPreferencesKeyEnabled=true
	MenuName="Ballistic Binds"
	MenuHelp="Ballistic Bind Menu"
	ConfigBWText="Please set Ballistic Weapons keys. Keys set affect this server only and do not overwrite."
	bVisible=true
	bRequiresTick=true
}
