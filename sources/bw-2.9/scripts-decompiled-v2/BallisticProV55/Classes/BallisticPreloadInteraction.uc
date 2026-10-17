class BallisticPreloadInteraction extends Interaction;

var() float FontScaleX;
var() float FontScaleY;
var() float TextOnePosX;
var() float TextOnePosY;
var() float TextTwoPosX;
var() float TextTwoPosY;
var() int BGStyle;
var() int BGMatSizeX;
var() int BGMatSizeY;
var() int BGMatPosX;
var() int BGMatPosY;
var() int MatOnePosX;
var() int MatOnePosY;
var() int MatTwoPosX;
var() int MatTwoPosY;
var() int MaterialSize;
var() int Pause;
var() int WeaponNumber;
var() int LocOffSetX;
var() int LocOffSetZ;
var() Font MessagesFont;
var() Color BGMatColour;
var() BallisticPreloadReplicationInfo MyRI;
var() Actor PreloadMeshActor;
var bool bDisplayDebugText;

event Initialized()
{
	Pause = 0;
	WeaponNumber = 0;
	PreloadMeshActor = ViewportOwner.Actor.Spawn(Class'BallisticProV55.BallisticPreloadMesh', ViewportOwner.Actor.Pawn);
	//return;	
}

simulated function PostRender(Canvas Canvas)
{
	local Canvas C;
	local BallisticPreloadReplicationInfo RI;
	local Vector X, Y, Z, FinalLoc;
	local Mesh WeaponMesh;

	PreloadMeshActor.bHidden = true;
	C = Canvas;
	// End:0x43A
	if(ViewportOwner.Actor.Pawn != none)
	{
		// End:0x400
		if(MyRI != none)
		{
			Pause++;
			// End:0x65
			if(Pause == 15)
			{
				Pause = 0;
				WeaponNumber++;
			}
			// End:0xA6
			if(WeaponNumber > MyRI.PreloadNum)
			{
				// End:0x94
				if(PreloadMeshActor != none)
				{
					PreloadMeshActor.Destroy();
				}
				Master.RemoveInteraction(self);
				return;
			}
			// End:0x2F2
			if(bDisplayDebugText)
			{
				C.Font = MessagesFont;
				C.FontScaleX = FontScaleX;
				C.FontScaleY = FontScaleY;
				C.Style = 5;
				C.DrawColor.R = byte(255);
				C.DrawColor.G = byte(255);
				C.DrawColor.B = 0;
				C.SetPos(C.ClipX * TextOnePosX, C.ClipY * TextOnePosY);
				// End:0x1D0
				if(MyRI.CurrentName[WeaponNumber] != "")
				{
					C.DrawTextClipped("Preloading Weapon: " @ MyRI.CurrentName[WeaponNumber]);					
				}
				else
				{
					C.DrawTextClipped("Preloading Weapon ");
				}
				C.Font = MessagesFont;
				C.FontScaleX = FontScaleX;
				C.FontScaleY = FontScaleY;
				C.Style = 5;
				C.DrawColor.R = byte(255);
				C.DrawColor.G = 150;
				C.DrawColor.B = 0;
				C.SetPos(C.ClipX * TextTwoPosX, C.ClipY * TextTwoPosY);
				C.DrawTextClipped("You may experience some lag");
				C.Reset();
			}
			// End:0x3FD
			if((PreloadMeshActor != none) && MyRI.MeshList[WeaponNumber] != "")
			{
				WeaponMesh = Mesh(DynamicLoadObject(MyRI.MeshList[WeaponNumber], Class'Engine.Mesh', true));
				ViewportOwner.Actor.Pawn.GetAxes(ViewportOwner.Actor.Pawn.Rotation, X, Y, Z);
				FinalLoc = (ViewportOwner.Actor.Pawn.Location + (float(LocOffSetX) * X)) + (float(LocOffSetZ) * Z);
				PreloadMeshActor.SetLocation(FinalLoc);
				PreloadMeshActor.LinkMesh(WeaponMesh, false);
			}			
		}
		else
		{
			// End:0x439
			foreach ViewportOwner.Actor.DynamicActors(Class'BallisticProV55.BallisticPreloadReplicationInfo', RI)
			{
				// End:0x438
				if(RI != none)
				{
					MyRI = RI;
				}				
			}			
		}
	}
	//return;	
}

simulated function NotifyLevelChange()
{
	Master.RemoveInteraction(self);
	//return;	
}

defaultproperties
{
	FontScaleX=0.5000000
	FontScaleY=0.5000000
	TextOnePosX=0.3500000
	TextOnePosY=0.8500000
	TextTwoPosX=0.3500000
	TextTwoPosY=0.8900000
	BGStyle=1
	BGMatSizeX=138
	BGMatSizeY=138
	BGMatPosX=8
	BGMatPosY=498
	MatOnePosX=10
	MatOnePosY=500
	MatTwoPosX=10
	MatTwoPosY=570
	MaterialSize=64
	LocOffSetX=128
	MessagesFont=Font'2k4Fonts.Verdana24'
	BGMatColour=(R=255,G=255,B=255,A=255)
	bDisplayDebugText=true
	bVisible=true
	bRequiresTick=true
}
