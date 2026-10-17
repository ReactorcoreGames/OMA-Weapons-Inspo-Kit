class PowerLink extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct LinkInfo
{
	var ONSPowerCore Node;
	var byte Team;
	var byte Stage;
};

var LinkInfo Nodes[2];
var Color LinkColor[3];
//var delegate<UpdateNode0> __UpdateNode0__Delegate;
//var delegate<UpdateNode1> __UpdateNode1__Delegate;

delegate UpdateNode0(ONSPowerCore Node)
{
	//return;	
}

delegate UpdateNode1(ONSPowerCore Node)
{
	//return;	
}

private function SetNode(ONSPowerCore Node, bool bZero)
{
	local int i;

	// End:0x27
	if(bZero)
	{
		i = 0;
		__UpdateNode0__Delegate = Node.__UpdateLinkState__Delegate;		
	}
	else
	{
		i = 1;
		__UpdateNode1__Delegate = Node.__UpdateLinkState__Delegate;
	}
	Node.__UpdateLinkState__Delegate = UpdateNode;
	Nodes[i].Node = Node;
	Nodes[i].Team = Node.DefenderTeamIndex;
	Nodes[i].Stage = Node.CoreStage;
	//return;	
}

function bool SetNodes(ONSPowerCore A, ONSPowerCore B)
{
	// End:0x1A
	if((A == none) || B == none)
	{
		return false;
	}
	SetNode(A, true);
	SetNode(B, false);
	A.AddPowerLink(B);
	A.PowerCoreReset();
	B.PowerCoreReset();
	return true;
	//return;	
}

function GetNodes(out ONSPowerCore A, out ONSPowerCore B)
{
	A = Nodes[0].Node;
	B = Nodes[1].Node;
	//return;	
}

function bool HasNodes(ONSPowerCore A, ONSPowerCore B)
{
	// End:0x1A
	if((A == none) || B == none)
	{
		return false;
	}
	return ((A == Nodes[0].Node) && B == Nodes[1].Node) || (A == Nodes[1].Node) && B == Nodes[0].Node;
	//return;	
}

simulated event Destroyed()
{
	super(Actor).Destroyed();
	__UpdateNode0__Delegate = None;
	__UpdateNode1__Delegate = None;
	Nodes[0].Node.RemovePowerLink(Nodes[1].Node);
	Nodes[1].Node.RemovePowerLink(Nodes[0].Node);
	ClearNode(true);
	ClearNode(false);
	//return;	
}

private function ClearNode(bool bZero)
{
	local int i;

	// End:0x13
	if(bZero)
	{
		i = 0;		
	}
	else
	{
		i = 1;
	}
	// End:0x7B
	if(Nodes[i].Node != none)
	{
		Nodes[i].Node.PowerCoreReset();
		Nodes[i].Node.__UpdateLinkState__Delegate = None;
		Nodes[i].Node = none;
	}
	//return;	
}

function UpdateNode(ONSPowerCore Node)
{
	local int i;

	// End:0x0D
	if(Node == none)
	{
		return;
	}
	// End:0x3C
	if(Node == Nodes[0].Node)
	{
		i = 0;
		UpdateNode0(Node);		
	}
	else
	{
		// End:0x6B
		if(Node == Nodes[1].Node)
		{
			i = 1;
			UpdateNode1(Node);			
		}
		else
		{
			return;
		}
	}
	Nodes[i].Team = byte(Min(int(Node.DefenderTeamIndex), 2));
	Nodes[i].Stage = Node.CoreStage;
	//return;	
}

function Render(Canvas C, float ColorPercent, bool bShowDisabledNodes)
{
	local Color Color0, Color1, DrawColor;

	// End:0x35
	if(((C == none) || Nodes[0].Node == none) || Nodes[1].Node == none)
	{
		return;
	}
	// End:0x70
	if((!bShowDisabledNodes && int(Nodes[0].Stage) == 255) || int(Nodes[1].Stage) == 255)
	{
		return;
	}
	Color0 = LinkColor[int(Nodes[0].Team)];
	Color1 = LinkColor[int(Nodes[1].Team)];
	// End:0xDD
	if((int(Nodes[0].Stage) == 4) && int(Nodes[1].Stage) == 0)
	{
		DrawColor = Color1;		
	}
	else
	{
		// End:0x116
		if((int(Nodes[1].Stage) == 4) && int(Nodes[0].Stage) == 0)
		{
			DrawColor = Color0;			
		}
		else
		{
			// End:0x172
			if((int(Nodes[0].Stage) == 2) || int(Nodes[0].Stage) == 5)
			{
				Color0 = Color0 * ColorPercent;
				Color1 = Color1 * (1.0000000 - ColorPercent);				
			}
			else
			{
				// End:0x1CB
				if((int(Nodes[1].Stage) == 2) || int(Nodes[0].Stage) == 5)
				{
					Color0 = Color0 * (1.0000000 - ColorPercent);
					Color1 = Color1 * ColorPercent;
				}
			}
			DrawColor = Color0 + Color1;
		}
	}
	Class'Engine.HUD'.static.StaticDrawCanvasLine(C, Nodes[0].Node.HUDLocation.X, Nodes[0].Node.HUDLocation.Y, Nodes[1].Node.HUDLocation.X, Nodes[1].Node.HUDLocation.Y, DrawColor);
	//return;	
}

defaultproperties
{
	Nodes[0]=(Node=none,Team=2,Stage=255)
	Nodes[1]=(Node=none,Team=2,Stage=255)
	LinkColor[0]=(R=255,G=0,B=0,A=255)
	LinkColor[1]=(R=0,G=0,B=255,A=255)
	LinkColor[2]=(R=255,G=255,B=255,A=255)
}
