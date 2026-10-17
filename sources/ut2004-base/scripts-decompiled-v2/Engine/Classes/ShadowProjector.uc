class ShadowProjector extends Projector
	placeable;

var() Actor ShadowActor;
var() Vector LightDirection;
var() float LightDistance;
var() bool RootMotion;
var() bool bBlobShadow;
var() bool bShadowActive;
var ShadowBitmapMaterial ShadowTexture;

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	//return;	
}

event Destroyed()
{
	// End:0x5A
	if(ShadowTexture != none)
	{
		ShadowTexture.ShadowActor = none;
		// End:0x4C
		if(!ShadowTexture.Invalid)
		{
			Level.ObjectPool.FreeObject(ShadowTexture);
		}
		ShadowTexture = none;
		ProjTexture = none;
	}
	super(Actor).Destroyed();
	//return;	
}

function InitShadow()
{
	local Plane BoundingSphere;

	// End:0x1A9
	if(ShadowActor != none)
	{
		BoundingSphere = ShadowActor.GetRenderBoundingSphere();
		FOV = int((Atan((BoundingSphere.W * float(2)) + float(160), LightDistance) * float(180)) / 3.1415930);
		ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine.ShadowBitmapMaterial'));
		ProjTexture = ShadowTexture;
		// End:0x172
		if(ShadowTexture != none)
		{
			SetDrawScale((LightDistance * Tan(((0.5000000 * float(FOV)) * 3.1415930) / float(180))) / (0.5000000 * float(ShadowTexture.USize)));
			ShadowTexture.Invalid = false;
			ShadowTexture.bBlobShadow = bBlobShadow;
			ShadowTexture.ShadowActor = ShadowActor;
			ShadowTexture.LightDirection = Normal(LightDirection);
			ShadowTexture.LightDistance = LightDistance;
			ShadowTexture.LightFOV = float(FOV);
			ShadowTexture.CullDistance = CullDistance;
			Enable('Tick');
			UpdateShadow();			
		}
		else
		{
			Log(string(Name) $ ".InitShadow: Failed to allocate texture");
		}		
	}
	else
	{
		Log(string(Name) $ ".InitShadow: No actor");
	}
	//return;	
}

function UpdateShadow()
{
	local Coords C;

	DetachProjector(true);
	// End:0x12A
	if(((((ShadowActor != none) && !ShadowActor.bHidden) && (Level.TimeSeconds - ShadowActor.LastRenderTime) < float(4)) && ShadowTexture != none) && bShadowActive)
	{
		// End:0x81
		if(ShadowTexture.Invalid)
		{
			Destroy();			
		}
		else
		{
			// End:0xE5
			if((RootMotion && int(ShadowActor.DrawType) == int(2)) && ShadowActor.Mesh != none)
			{
				C = ShadowActor.GetBoneCoords('None');
				SetLocation(C.Origin);				
			}
			else
			{
				SetLocation(ShadowActor.Location + vect(0.0000000, 0.0000000, 5.0000000));
			}
			SetRotation(Rotator(Normal(-LightDirection)));
			ShadowTexture.Dirty = true;
			AttachProjector();
		}
	}
	//return;	
}

function Tick(float DeltaTime)
{
	UpdateShadow();
	//return;	
}

defaultproperties
{
	bShadowActive=true
	bProjectActor=false
	bClipBSP=true
	bGradient=true
	bProjectOnAlpha=true
	bProjectOnParallelBSP=true
	bDynamicAttach=true
	CullDistance=1200.0000000
	bStatic=false
	bOwnerNoSee=true
}
