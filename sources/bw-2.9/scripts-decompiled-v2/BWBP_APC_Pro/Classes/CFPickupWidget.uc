class CFPickupWidget extends Actor
	notplaceable;

var PlayerController PC;
var BallisticWeaponPickup bwPickUp;
var ScriptedTexture LicensePlate;
var Material LicensePlateBackground;
var Material IconMaterial;
var Material ChargeBar;
var string LicensePlateName;
var string InventoryGroupName;
var Font LicensePlateFont;
var Font InventoryGroupFont;
var Color ammoColor;
var float ammoLength;
var int MagAmmo;
var string InventoryGroupNameL[11];
var bool bInit;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		MagAmmo, bwPickUp;
}

simulated function PostNetBeginPlay()
{
	// End:0x11
	if(!bInit)
	{
		InitWidget();
	}
	super.PostNetBeginPlay();
	//return;	
}

simulated event PostBeginPlay()
{
	PC = Level.GetLocalPlayerController();
	super.PostBeginPlay();
	// End:0xE2
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LicensePlate = ScriptedTexture(Level.ObjectPool.AllocateObject(Class'Engine.ScriptedTexture'));
		LicensePlate.SetSize(256, 128);
		LicensePlate.Client = self;
		Skins[0] = LicensePlate;
		LicensePlateFont = Font(DynamicLoadObject("2K4Fonts.Verdana10", Class'Engine.Font'));
		InventoryGroupFont = Font(DynamicLoadObject("2K4Fonts.Verdana8", Class'Engine.Font'));
	}
	//return;	
}

simulated function InitWidget()
{
	local int InvGroup, bwinvGroup;

	// End:0x143
	if(bwPickUp != none)
	{
		bInit = true;
		LicensePlateName = bwPickUp.InventoryType.default.ItemName;
		IconMaterial = bwPickUp.InventoryType.default.IconMaterial;
		CullDistance = 3.0000000 * bwPickUp.default.CollisionRadius;
		InvGroup = int(bwPickUp.InventoryType.default.InventoryGroup);
		bwinvGroup = int(Class<BallisticWeapon>(bwPickUp.InventoryType).default.InventoryGroup);
		// End:0xDB
		if((bwinvGroup > 0) && bwinvGroup < 10)
		{
			InventoryGroupName = InventoryGroupNameL[bwinvGroup - 1];			
		}
		else
		{
			// End:0x119
			if(((bwinvGroup == 254) && InvGroup > 0) && InvGroup < 10)
			{
				InventoryGroupName = InventoryGroupNameL[InvGroup - 1];				
			}
			else
			{
				// End:0x135
				if(bwinvGroup == 0)
				{
					InventoryGroupName = InventoryGroupNameL[9];					
				}
				else
				{
					InventoryGroupName = InventoryGroupNameL[10];
				}
			}
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	local float percentage;

	// End:0x232
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && bInit)
	{
		// End:0x41
		if(!bHidden)
		{
			SetRotation(PC.GetViewRotation());
		}
		// End:0x232
		if(((bwPickUp != none) && bwPickUp.Velocity == vect(0.0000000, 0.0000000, 0.0000000)) && bHidden)
		{
			bHidden = false;
			SetLocation(bwPickUp.Location + vect(0.0000000, 0.0000000, 32.0000000));
			percentage = float((MagAmmo * 100) / Class<BallisticWeapon>(bwPickUp.InventoryType).default.MagAmmo);
			ammoColor.B = 0;
			ammoColor.A = byte(255);
			// End:0x118
			if(percentage == float(0))
			{
				ammoColor.R = byte(255);
				ammoColor.G = 0;				
			}
			else
			{
				// End:0x152
				if(percentage == float(100))
				{
					ammoColor.R = 0;
					ammoColor.G = byte(255);
					ammoColor.B = 0;					
				}
				else
				{
					// End:0x18E
					if(percentage == float(50))
					{
						ammoColor.R = byte(255);
						ammoColor.G = byte(255);
						ammoColor.B = 0;						
					}
					else
					{
						// End:0x1D5
						if(percentage < float(50))
						{
							ammoColor.R = byte(255);
							ammoColor.G = byte(Round(((percentage * float(2)) / float(100)) * float(255)));							
						}
						else
						{
							// End:0x21F
							if(percentage > float(50))
							{
								ammoColor.G = byte(255);
								ammoColor.R = byte(Round((((percentage * float(2)) / float(100)) * float(255)) - float(255)));
							}
						}
					}
				}
			}
			ammoLength = float(Min(100, int(percentage)));
		}
	}
	super.Tick(dt);
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	local int SizeX, SizeY;
	local Color BackColor, ForegroundColor, HighLightColor;

	HighLightColor.R = byte(255);
	HighLightColor.G = byte(255);
	HighLightColor.B = byte(255);
	HighLightColor.A = byte(255);
	ForegroundColor.R = 0;
	ForegroundColor.G = 0;
	ForegroundColor.B = 0;
	ForegroundColor.A = byte(255);
	BackColor.R = 128;
	BackColor.G = 128;
	BackColor.B = 128;
	BackColor.A = 50;
	Tex.TextSize(LicensePlateName, LicensePlateFont, SizeX, SizeY);
	Tex.DrawTile(0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), LicensePlateBackground, BackColor);
	Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000), 20, LicensePlateName, LicensePlateFont, HighLightColor);
	Tex.DrawTile(0.0000000, 50.0000000, 128.0000000, 32.0000000, 0.0000000, 0.0000000, 128.0000000, 32.0000000, IconMaterial, ForegroundColor);
	Tex.DrawTile(128.0000000, 60.0000000, ammoLength, 10.0000000, 0.0000000, 0.0000000, ammoLength, 10.0000000, ChargeBar, ammoColor);
	Tex.TextSize(InventoryGroupName, InventoryGroupFont, SizeX, SizeY);
	Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000), 90, InventoryGroupName, InventoryGroupFont, HighLightColor);
	//return;	
}

simulated event Destroyed()
{
	// End:0x53
	if((LicensePlate != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LicensePlate.Client = none;
		Level.ObjectPool.FreeObject(LicensePlate);
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	LicensePlate=ScriptedTexture'BW_Core_WeaponTex.PickupWidget.PickupWidget-ST'
	LicensePlateBackground=Texture'BW_Core_WeaponTex.PickupWidget.PickupWidgetBG'
	LicensePlateName="Init"
	MagAmmo=-1
	InventoryGroupNameL[0]="- Melee -"
	InventoryGroupNameL[1]="- Sidearm -"
	InventoryGroupNameL[2]="- Personal Defence Weapon -"
	InventoryGroupNameL[3]="- Assault Rifle -"
	InventoryGroupNameL[4]="- Energy Weapon -"
	InventoryGroupNameL[5]="- Heavy Machingun -"
	InventoryGroupNameL[6]="- Shotgun -"
	InventoryGroupNameL[7]="- Ordnance -"
	InventoryGroupNameL[8]="- Sniper Rifle -"
	InventoryGroupNameL[9]="- Grenade / Explosive -"
	InventoryGroupNameL[10]="- Misc -"
	DrawType=8
	bHidden=true
	bAlwaysRelevant=true
	RemoteRole=2
	DrawScale=0.2500000
	DrawScale3D=(X=1.0000000,Y=1.0000000,Z=0.7500000)
	bUnlit=true
	bNetNotify=true
}
