class BallisticInteraction extends Interaction;

var PlayerController PC;
var float ScaleFactor;
var bool bShowSplash;
var float SplashStartTime;
var Material SplashPic;
var localized string VersionText;
var localized string DiscordText;
var bool bGameStyleSet;
var BallisticPlayerReplicationInfo BPRI;
var KillstreakLRI KLRI;

event Initialized()
{
	PC = ViewportOwner.Actor;
	SplashStartTime = PC.Level.TimeSeconds;
	//return;	
}

function DrawSplash(Canvas C)
{
	local float XL, YL;

	// End:0xB4
	if((PC.Level.TimeSeconds - SplashStartTime) > 6.4000000)
	{
		bShowSplash = false;
		BPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PC.PlayerReplicationInfo);
		// End:0x8F
		if(BPRI == none)
		{
			Log("BallisticInteraction: Couldn't find the BPRI!");
		}
		KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(PC.PlayerReplicationInfo);
		return;
	}
	C.SetPos((C.OrgX + float(C.SizeX / 2)) - ((float(600) * ScaleFactor) * 0.5000000), C.OrgY + (float(150) * ScaleFactor));
	// End:0x162
	if((PC.Level.TimeSeconds - SplashStartTime) < float(5))
	{
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));		
	}
	else
	{
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(FClamp(255.0000000 * (float(1) - (((PC.Level.TimeSeconds - SplashStartTime) - float(5)) / 1.5000000)), 0.0000000, 255.0000000)));
	}
	C.DrawTile(SplashPic, 600.0000000 * ScaleFactor, 600.0000000 * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	// End:0x210
	if(!bGameStyleSet)
	{
		SetupVersionText();
	}
	C.Font = Class'XInterface.UT2MidGameFont'.static.GetMidGameFont(C.SizeX);
	C.StrLen(VersionText, XL, YL);
	C.SetPos((C.OrgX + float(C.SizeX / 2)) - (XL / float(2)), C.OrgY + (float(675) * ScaleFactor));
	C.DrawText(VersionText);
	C.SetDrawColor(150, 150, 150, 150);
	C.StrLen(DiscordText, XL, YL);
	C.SetPos((C.OrgX + float(C.SizeX / 2)) - (XL / float(2)), C.OrgY + (float(700) * ScaleFactor));
	C.DrawText(DiscordText);
	//return;	
}

function SetupVersionText()
{
	VersionText $= (Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.StyleName $ " Style");
	bGameStyleSet = true;
	//return;	
}

function DrawKillstreakIndicator(Canvas C)
{
	local float XL, YL;
	local string S;
	local int i;

	i = 0;
	J0x07:

	// End:0xA5 [Loop If]
	if(i < 2)
	{
		// End:0x9B
		if(bool(int(KLRI.RewardLevel) & int(float(2) ** float(i))))
		{
			// End:0x6F
			if(S == "")
			{
				S = ("Level" @ string(i + 1)) @ "Killstreak";
				// [Explicit Continue]
				goto J0x9B;
			}
			S $= ((", Level" @ string(i + 1)) @ "Killstreak");
		}
		J0x9B:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, -4 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.SetDrawColor(byte(int(100) + (int(KLRI.RewardLevel) * 50)), 100, 100, 150);
	C.StrLen(S, XL, YL);
	C.SetPos(float(C.SizeX / 2) - (XL / float(2)), (float(C.SizeY) * 0.9000000) - (YL / float(2)));
	C.DrawText(S);
	//return;	
}

function Tick(float dt)
{
	//return;	
}

function PostRender(Canvas C)
{
	C.Style = 5;
	ScaleFactor = float(C.SizeX) / float(1600);
	// End:0x44
	if(bShowSplash)
	{
		DrawSplash(C);
	}
	// End:0x72
	if((KLRI != none) && int(KLRI.RewardLevel) != 0)
	{
		DrawKillstreakIndicator(C);
	}
	//return;	
}

static function BallisticInteraction Launch(PlayerController ThePC)
{
	local int i;
	local BallisticInteraction NI;

	Log("Launching Ballistic Interaction...");
	i = 0;
	J0x2D:

	// End:0xAC [Loop If]
	if(i < ThePC.Player.LocalInteractions.Length)
	{
		// End:0xA2
		if(ThePC.Player.LocalInteractions[i].Class == Class'BallisticProV55.BallisticInteraction')
		{
			return BallisticInteraction(ThePC.Player.LocalInteractions[i]);
		}
		i++;
		// [Loop Continue]
		goto J0x2D;
	}
	NI = BallisticInteraction(ThePC.Player.InteractionMaster.AddInteraction("BallisticProV55.BallisticInteraction", ThePC.Player));
	return NI;
	//return;	
}

event NotifyLevelChange()
{
	PC = none;
	Master.RemoveInteraction(self);
	//return;	
}

defaultproperties
{
	bShowSplash=true
	SplashPic=Texture'BW_Core_WeaponTex.ui.SplashScreenNew'
	VersionText="Definitive Edition: "
	DiscordText="discord.gg/2XTfKPa"
	bVisible=true
}
