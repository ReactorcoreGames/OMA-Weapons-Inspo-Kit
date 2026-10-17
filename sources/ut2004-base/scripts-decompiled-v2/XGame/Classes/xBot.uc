class xBot extends Bot
	config(User);

var() PlayerRecord PawnSetupRecord;

function SetPawnClass(string inClass, string InCharacter)
{
	local Class<xPawn> pClass;

	// End:0x3D
	if(inClass != "")
	{
		pClass = Class<xPawn>(DynamicLoadObject(inClass, Class'Core.Class'));
		// End:0x3D
		if(pClass != none)
		{
			PawnClass = pClass;
		}
	}
	PawnSetupRecord = Class'XGame.xUtil'.static.FindPlayerRecord(InCharacter);
	PlayerReplicationInfo.SetCharacterName(InCharacter);
	//return;	
}

function Possess(Pawn aPawn)
{
	super.Possess(aPawn);
	// End:0x34
	if(xPawn(aPawn) != none)
	{
		xPawn(aPawn).Setup(PawnSetupRecord);
	}
	//return;	
}

defaultproperties
{
	PlayerReplicationInfoClass=Class'XGame.xPlayerReplicationInfo'
}
