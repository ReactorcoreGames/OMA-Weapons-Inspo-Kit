class StreamTag extends StreamBase within Stream
	native;

var() const editconst ID3Field TagID;
var() const editconst ID3Field TrackNumber;
var() const editconst ID3Field Title;
var() const editconst ID3Field Artist;
var() const editconst ID3Field Album;
var() const editconst ID3Field Year;
var() const editconst ID3Field Genre;
var() editconst ID3Field Duration;
var() const editconstarray editconst array<editconst ID3Field> Fields;
var private native transient pointer NativeID3Tag[2];
//var delegate<OnRefresh> __OnRefresh__Delegate;

delegate OnRefresh()
{
	//return;	
}

function DumpScriptTag()
{
	local int i;

	Log("================");
	Log((("      TagID:" $ TagID.FieldName) @ "#") @ TagID.FieldValue);
	Log((("TrackNumber:" $ TrackNumber.FieldName) @ "#") @ TrackNumber.FieldValue);
	Log((("      Title:" $ Title.FieldName) @ "#") @ Title.FieldValue);
	Log((("     Artist:" $ Artist.FieldName) @ "#") @ Artist.FieldValue);
	Log((("      Album:" $ Album.FieldName) @ "#") @ Album.FieldValue);
	Log((("       Year:" $ Year.FieldName) @ "#") @ Year.FieldValue);
	Log((("      Genre:" $ Genre.FieldName) @ "#") @ Genre.FieldValue);
	Log((("   Duration:" $ Duration.FieldName) @ "#") @ Duration.FieldValue);
	Log("  == All Fields == ");
	i = 0;
	J0x19A:

	// End:0x219 [Loop If]
	if(i < Fields.Length)
	{
		Log((((((("    " $ string(i)) $ ") ID:") $ string(Fields[i].FieldID)) @ "Name:") $ Fields[i].FieldName) @ "Value:") $ Fields[i].FieldValue);
		i++;
		// [Loop Continue]
		goto J0x19A;
	}
	Log("");
	//return;	
}

// Export UStreamTag::execDumpTag(FFrame&, void* const)
native final function DumpTag();

defaultproperties
{
	TagID=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	TrackNumber=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Title=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Artist=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Album=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Year=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Genre=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
	Duration=(FieldName="",FieldValue="",FieldID=0,Code=0,Code[1]=0,Code[2]=0,Code[3]=0)
}
