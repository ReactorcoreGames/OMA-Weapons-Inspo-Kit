class BallisticGameStyles extends Object
	abstract
	config;

var private array< Class<BC_GameStyle> > Styles;
var config BC_GameStyle.EGameStyle CurrentStyle;

static final function Class<BC_GameStyle> Get(BC_GameStyle.EGameStyle Style)
{
	return default.Styles[int(Style)];
	//return;	
}

static final function Class<BC_GameStyle> GetReplicatedStyle()
{
	return default.Styles[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)];
	//return;	
}

static final function Class<BC_GameStyle> GetLocalStyle()
{
	return default.Styles[int(default.CurrentStyle)];
	//return;	
}

static final function Class<BC_GameStyle_Config> GetLocalConfigStyle()
{
	return Class<BC_GameStyle_Config>(default.Styles[int(default.CurrentStyle)]);
	//return;	
}

static final function bool WYSIWYG()
{
	return false;
	//return;	
}

defaultproperties
{
	Styles[0]=Class'BCoreProV55.GameStyle_Pro'
	Styles[1]=Class'BCoreProV55.GameStyle_Classic'
	Styles[2]=Class'BCoreProV55.GameStyle_Realism'
	Styles[3]=Class'BCoreProV55.GameStyle_Tactical'
}
