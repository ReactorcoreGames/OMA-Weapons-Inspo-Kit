class Sound extends Object
	native
	noexport
	safereplace
	hidecategories(Object);

struct SoundData
{
	var private native transient pointer Data;
	var native const int ArrayNum;
	var native const int ArrayMax;
	var private native transient pointer LazyArrayVptr;
	var private native transient pointer SavedAr;
	var native const int SavedPost;
	var private native transient pointer Owner;
};

var() native float Likelihood;
var native const SoundData Data;
var native const name FileType;
var native const string FileName;
var native const int OriginalSize;
var native const float Duration;
var private native transient pointer Handle;
var native const int Flags;
var native const int VoiceCodec;
var native const float InitialSeekTime;
var() float BaseRadius;
var() float VelocityScale;

defaultproperties
{
	BaseRadius=2000.0000000
}
