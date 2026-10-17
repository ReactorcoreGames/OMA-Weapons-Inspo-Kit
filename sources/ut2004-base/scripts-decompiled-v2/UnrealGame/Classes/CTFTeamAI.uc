class CTFTeamAI extends TeamAI
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var CTFFlag FriendlyFlag;
var CTFFlag EnemyFlag;
var float LastGotFlag;

function SquadAI AddSquadWithLeader(Controller C, GameObjective O)
{
	local CTFSquadAI S;

	// End:0x1F
	if(O == none)
	{
		O = EnemyFlag.HomeBase;
	}
	S = CTFSquadAI(super.AddSquadWithLeader(C, O));
	// End:0x6D
	if(S != none)
	{
		S.FriendlyFlag = FriendlyFlag;
		S.EnemyFlag = EnemyFlag;
	}
	return S;
	//return;	
}

defaultproperties
{
	SquadType=Class'UnrealGame.CTFSquadAI'
	OrderList[0]="Attack"
	OrderList[1]="Defend"
	OrderList[2]="Attack"
	OrderList[3]="Attack"
	OrderList[4]="Attack"
	OrderList[5]="Defend"
	OrderList[6]="Freelance"
	OrderList[7]="Attack"
}
