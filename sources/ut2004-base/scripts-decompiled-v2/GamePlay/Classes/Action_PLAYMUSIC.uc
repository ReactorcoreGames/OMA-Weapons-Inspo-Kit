class Action_PLAYMUSIC extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) string Song;
var(Action) Actor.EMusicTransition Transition;
var(Action) bool bAffectAllPlayers;

function bool InitActionFor(ScriptedController C)
{
	local PlayerController P;
	local Controller A;
	local string FixedSong, Extension;

	FixedSong = Song;
	Extension = Right(FixedSong, 4);
	// End:0x42
	if(Extension ~= ".ogg")
	{
		FixedSong = Left(FixedSong, Len(FixedSong) - 4);
	}
	// End:0xBF
	if(bAffectAllPlayers)
	{
		A = C.Level.ControllerList;
		J0x68:

		// End:0xBC [Loop If]
		if(A != none)
		{
			// End:0xA5
			if(A.IsA('PlayerController'))
			{
				PlayerController(A).ClientSetMusic(FixedSong, Transition);
			}
			A = A.nextController;
			// [Loop Continue]
			goto J0x68;
		}		
	}
	else
	{
		P = PlayerController(C.GetInstigator().Controller);
		// End:0xEF
		if(P == none)
		{
			return false;
		}
		P.ClientSetMusic(FixedSong, Transition);
	}
	return false;
	//return;	
}

function string GetActionString()
{
	return ActionString @ Song;
	//return;	
}

defaultproperties
{
	Transition=3
	bAffectAllPlayers=true
	ActionString="play song"
}
