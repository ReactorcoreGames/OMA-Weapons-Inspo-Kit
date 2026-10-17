class BC_MotionBlurActor extends Actor
	notplaceable;

var PlayerController PC;
var MotionBlur MBlur;
var float BlurEndTime;
var float BlurTime;
var float BlurFactor;
var bool bNoFade;
var bool bIsBlurred;
var bool bWasDead;

simulated function PreBeginPlay()
{
	// End:0x17
	if(!Class'BCoreProV55.BallisticMod'.default.bUseMotionBlur)
	{
		Destroy();
	}
	//return;	
}

simulated function InitMotionBlur(float NewBlurFactor, float NewBlurTime, optional bool bNoFading, optional bool bNoAdd)
{
	PC = Level.GetLocalPlayerController();
	// End:0x3C
	if((PC == none) || !Class'BCoreProV55.BallisticMod'.default.bUseMotionBlur)
	{
		Destroy();		
	}
	else
	{
		// End:0xA6
		if(bNoAdd || BlurEndTime < Level.TimeSeconds)
		{
			BlurFactor = NewBlurFactor;
			BlurTime = NewBlurTime;
			BlurEndTime = Level.TimeSeconds + NewBlurTime;
			bNoFade = bNoFading;
			StartBlur();			
		}
		else
		{
			// End:0x113
			if(((BlurEndTime - Level.TimeSeconds) + NewBlurTime) > float(10))
			{
				BlurFactor += NewBlurFactor;
				BlurTime += NewBlurTime;
				BlurEndTime = Level.TimeSeconds + float(10);
				bNoFade = bNoFading;
				StartBlur();				
			}
			else
			{
				BlurFactor += NewBlurFactor;
				BlurTime += NewBlurTime;
				BlurEndTime += NewBlurTime;
				bNoFade = bNoFading;
				StartBlur();
			}
		}
	}
	//return;	
}

simulated function StartBlur()
{
	local int i;

	// End:0x0D
	if(PC == none)
	{
		return;
	}
	// End:0x21
	if(PC.bGodMode)
	{
		return;
	}
	i = 0;
	J0x28:

	// End:0x8C [Loop If]
	if(i < PC.CameraEffects.Length)
	{
		// End:0x82
		if(MotionBlur(PC.CameraEffects[i]) != none)
		{
			MBlur = MotionBlur(PC.CameraEffects[i]);
			// [Explicit Break]
			goto J0x8C;
		}
		i++;
		// [Loop Continue]
		goto J0x28;
	}
	J0x8C:

	// End:0xA6
	if(MBlur == none)
	{
		MBlur = new Class'Engine.MotionBlur';
	}
	// End:0xDB
	if(bNoFade)
	{
		MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor)));		
	}
	else
	{
		MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor * ((BlurEndTime - Level.TimeSeconds) / BlurTime))));
	}
	bIsBlurred = true;
	// End:0x181
	if((PC.CameraEffects.Length < 1) || PC.CameraEffects[PC.CameraEffects.Length - 1] != MBlur)
	{
		PC.AddCameraEffect(MBlur, true);
	}
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x24
	if((PC == none) || PC.bGodMode)
	{
		Destroy();
		return;
	}
	// End:0x31
	if(!bIsBlurred)
	{
		return;
	}
	// End:0x74
	if(!PC.IsDead())
	{
		// End:0x71
		if(bWasDead)
		{
			bIsBlurred = false;
			UnBlurIt();
			BlurTime = 0.0000000;
			bWasDead = false;
			return;
		}		
	}
	else
	{
		bWasDead = true;
	}
	// End:0xB0
	if(Level.TimeSeconds > BlurEndTime)
	{
		bIsBlurred = false;
		UnBlurIt();
		BlurTime = 0.0000000;		
	}
	else
	{
		// End:0x137
		if(MBlur != none)
		{
			// End:0xF0
			if(bNoFade)
			{
				MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor)));				
			}
			else
			{
				MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor * ((BlurEndTime - Level.TimeSeconds) / BlurTime))));
			}
		}
	}
	//return;	
}

simulated event Destroyed()
{
	UnBlurIt();
	super.Destroyed();
	//return;	
}

simulated function UnBlurIt()
{
	// End:0x1F
	if(MBlur != none)
	{
		PC.RemoveCameraEffect(MBlur);
	}
	//return;	
}

static function BC_MotionBlurActor DoMotionBlur(PlayerController PC, float NewBlurFactor, float NewBlurTime, optional bool bNoFading)
{
	local BC_MotionBlurActor B;
	local int i;

	// End:0x23
	if((PC == none) || !Class'BCoreProV55.BallisticMod'.default.bUseMotionBlur)
	{
		return none;
	}
	i = 0;
	J0x2A:

	// End:0x8E [Loop If]
	if(i < PC.Attached.Length)
	{
		// End:0x84
		if(BC_MotionBlurActor(PC.Attached[i]) != none)
		{
			B = BC_MotionBlurActor(PC.Attached[i]);
			// [Explicit Break]
			goto J0x8E;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	J0x8E:

	// End:0xD5
	if(B == none)
	{
		B = PC.Spawn(default.Class, PC,, PC.Location);
		B.SetBase(PC);
	}
	// End:0xFF
	if(B != none)
	{
		B.InitMotionBlur(NewBlurFactor, NewBlurTime, bNoFading);
	}
	return B;
	//return;	
}

defaultproperties
{
	bHidden=true
	RemoteRole=0
}
