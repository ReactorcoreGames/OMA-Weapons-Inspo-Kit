class MessageTextureClient extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() ScriptedTexture MessageTexture;
var() localized string ScrollingMessage;
var localized string HisMessage;
var localized string HerMessage;
var() Font Font;
var() Color FontColor;
var() bool bCaps;
var string OldText;

simulated function PostNetBeginPlay()
{
	// End:0x1B
	if(MessageTexture != none)
	{
		MessageTexture.Client = self;
	}
	SetTimer(1.0000000, true);
	//return;	
}

simulated function Timer()
{
	local string Text;
	local PlayerReplicationInfo Leading, PRI;

	// End:0x13D
	if((InStr(ScrollingMessage, "%lf") != -1) || InStr(ScrollingMessage, "%lp") != -1)
	{
		Leading = none;
		// End:0x95
		foreach AllActors(Class'Engine.PlayerReplicationInfo', PRI)
		{
			// End:0x94
			if(!PRI.bIsSpectator && (Leading == none) || PRI.Score > Leading.Score)
			{
				Leading = PRI;
			}			
		}		
		// End:0xFE
		if(Leading != none)
		{
			Text = Repl(ScrollingMessage, "%lp", Leading.PlayerName);
			Text = Repl(Text, "%lf", string(int(Leading.Score)));
			// End:0xFB
			if(bCaps)
			{
				Text = Caps(Text);
			}			
		}
		else
		{
			Text = "";
		}
		// End:0x13A
		if(Text != OldText)
		{
			OldText = Text;
			// End:0x13A
			if(bool(MessageTexture))
			{
				MessageTexture.Revision++;
			}
		}		
	}
	else
	{
		// End:0x181
		if(bCaps)
		{
			// End:0x17E
			if(Caps(ScrollingMessage) != OldText)
			{
				OldText = Caps(ScrollingMessage);
				// End:0x17E
				if(bool(MessageTexture))
				{
					MessageTexture.Revision++;
				}
			}			
		}
		else
		{
			// End:0x1B5
			if(ScrollingMessage != OldText)
			{
				OldText = ScrollingMessage;
				// End:0x1B5
				if(bool(MessageTexture))
				{
					MessageTexture.Revision++;
				}
			}
		}
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	local int SizeX, SizeY;

	Tex.TextSize(OldText, Font, SizeX, SizeY);
	Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000), int(float(Tex.VSize - SizeY) * 0.5000000), OldText, Font, FontColor);
	//return;	
}

simulated function string Replace(string Text, string Match, string Replacement)
{
	return Repl(Text, Match, Replacement);
	//return;	
}

defaultproperties
{
	HisMessage="his"
	HerMessage="her"
	bNoDelete=true
	RemoteRole=2
}
