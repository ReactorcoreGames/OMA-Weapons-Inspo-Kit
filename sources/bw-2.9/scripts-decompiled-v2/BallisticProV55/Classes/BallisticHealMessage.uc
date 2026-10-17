class BallisticHealMessage extends LocalMessage
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int SwitchNum, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local string PlayerName;

	// End:0x22
	if(RelatedPRI_1 == none)
	{
		PlayerName = Class'XGame.xDeathMessage'.default.SomeoneString;		
	}
	else
	{
		PlayerName = RelatedPRI_1.PlayerName;
	}
	switch(SwitchNum)
	{
		// End:0x5D
		case 0:
			return PlayerName @ "is healing you.";
			// End:0x87
			break;
		// End:0xFFFF
		default:
			return PlayerName @ "is restoring your shields.";
			break;
	}	
	// Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
	// 1 & Type:Switch Position:0x087
	//return;
	// Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
	// 1 & Type:Switch Position:0x087	
	// Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
	// 1 & Type:Switch Position:0x087
	// Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
	// 1 & Type:Switch Position:0x087
}

defaultproperties
{
	bIsUnique=true
	bIsConsoleMessage=false
	bFadeMessage=true
	Lifetime=1
	DrawColor=(R=170,G=180,B=210,A=255)
	StackMode=2
	PosY=0.7750000
}
