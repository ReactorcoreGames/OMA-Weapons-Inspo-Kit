class ONSPowerCoreEnergy extends Actor
	abstract
	notplaceable;

defaultproperties
{
	DrawType=8
	StaticMesh=StaticMesh'VMStructures.CoreGroup.COREenergy'
	bStasis=true
	bIgnoreEncroachers=true
	RemoteRole=0
	bMovable=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
