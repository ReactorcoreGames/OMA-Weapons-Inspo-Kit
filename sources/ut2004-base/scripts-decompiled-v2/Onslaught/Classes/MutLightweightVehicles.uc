class MutLightweightVehicles extends Mutator
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config float VehicleMomentumMult;
var localized string DisplayText;
var localized string DescText;

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x2A
	if(Vehicle(Other) != none)
	{
		Vehicle(Other).MomentumMult *= VehicleMomentumMult;
	}
	return true;
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(Info).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.RulesGroup, "VehicleMomentumMult", default.DisplayText, 0, 1, "Text", "4;2:10");
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	// End:0x25
	if(PropName == "VehicleMomentumMult")
	{
		return default.DescText;
	}
	return super(Info).GetDescriptionText(PropName);
	//return;	
}

defaultproperties
{
	VehicleMomentumMult=3.0000000
	DisplayText="Momentum Multiplier"
	DescText="Vehicles get this many times as much momentum from damage"
	FriendlyName="Lightweight Vehicles"
	Description="Vehicles fly farther when you hit them."
}
