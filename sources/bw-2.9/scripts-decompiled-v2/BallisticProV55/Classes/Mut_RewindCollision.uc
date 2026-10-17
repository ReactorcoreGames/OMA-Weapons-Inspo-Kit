class Mut_RewindCollision extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var RewindCollisionManager RwColMgr;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x67
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Log("Mut_RewindCollision is not required outside of dedicated servers.");
		Destroy();
	}
	RwColMgr = new Class'BCoreProV55.RewindCollisionManager';
	RwColMgr.Level = Level;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local BallisticWeapon BW;
	local BallisticPawn P;

	BW = BallisticWeapon(Other);
	// End:0x31
	if(BW != none)
	{
		BW.RwColMgr = RwColMgr;
		return true;
	}
	P = BallisticPawn(Other);
	// End:0x76
	if(P != none)
	{
		P.RwColMgr = RwColMgr;
		RwColMgr.RegisterPawn(P);
		return true;
	}
	return true;
	//return;	
}

function Destroyed()
{
	RwColMgr.Level = none;
	RwColMgr = none;
	super.Destroyed();
	//return;	
}

defaultproperties
{
	FriendlyName="BallisticPro: Server Rewind Collision"
	Description="This mutator implements rewind-based collision detection for network games. Do not use offline."
}
