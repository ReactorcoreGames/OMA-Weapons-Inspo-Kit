class ONSDaredevilMessage extends LocalMessage
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string StuntInfoString1;
var localized string StuntInfoString2;
var localized string StuntInfoString3;
var localized string StuntInfoString4;
var localized string StuntInfoString5;
var localized string StuntInfoString6;
var localized string StuntInfoString7;
var localized string StuntInfoString8;
var localized string StuntDegrees;
var Sound CheerSound;
var int CheerPointThresh;

static function string GetString(optional int SwitchNum, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local ONSWheeledCraft Car;
	local string ResultString;

	Car = ONSWheeledCraft(OptionalObject);
	// End:0x56
	if(SwitchNum == 0)
	{
		return (((default.StuntInfoString1 $ string(Car.DaredevilPoints)) $ default.StuntInfoString2) $ string(Car.InAirDistance)) $ default.StuntInfoString3;		
	}
	else
	{
		// End:0x1E3
		if(SwitchNum == 1)
		{
			// End:0xA6
			if(Car.InAirSpin >= Car.DaredevilThreshInAirSpin)
			{
				ResultString = (default.StuntInfoString4 $ string(Car.InAirSpin)) $ default.StuntDegrees;
			}
			// End:0x110
			if(Car.InAirPitch >= Car.DaredevilThreshInAirPitch)
			{
				// End:0xE5
				if(ResultString != "")
				{
					ResultString = ResultString $ default.StuntInfoString7;
				}
				ResultString = ((ResultString $ default.StuntInfoString5) $ string(Car.InAirPitch)) $ default.StuntDegrees;
			}
			// End:0x17A
			if(Car.InAirRoll >= Car.DaredevilThreshInAirRoll)
			{
				// End:0x14F
				if(ResultString != "")
				{
					ResultString = ResultString $ default.StuntInfoString7;
				}
				ResultString = ((ResultString $ default.StuntInfoString6) $ string(Car.InAirRoll)) $ default.StuntDegrees;
			}
			// End:0x1DD
			if(Car.InAirTime >= Car.DaredevilThreshInAirTime)
			{
				// End:0x1B9
				if(ResultString != "")
				{
					ResultString = ResultString $ default.StuntInfoString7;
				}
				ResultString = (ResultString $ string(Car.InAirTime)) $ default.StuntInfoString8;
			}
			return ResultString;
		}
	}
	//return;	
}

static simulated function ClientReceive(PlayerController P, optional int SwitchNum, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local ONSWheeledCraft Car;

	super.ClientReceive(P, SwitchNum, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x7D
	if(SwitchNum == 0)
	{
		P.PlayRewardAnnouncement('DareDevil', 1, true);
		Car = ONSWheeledCraft(OptionalObject);
		// End:0x7D
		if(Car.DaredevilPoints >= default.CheerPointThresh)
		{
			P.ClientPlaySound(default.CheerSound);
		}
	}
	//return;	
}

defaultproperties
{
	StuntInfoString1="Daredevil!  Level "
	StuntInfoString2=", "
	StuntInfoString3="m"
	StuntInfoString4="Spin: "
	StuntInfoString5="Flip: "
	StuntInfoString6="Roll: "
	StuntInfoString7=", "
	StuntInfoString8=" secs"
	StuntDegrees="°"
	CheerSound=Sound'ONSVehicleSounds-S.Misc.crowd_cheer'
	CheerPointThresh=20
	bFadeMessage=true
	Lifetime=9
	DrawColor=(R=255,G=0,B=128,A=255)
	StackMode=2
	PosY=0.7000000
}
