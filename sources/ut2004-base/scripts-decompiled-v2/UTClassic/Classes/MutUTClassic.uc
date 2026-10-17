class MutUTClassic extends Mutator
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Class<Weapon> OriginalClasses[8];
var Class<Weapon> ReplacementClasses[8];
var config bool bCanDoubleJump;
var config bool bCanWallDodge;
var config bool bCanDodgeDoubleJump;
var config bool bModifyWeaponDamage;
var config bool bClassicTranslocator;
var localized string DJString;
var localized string WDString;
var localized string DDJString;
var localized string DJHelp;
var localized string WDHelp;
var localized string DDJHelp;
var localized string WeapString;
var localized string WeapHelp;
var localized string TranslocString;
var localized string TranslocHelp;

function PostBeginPlay()
{
	local GameRules G;

	super(Actor).PostBeginPlay();
	// End:0x80
	if(bModifyWeaponDamage)
	{
		G = Spawn(Class'UTClassic.UTClassicGameRules');
		// End:0x5A
		if(Level.Game.GameRulesModifiers == none)
		{
			Level.Game.GameRulesModifiers = G;			
		}
		else
		{
			Level.Game.GameRulesModifiers.AddGameRules(G);
		}
	}
	Level.Game.bModViewShake = false;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i;

	bSuperRelevant = 0;
	// End:0x11A
	if(xPawn(Other) != none)
	{
		// End:0x4D
		if(!bCanDoubleJump)
		{
			xPawn(Other).MaxMultiJump = 0;
			xPawn(Other).MultiJumpRemaining = 0;
		}
		xPawn(Other).bCanWallDodge = bCanWallDodge;
		xPawn(Other).bCanDodgeDoubleJump = bCanDodgeDoubleJump;
		xPawn(Other).RequiredEquipment[1] = "UTClassic.ClassicShieldGun";
		// End:0x117
		if(bClassicTranslocator && DeathMatch(Level.Game).AllowTransloc())
		{
			xPawn(Other).RequiredEquipment[2] = "UTClassic.ClassicTranslauncher";
		}		
	}
	else
	{
		// End:0x18E
		if(xWeaponBase(Other) != none)
		{
			i = 0;
			J0x131:

			// End:0x18B [Loop If]
			if(i < 8)
			{
				// End:0x181
				if(xWeaponBase(Other).WeaponType == OriginalClasses[i])
				{
					xWeaponBase(Other).WeaponType = ReplacementClasses[i];
					return true;
				}
				i++;
				// [Loop Continue]
				goto J0x131;
			}			
		}
		else
		{
			// End:0x1D1
			if(SniperAmmoPickup(Other) != none)
			{
				ReplaceWith(Other, "UTClassic.ClassicSniperAmmoPickup");
				return false;				
			}
			else
			{
				// End:0x1FE
				if(bClassicTranslocator && Translauncher(Other) != none)
				{
					// End:0x1FE
					if(ClassicTranslauncher(Other) == none)
					{
						return false;
					}
				}
			}
		}
	}
	return true;
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(Info).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.RulesGroup, "bCanDoubleJump", default.DJString, 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "bCanWallDodge", default.WDString, 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "bCanDodgeDoubleJump", default.DDJString, 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "bModifyWeaponDamage", default.WeapString, 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "bClassicTranslocator", default.TranslocString, 0, 1, "Check");
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x20
		case "bCanDoubleJump":
			return default.DJHelp;
		// End:0x38
		case "bCanWallDodge":
			return default.WDHelp;
		// End:0x56
		case "bCanDodgeDoubleJump":
			return default.DDJHelp;
		// End:0x74
		case "bModifyWeaponDamage":
			return default.WeapHelp;
		// End:0x93
		case "bClassicTranslocator":
			return default.TranslocHelp;
		// End:0xFFFF
		default:
			return super(Info).GetDescriptionText(PropName);
			break;
	}
	//return;	
}

defaultproperties
{
	OriginalClasses[0]=Class'XWeapons.FlakCannon'
	OriginalClasses[1]=Class'XWeapons.Minigun'
	OriginalClasses[2]=Class'XWeapons.ShockRifle'
	OriginalClasses[3]=Class'XWeapons.RocketLauncher'
	OriginalClasses[4]=Class'XWeapons.SniperRifle'
	OriginalClasses[5]=Class'XWeapons.BioRifle'
	OriginalClasses[6]=Class'XWeapons.Translauncher'
	OriginalClasses[7]=Class'XWeapons.ShieldGun'
	ReplacementClasses[0]=Class'UTClassic.ClassicFlakCannon'
	ReplacementClasses[1]=Class'UTClassic.ClassicMinigun'
	ReplacementClasses[2]=Class'UTClassic.ClassicShockRifle'
	ReplacementClasses[3]=Class'UTClassic.ClassicRocketLauncher'
	ReplacementClasses[4]=Class'UTClassic.ClassicSniperRifle'
	ReplacementClasses[5]=Class'UTClassic.ClassicBioRifle'
	ReplacementClasses[6]=Class'UTClassic.ClassicTranslauncher'
	ReplacementClasses[7]=Class'UTClassic.ClassicShieldGun'
	bCanDoubleJump=true
	bCanWallDodge=true
	bCanDodgeDoubleJump=true
	bModifyWeaponDamage=true
	bClassicTranslocator=true
	DJString="Allow Double Jumping"
	WDString="Allow Wall Dodging"
	DDJString="Allow Dodge Double Jumping"
	DJHelp="If enabled, players can double jump at the peak of jumps."
	WDHelp="If enabled, players can dodge off walls."
	DDJHelp="If enabled, players can double jump at the peak of dodge jumps."
	WeapString="Modify Weapon Damage"
	WeapHelp="If enabled, weapons do more damage."
	TranslocString="Modify Translocator"
	TranslocHelp="If enabled, translocator recharges faster."
	GroupName="Arena"
	FriendlyName="UT Classic"
	Description="Classic UT style weapons and movement options."
}
