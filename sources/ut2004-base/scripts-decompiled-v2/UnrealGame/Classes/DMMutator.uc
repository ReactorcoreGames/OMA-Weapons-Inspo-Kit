class DMMutator extends Mutator
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const PROPNUM = 2;

var() globalconfig bool bMegaSpeed;
var() globalconfig float AirControl;
var() globalconfig bool bBrightSkins;
var localized string DMMutPropsDisplayText[2];
var localized string DMMutDescText[2];

function bool MutatorIsAllowed()
{
	return true;
	//return;	
}

function bool AlwaysKeep(Actor Other)
{
	// End:0x20
	if(NextMutator != none)
	{
		return NextMutator.AlwaysKeep(Other);
	}
	return false;
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	//return;	
}

defaultproperties
{
	AirControl=0.3500000
	bBrightSkins=true
	DMMutPropsDisplayText[0]="Mega Speed"
	DMMutPropsDisplayText[1]="Air Control"
	DMMutDescText[0]="Greatly increase game speed."
	DMMutDescText[1]="Specifies how much air control players have."
}
