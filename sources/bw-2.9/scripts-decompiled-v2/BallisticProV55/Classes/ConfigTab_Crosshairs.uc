class ConfigTab_Crosshairs extends ConfigTabBase
	editinlinenew
	instanced;

var bool bLoadInitialized;
var() automated moSlider sl_GlobalScale;
var() automated moSlider sl_CrossGrow;
var() automated moSlider sl_Red1;
var() automated moSlider sl_Green1;
var() automated moSlider sl_Blue1;
var() automated moSlider sl_Alpha1;
var() automated moSlider sl_Size1;
var() automated moSlider sl_Red2;
var() automated moSlider sl_Green2;
var() automated moSlider sl_Blue2;
var() automated moSlider sl_Alpha2;
var() automated moSlider sl_Size2;
var() automated GUIImage Box_WeapList;
var() automated GUIImage Img_Cross1;
var() automated GUIImage Img_Cross2;
var() automated GUIImage Img_BackShot;
var() automated GUIImage Box_Shot;
var() automated GUIImage Box_Inner;
var() automated GUIImage Box_Outer;
var() automated GUILabel l_WeaponsList;
var() automated GUILabel l_Inner;
var() automated GUILabel l_Outer;
var() automated GUIListBox lb_Weapons;
var() automated GUIComboBox cb_CrossList1;
var() automated GUIComboBox cb_CrossList2;
var() array<NonDefCrosshairCfg> Crosshairs;

