class ONSPowerLinkOfficialSetup extends Actor
	notplaceable;

var(LinkSetup) string SetupName;
var(LinkSetup) array<PowerLinkSetup> LinkSetups;

defaultproperties
{
	SetupName="Default"
	bHidden=true
	bStasis=true
	RemoteRole=0
	bMovable=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
