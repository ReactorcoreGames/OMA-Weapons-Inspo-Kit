class Mut_Itemizer extends Mutator
	transient
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config string ItemGroup;
var() string GroupDisplayText;
var() string GroupDescText;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	Class'BallisticProV55.ItemizerDB'.static.SpawnItems(Class'BallisticProV55.ItemizerDB'.static.GetMap(self), ItemGroup, self, true);
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(Info).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.RulesGroup, "ItemGroup", default.GroupDisplayText, 0, 1, "Text", "20");
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	// End:0x1B
	if(PropName == "ItemGroup")
	{
		return default.GroupDescText;
	}
	return super(Info).GetDescriptionText(PropName);
	//return;	
}

defaultproperties
{
	GroupDisplayText="Itemizer Group"
	GroupDescText="The name of the item layout you want to use."
	GroupName="Itemizer"
	FriendlyName="Itemizer Pro"
	Description="Adds in items that have been manually placed with the Itemizer Tool"
}