function InitializeConfigTab()
{
	local array<WeaponRecord> Recs;
	local Class<Weapon> Weap;
	local int i, j;
	local array<string> CHClassNames;
	local Class<BallisticCrosshairpack> CHClass;

	// End:0x0B
	if(bLoadInitialized)
	{
		return;
	}
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x23:

	// End:0xDA [Loop If]
	if(i < Recs.Length)
	{
		Weap = none;
		// End:0x67
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
		{
			// [Explicit Continue]
			goto J0xD0;
		}
		// End:0x98
		if(Weap == none)
		{
			Weap = Class<Weapon>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
		}
		// End:0xD0
		if(Weap != none)
		{
			lb_Weapons.List.Add(Recs[i].FriendlyName, Weap);
		}
		J0xD0:

		i++;
		// [Loop Continue]
		goto J0x23;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	lb_Weapons.List.__OnChange__Delegate = InternalOnChange;
	PlayerOwner().GetAllInt("BCoreProV55.BallisticCrosshairPack", CHClassNames);
	i = 0;
	J0x143:

	// End:0x21B [Loop If]
	if(i < CHClassNames.Length)
	{
		CHClass = Class<BallisticCrosshairpack>(DynamicLoadObject(CHClassNames[i], Class'Core.Class'));
		// End:0x211
		if(CHClass != none)
		{
			j = 0;
			J0x186:

			// End:0x211 [Loop If]
			if(j < CHClass.default.Crosshairs.Length)
			{
				cb_CrossList1.AddItem(CHClass.default.Crosshairs[j].FriendlyName, CHClass, string(j));
				cb_CrossList2.AddItem(CHClass.default.Crosshairs[j].FriendlyName, CHClass, string(j));
				j++;
				// [Loop Continue]
				goto J0x186;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x143;
	}
	LoadSettings();
	bLoadInitialized = true;
	//return;	
}

function LoadSettings()
{
	local int i;

	sl_GlobalScale.SetValue(Class'Engine.HUD'.default.CrosshairScale);
	sl_CrossGrow.SetValue(Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairScaleFactor);
	i = 0;
	J0x41:

	// End:0xA9 [Loop If]
	if(i < lb_Weapons.List.Elements.Length)
	{
		Crosshairs[i] = Class<BallisticWeapon>(lb_Weapons.List.Elements[i].ExtraData).default.NDCrosshairCfg;
		i++;
		// [Loop Continue]
		goto J0x41;
	}
	Crosshairs[i] = Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairCfg;
	UpdateSettings();
	bInitialized = true;
	//return;	
}

function SaveSettings()
{
	local int i;

	// End:0x1A
	if(!bLoadInitialized || !bInitialized)
	{
		return;
	}
	Class'Engine.HUD'.default.CrosshairScale = sl_GlobalScale.GetValue();
	Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairScaleFactor = sl_CrossGrow.GetValue();
	Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairCfg = Crosshairs[lb_Weapons.List.Elements.Length];
	Class'Engine.HUD'.static.StaticSaveConfig();
	Class'BCoreProV55.BallisticWeapon'.static.StaticSaveConfig();
	i = 0;
	J0xA8:

	// End:0x141 [Loop If]
	if(i < lb_Weapons.List.Elements.Length)
	{
		Class<BallisticWeapon>(lb_Weapons.List.Elements[i].ExtraData).default.NDCrosshairCfg = Crosshairs[i];
		Class<BallisticWeapon>(lb_Weapons.List.Elements[i].ExtraData).static.StaticSaveConfig();
		i++;
		// [Loop Continue]
		goto J0xA8;
	}
	//return;	
}

function DefaultSettings()
{
	local int i;

	sl_GlobalScale.SetValue(1.0000000);
	sl_CrossGrow.SetValue(1.0000000);
	i = 0;
	J0x2F:

	// End:0xD8 [Loop If]
	if(i < lb_Weapons.List.Elements.Length)
	{
		Class<BallisticWeapon>(lb_Weapons.List.Elements[i].ExtraData).static.ResetConfig("NDCrosshairCfg");
		Crosshairs[i] = Class<BallisticWeapon>(lb_Weapons.List.Elements[i].ExtraData).default.NDCrosshairCfg;
		i++;
		// [Loop Continue]
		goto J0x2F;
	}
	Class'BCoreProV55.BallisticWeapon'.static.ResetConfig("NDCrosshairCfg");
	Crosshairs[i] = Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairCfg;
	UpdateSettings();
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	local int CHIndex;

	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	CHIndex = lb_Weapons.List.Index;
	// End:0x63
	if(Sender == sl_Red1)
	{
		Crosshairs[CHIndex].Color1.R = byte(sl_Red1.GetValue());		
	}
	else
	{
		// End:0x9C
		if(Sender == sl_Green1)
		{
			Crosshairs[CHIndex].Color1.G = byte(sl_Green1.GetValue());			
		}
		else
		{
			// End:0xD5
			if(Sender == sl_Blue1)
			{
				Crosshairs[CHIndex].Color1.B = byte(sl_Blue1.GetValue());				
			}
			else
			{
				// End:0x10E
				if(Sender == sl_Alpha1)
				{
					Crosshairs[CHIndex].Color1.A = byte(sl_Alpha1.GetValue());					
				}
				else
				{
					// End:0x142
					if(Sender == sl_Size1)
					{
						Crosshairs[CHIndex].StartSize1 = int(sl_Size1.GetValue());						
					}
					else
					{
						// End:0x17B
						if(Sender == sl_Red2)
						{
							Crosshairs[CHIndex].Color2.R = byte(sl_Red2.GetValue());							
						}
						else
						{
							// End:0x1B4
							if(Sender == sl_Green2)
							{
								Crosshairs[CHIndex].Color2.G = byte(sl_Green2.GetValue());								
							}
							else
							{
								// End:0x1ED
								if(Sender == sl_Blue2)
								{
									Crosshairs[CHIndex].Color2.B = byte(sl_Blue2.GetValue());									
								}
								else
								{
									// End:0x226
									if(Sender == sl_Alpha2)
									{
										Crosshairs[CHIndex].Color2.A = byte(sl_Alpha2.GetValue());										
									}
									else
									{
										// End:0x25A
										if(Sender == sl_Size2)
										{
											Crosshairs[CHIndex].StartSize2 = int(sl_Size2.GetValue());											
										}
										else
										{
											// End:0x33B
											if(Sender == cb_CrossList1)
											{
												Crosshairs[CHIndex].Pic1 = Class<BallisticCrosshairpack>(cb_CrossList1.static.GetObject()).default.Crosshairs[int(cb_CrossList1.GetExtra())].Image;
												Crosshairs[CHIndex].USize1 = Class<BallisticCrosshairpack>(cb_CrossList1.static.GetObject()).default.Crosshairs[int(cb_CrossList1.GetExtra())].USize;
												Crosshairs[CHIndex].VSize1 = Class<BallisticCrosshairpack>(cb_CrossList1.static.GetObject()).default.Crosshairs[int(cb_CrossList1.GetExtra())].VSize;												
											}
											else
											{
												// End:0x41C
												if(Sender == cb_CrossList2)
												{
													Crosshairs[CHIndex].Pic2 = Class<BallisticCrosshairpack>(cb_CrossList2.static.GetObject()).default.Crosshairs[int(cb_CrossList2.GetExtra())].Image;
													Crosshairs[CHIndex].USize2 = Class<BallisticCrosshairpack>(cb_CrossList2.static.GetObject()).default.Crosshairs[int(cb_CrossList2.GetExtra())].USize;
													Crosshairs[CHIndex].VSize2 = Class<BallisticCrosshairpack>(cb_CrossList2.static.GetObject()).default.Crosshairs[int(cb_CrossList2.GetExtra())].VSize;													
												}
												else
												{
													// End:0x43A
													if(Sender == lb_Weapons.List)
													{
														UpdateSettings();
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
	UpdateImages();
	//return;	
}

function UpdateImages()
{
	local int CHIndex;

	CHIndex = lb_Weapons.List.Index;
	Img_Cross1.Image = Crosshairs[CHIndex].Pic1;
	Img_Cross1.ImageColor = Crosshairs[CHIndex].Color1;
	Img_Cross2.Image = Crosshairs[CHIndex].Pic2;
	Img_Cross2.ImageColor = Crosshairs[CHIndex].Color2;
	//return;	
}

function UpdateSettings()
{
	local int i, CHIndex;

	CHIndex = lb_Weapons.List.Index;
	sl_Red1.SetValue(float(Crosshairs[CHIndex].Color1.R));
	sl_Green1.SetValue(float(Crosshairs[CHIndex].Color1.G));
	sl_Blue1.SetValue(float(Crosshairs[CHIndex].Color1.B));
	sl_Alpha1.SetValue(float(Crosshairs[CHIndex].Color1.A));
	sl_Size1.SetValue(float(Crosshairs[CHIndex].StartSize1));
	i = 0;
	J0xDD:

	// End:0x1AE [Loop If]
	if(i < cb_CrossList1.List.Elements.Length)
	{
		// End:0x1A4
		if(Class<BallisticCrosshairpack>(cb_CrossList1.static.GetItemObject(i)).default.Crosshairs[int(cb_CrossList1.List.Elements[i].ExtraStrData)].Image == Crosshairs[CHIndex].Pic1)
		{
			bInitialized = false;
			cb_CrossList1.SetText(cb_CrossList1.List.Elements[i].Item);
			bInitialized = true;
			// [Explicit Break]
			goto J0x1AE;
		}
		i++;
		// [Loop Continue]
		goto J0xDD;
	}
	J0x1AE:

	sl_Red2.SetValue(float(Crosshairs[CHIndex].Color2.R));
	sl_Green2.SetValue(float(Crosshairs[CHIndex].Color2.G));
	sl_Blue2.SetValue(float(Crosshairs[CHIndex].Color2.B));
	sl_Alpha2.SetValue(float(Crosshairs[CHIndex].Color2.A));
	sl_Size2.SetValue(float(Crosshairs[CHIndex].StartSize2));
	i = 0;
	J0x26E:

	// End:0x33F [Loop If]
	if(i < cb_CrossList2.List.Elements.Length)
	{
		// End:0x335
		if(Class<BallisticCrosshairpack>(cb_CrossList2.static.GetItemObject(i)).default.Crosshairs[int(cb_CrossList2.List.Elements[i].ExtraStrData)].Image == Crosshairs[CHIndex].Pic2)
		{
			bInitialized = false;
			cb_CrossList2.SetText(cb_CrossList2.List.Elements[i].Item);
			bInitialized = true;
			// [Explicit Break]
			goto J0x33F;
		}
		i++;
		// [Loop Continue]
		goto J0x26E;
	}
	J0x33F:

	UpdateImages();
	//return;	
}

function bool InternalOnPreDraw(Canvas Canvas)
{
	local float ScaleFactor;
	local int CHIndex;

	// End:0x1A
	if(!bLoadInitialized || !bInitialized)
	{
		return false;
	}
	CHIndex = lb_Weapons.List.Index;
	ScaleFactor = (float(Controller.ResX) / float(1600)) * sl_GlobalScale.GetValue();
	Img_Cross1.WinWidth = ScaleFactor * float(Crosshairs[CHIndex].StartSize1);
	Img_Cross1.WinLeft = (ActualWidth() * 0.7500000) - (Img_Cross1.WinWidth / float(2));
	Img_Cross1.WinHeight = ScaleFactor * float(Crosshairs[CHIndex].StartSize1);
	Img_Cross1.WinTop = (ActualHeight() * 0.3250000) - (Img_Cross1.WinHeight / float(2));
	Img_Cross2.WinWidth = ScaleFactor * float(Crosshairs[CHIndex].StartSize2);
	Img_Cross2.WinLeft = (ActualWidth() * 0.7500000) - (Img_Cross2.WinWidth / float(2));
	Img_Cross2.WinHeight = ScaleFactor * float(Crosshairs[CHIndex].StartSize2);
	Img_Cross2.WinTop = (ActualHeight() * 0.3250000) - (Img_Cross2.WinHeight / float(2));
	return false;
	//return;	
}

defaultproperties
{
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_GlobalScaleSlider'
	begin object name="sl_GlobalScaleSlider" class=XInterface.moSlider
		MaxValue=2.0000000
		Caption="Global Size"
		OnCreateComponent=sl_GlobalScaleSlider.InternalOnCreateComponent
		Hint="Scale the size of all crosshairs, including stock UT2004's, but excluding Universal Simple crosshairs."
		WinTop=0.9200000
		WinLeft=0.5200000
		WinWidth=0.4700000
		WinHeight=0.0378330
	end object
	sl_GlobalScale=sl_GlobalScaleSlider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_CrossGrowSlider'
	begin object name="sl_CrossGrowSlider" class=XInterface.moSlider
		MaxValue=2.0000000
		Caption="Crosshair Expansion"
		OnCreateComponent=sl_CrossGrowSlider.InternalOnCreateComponent
		Hint="Scale the degree of expansion to show inaccuracy for image-based crosshairs."
		WinTop=0.9200000
		WinLeft=0.0100000
		WinWidth=0.4700000
		WinHeight=0.0378330
	end object
	sl_CrossGrow=sl_CrossGrowSlider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Red1Slider'
	begin object name="sl_Red1Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Red"
		OnCreateComponent=sl_Red1Slider.InternalOnCreateComponent
		Hint="Adjust the red component of the outer crosshair."
		WinTop=0.6900000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Red1=sl_Red1Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Green1Slider'
	begin object name="sl_Green1Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Green"
		OnCreateComponent=sl_Green1Slider.InternalOnCreateComponent
		Hint="Adjust Green component of Outer crosshair"
		WinTop=0.7300000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Green1=sl_Green1Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Blue1Slider'
	begin object name="sl_Blue1Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Blue"
		OnCreateComponent=sl_Blue1Slider.InternalOnCreateComponent
		Hint="Adjust Blue component of Outer crosshair"
		WinTop=0.7700000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=10.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Blue1=sl_Blue1Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Alpha1Slider'
	begin object name="sl_Alpha1Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		bIgnoreChange=true
		CaptionWidth=0.3500000
		Caption="Opacity"
		OnCreateComponent=sl_Alpha1Slider.InternalOnCreateComponent
		Hint="Adjust Opactiy of Outer crosshair"
		WinTop=0.8100000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Alpha1=sl_Alpha1Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Size1Slider'
	begin object name="sl_Size1Slider" class=XInterface.moSlider
		MaxValue=512.0000000
		MinValue=8.0000000
		bIntSlider=true
		CaptionWidth=0.2500000
		Caption="Scale"
		OnCreateComponent=sl_Size1Slider.InternalOnCreateComponent
		Hint="Adjust the base size of the outer crosshair."
		WinTop=0.8500000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Size1=sl_Size1Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Red2Slider'
	begin object name="sl_Red2Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Red"
		OnCreateComponent=sl_Red2Slider.InternalOnCreateComponent
		Hint="Adjust the red component of the inner crosshair."
		WinTop=0.6900000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Red2=sl_Red2Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Green2Slider'
	begin object name="sl_Green2Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Green"
		OnCreateComponent=sl_Green2Slider.InternalOnCreateComponent
		Hint="Adjust the green component of the inner crosshair."
		WinTop=0.7300000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Green2=sl_Green2Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Blue2Slider'
	begin object name="sl_Blue2Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Blue"
		OnCreateComponent=sl_Blue2Slider.InternalOnCreateComponent
		Hint="Adjust the blue component of the inner crosshair."
		WinTop=0.7700000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Blue2=sl_Blue2Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Alpha2Slider'
	begin object name="sl_Alpha2Slider" class=XInterface.moSlider
		MaxValue=255.0000000
		bIntSlider=true
		CaptionWidth=0.3500000
		Caption="Opacity"
		OnCreateComponent=sl_Alpha2Slider.InternalOnCreateComponent
		Hint="Adjust the opacity of the inner crosshair."
		WinTop=0.8100000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Alpha2=sl_Alpha2Slider
	// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Size2Slider'
	begin object name="sl_Size2Slider" class=XInterface.moSlider
		MaxValue=512.0000000
		MinValue=8.0000000
		bIntSlider=true
		CaptionWidth=0.2500000
		Caption="Scale"
		OnCreateComponent=sl_Size2Slider.InternalOnCreateComponent
		Hint="Adjust the base size of the inner crosshair."
		WinTop=0.8500000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		OnChange=ConfigTab_Crosshairs.InternalOnChange
	end object
	sl_Size2=sl_Size2Slider
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_WeapListImg'
	begin object name="Box_WeapListImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0350000
		WinLeft=0.0350000
		WinWidth=0.4300000
		WinHeight=0.5750000
		RenderWeight=0.0020000
	end object
	Box_WeapList=Box_WeapListImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_Cross1Img'
	begin object name="Img_Cross1Img" class=XInterface.GUIImage
		Image=Texture'BW_Core_WeaponTex.Crosshairs.M50Out'
		ImageStyle=2
		WinTop=0.0500000
		WinLeft=0.5000000
		WinWidth=0.2000000
		WinHeight=0.2666000
		RenderWeight=0.0020000
	end object
	Img_Cross1=Img_Cross1Img
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_Cross2Img'
	begin object name="Img_Cross2Img" class=XInterface.GUIImage
		Image=Texture'BW_Core_WeaponTex.Crosshairs.M50In'
		ImageStyle=2
		WinTop=0.0500000
		WinLeft=0.5000000
		WinWidth=0.2000000
		WinHeight=0.2666000
		RenderWeight=0.0030000
	end object
	Img_Cross2=Img_Cross2Img
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_BackShotImg'
	begin object name="Img_BackShotImg" class=XInterface.GUIImage
		Image=MaterialSequence'BW_Core_WeaponTex.Misc.MenuSequence'
		ImageStyle=2
		WinTop=0.0500000
		WinLeft=0.5000000
		WinWidth=0.4750000
		WinHeight=0.5500000
		RenderWeight=0.0015000
	end object
	Img_BackShot=Img_BackShotImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_ShotImg'
	begin object name="Box_ShotImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0350000
		WinLeft=0.4850000
		WinWidth=0.5050000
		WinHeight=0.5800000
		RenderWeight=0.0010000
	end object
	Box_Shot=Box_ShotImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_InnerImg'
	begin object name="Box_InnerImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.Controls.thinpipe_b'
		ImageStyle=1
		WinTop=0.6350000
		WinLeft=0.5240000
		WinWidth=0.4300000
		WinHeight=0.2650000
		RenderWeight=0.0020000
	end object
	Box_Inner=Box_InnerImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_OuterImg'
	begin object name="Box_OuterImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.Controls.thinpipe_b'
		ImageStyle=1
		WinTop=0.6350000
		WinLeft=0.0350000
		WinWidth=0.4300000
		WinHeight=0.2650000
		RenderWeight=0.0020000
	end object
	Box_Outer=Box_OuterImg
	// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_WeaponsListlabel'
	begin object name="l_WeaponsListlabel" class=XInterface.GUILabel
		Caption="Weapons"
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0350000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0500000
	end object
	l_WeaponsList=l_WeaponsListlabel
	// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_Innerlab'
	begin object name="l_Innerlab" class=XInterface.GUILabel
		Caption="Inner"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		bTransparent=false
		FontScale=0
		WinTop=0.6200000
		WinLeft=0.6315000
		WinWidth=0.2150000
		WinHeight=0.0300000
	end object
	l_Inner=l_Innerlab
	// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_Outerlab'
	begin object name="l_Outerlab" class=XInterface.GUILabel
		Caption="Outer"
		TextAlign=1
		TextColor=(R=255,G=0,B=0,A=255)
		bTransparent=false
		FontScale=0
		WinTop=0.6200000
		WinLeft=0.1425000
		WinWidth=0.2150000
		WinHeight=0.0300000
	end object
	l_Outer=l_Outerlab
	// Reference: GUIListBox'BallisticProV55.ConfigTab_Crosshairs.lb_WeaponsList'
	begin object name="lb_WeaponsList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Select a weapon to change its crosshair."
		WinTop=0.0750000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.5000000
		RenderWeight=0.5200000
		TabOrder=1
	end object
	lb_Weapons=lb_WeaponsList
	// Reference: GUIComboBox'BallisticProV55.ConfigTab_Crosshairs.cb_CrossList1ComBox'
	begin object name="cb_CrossList1ComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Choose the style of the outer crosshair."
		WinTop=0.6500000
		WinLeft=0.0500000
		WinWidth=0.4000000
		WinHeight=0.0384000
		TabOrder=0
		OnChange=ConfigTab_Crosshairs.InternalOnChange
		OnKeyEvent=cb_CrossList1ComBox.InternalOnKeyEvent
	end object
	cb_CrossList1=cb_CrossList1ComBox
	// Reference: GUIComboBox'BallisticProV55.ConfigTab_Crosshairs.cb_CrossList2ComBox'
	begin object name="cb_CrossList2ComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Choose the style of the inner crosshair."
		WinTop=0.6500000
		WinLeft=0.5390000
		WinWidth=0.4000000
		WinHeight=0.0384000
		TabOrder=0
		OnChange=ConfigTab_Crosshairs.InternalOnChange
		OnKeyEvent=cb_CrossList2ComBox.InternalOnKeyEvent
	end object
	cb_CrossList2=cb_CrossList2ComBox
	OnPreDraw=ConfigTab_Crosshairs.InternalOnPreDraw
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIComboBox'BallisticProV55.ConfigTab_Crosshairs.cb_CrossList2ComBox'
begin object name="cb_CrossList2ComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Choose the style of the inner crosshair."
	WinTop=0.6500000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	TabOrder=0
	OnChange=ConfigTab_Crosshairs.InternalOnChange
	OnKeyEvent=cb_CrossList2ComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.ConfigTab_Crosshairs.cb_CrossList1ComBox'
begin object name="cb_CrossList1ComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Choose the style of the outer crosshair."
	WinTop=0.6500000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0384000
	TabOrder=0
	OnChange=ConfigTab_Crosshairs.InternalOnChange
	OnKeyEvent=cb_CrossList1ComBox.InternalOnKeyEvent
end object
// Reference: GUIListBox'BallisticProV55.ConfigTab_Crosshairs.lb_WeaponsList'
begin object name="lb_WeaponsList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Select a weapon to change its crosshair."
	WinTop=0.0750000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.5000000
	RenderWeight=0.5200000
	TabOrder=1
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Size2Slider'
begin object name="sl_Size2Slider" class=XInterface.moSlider
	MaxValue=512.0000000
	MinValue=8.0000000
	bIntSlider=true
	CaptionWidth=0.2500000
	Caption="Scale"
	OnCreateComponent=sl_Size2Slider.InternalOnCreateComponent
	Hint="Adjust the base size of the inner crosshair."
	WinTop=0.8500000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Alpha2Slider'
begin object name="sl_Alpha2Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Opacity"
	OnCreateComponent=sl_Alpha2Slider.InternalOnCreateComponent
	Hint="Adjust the opacity of the inner crosshair."
	WinTop=0.8100000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Blue2Slider'
begin object name="sl_Blue2Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Blue"
	OnCreateComponent=sl_Blue2Slider.InternalOnCreateComponent
	Hint="Adjust the blue component of the inner crosshair."
	WinTop=0.7700000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Green2Slider'
begin object name="sl_Green2Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Green"
	OnCreateComponent=sl_Green2Slider.InternalOnCreateComponent
	Hint="Adjust the green component of the inner crosshair."
	WinTop=0.7300000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Red2Slider'
begin object name="sl_Red2Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Red"
	OnCreateComponent=sl_Red2Slider.InternalOnCreateComponent
	Hint="Adjust the red component of the inner crosshair."
	WinTop=0.6900000
	WinLeft=0.5390000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Size1Slider'
begin object name="sl_Size1Slider" class=XInterface.moSlider
	MaxValue=512.0000000
	MinValue=8.0000000
	bIntSlider=true
	CaptionWidth=0.2500000
	Caption="Scale"
	OnCreateComponent=sl_Size1Slider.InternalOnCreateComponent
	Hint="Adjust the base size of the outer crosshair."
	WinTop=0.8500000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Alpha1Slider'
begin object name="sl_Alpha1Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	bIgnoreChange=true
	CaptionWidth=0.3500000
	Caption="Opacity"
	OnCreateComponent=sl_Alpha1Slider.InternalOnCreateComponent
	Hint="Adjust Opactiy of Outer crosshair"
	WinTop=0.8100000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Blue1Slider'
begin object name="sl_Blue1Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Blue"
	OnCreateComponent=sl_Blue1Slider.InternalOnCreateComponent
	Hint="Adjust Blue component of Outer crosshair"
	WinTop=0.7700000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=10.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Green1Slider'
begin object name="sl_Green1Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Green"
	OnCreateComponent=sl_Green1Slider.InternalOnCreateComponent
	Hint="Adjust Green component of Outer crosshair"
	WinTop=0.7300000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_Red1Slider'
begin object name="sl_Red1Slider" class=XInterface.moSlider
	MaxValue=255.0000000
	bIntSlider=true
	CaptionWidth=0.3500000
	Caption="Red"
	OnCreateComponent=sl_Red1Slider.InternalOnCreateComponent
	Hint="Adjust the red component of the outer crosshair."
	WinTop=0.6900000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0384000
	OnChange=ConfigTab_Crosshairs.InternalOnChange
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_CrossGrowSlider'
begin object name="sl_CrossGrowSlider" class=XInterface.moSlider
	MaxValue=2.0000000
	Caption="Crosshair Expansion"
	OnCreateComponent=sl_CrossGrowSlider.InternalOnCreateComponent
	Hint="Scale the degree of expansion to show inaccuracy for image-based crosshairs."
	WinTop=0.9200000
	WinLeft=0.0100000
	WinWidth=0.4700000
	WinHeight=0.0378330
end object
// Reference: moSlider'BallisticProV55.ConfigTab_Crosshairs.sl_GlobalScaleSlider'
begin object name="sl_GlobalScaleSlider" class=XInterface.moSlider
	MaxValue=2.0000000
	Caption="Global Size"
	OnCreateComponent=sl_GlobalScaleSlider.InternalOnCreateComponent
	Hint="Scale the size of all crosshairs, including stock UT2004's, but excluding Universal Simple crosshairs."
	WinTop=0.9200000
	WinLeft=0.5200000
	WinWidth=0.4700000
	WinHeight=0.0378330
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_WeapListImg'
begin object name="Box_WeapListImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0350000
	WinLeft=0.0350000
	WinWidth=0.4300000
	WinHeight=0.5750000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_Cross1Img'
begin object name="Img_Cross1Img" class=XInterface.GUIImage
	Image=Texture'BW_Core_WeaponTex.Crosshairs.M50Out'
	ImageStyle=2
	WinTop=0.0500000
	WinLeft=0.5000000
	WinWidth=0.2000000
	WinHeight=0.2666000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_Cross2Img'
begin object name="Img_Cross2Img" class=XInterface.GUIImage
	Image=Texture'BW_Core_WeaponTex.Crosshairs.M50In'
	ImageStyle=2
	WinTop=0.0500000
	WinLeft=0.5000000
	WinWidth=0.2000000
	WinHeight=0.2666000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Img_BackShotImg'
begin object name="Img_BackShotImg" class=XInterface.GUIImage
	Image=MaterialSequence'BW_Core_WeaponTex.Misc.MenuSequence'
	ImageStyle=2
	WinTop=0.0500000
	WinLeft=0.5000000
	WinWidth=0.4750000
	WinHeight=0.5500000
	RenderWeight=0.0015000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_ShotImg'
begin object name="Box_ShotImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0350000
	WinLeft=0.4850000
	WinWidth=0.5050000
	WinHeight=0.5800000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_InnerImg'
begin object name="Box_InnerImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.Controls.thinpipe_b'
	ImageStyle=1
	WinTop=0.6350000
	WinLeft=0.5240000
	WinWidth=0.4300000
	WinHeight=0.2650000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Crosshairs.Box_OuterImg'
begin object name="Box_OuterImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.Controls.thinpipe_b'
	ImageStyle=1
	WinTop=0.6350000
	WinLeft=0.0350000
	WinWidth=0.4300000
	WinHeight=0.2650000
	RenderWeight=0.0020000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_WeaponsListlabel'
begin object name="l_WeaponsListlabel" class=XInterface.GUILabel
	Caption="Weapons"
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0350000
	WinLeft=0.0500000
	WinWidth=0.4000000
	WinHeight=0.0500000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_Innerlab'
begin object name="l_Innerlab" class=XInterface.GUILabel
	Caption="Inner"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	bTransparent=false
	FontScale=0
	WinTop=0.6200000
	WinLeft=0.6315000
	WinWidth=0.2150000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Crosshairs.l_Outerlab'
begin object name="l_Outerlab" class=XInterface.GUILabel
	Caption="Outer"
	TextAlign=1
	TextColor=(R=255,G=0,B=0,A=255)
	bTransparent=false
	FontScale=0
	WinTop=0.6200000
	WinLeft=0.1425000
	WinWidth=0.2150000
	WinHeight=0.0300000
end object
