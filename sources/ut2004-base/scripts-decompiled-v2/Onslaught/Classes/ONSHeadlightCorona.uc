class ONSHeadlightCorona extends Light
	native;

simulated function ChangeTeamTint(byte t)
{
	// End:0x22
	if(int(t) == 0)
	{
		LightHue = byte(255);
		LightSaturation = 240;		
	}
	else
	{
		LightHue = 128;
		LightSaturation = 175;
	}
	//return;	
}

defaultproperties
{
	CoronaRotation=10.0000000
	LightType=0
	LightHue=255
	LightSaturation=175
	LightBrightness=0.0000000
	LightRadius=100.0000000
	LightPeriod=0
	LightCone=0
	DrawType=0
	bCorona=true
	bDirectionalCorona=true
	bStatic=false
	bHidden=false
	bNoDelete=false
	bDetailAttachment=true
	bNetInitialRotation=true
	RemoteRole=0
	DrawScale=0.4000000
	bUnlit=true
	bMovable=true
	bHardAttach=true
}
