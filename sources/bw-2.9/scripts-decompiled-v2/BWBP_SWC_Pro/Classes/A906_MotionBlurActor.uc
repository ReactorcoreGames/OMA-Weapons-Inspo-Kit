class A906_MotionBlurActor extends BC_MotionBlurActor;

simulated function PreBeginPlay()
{
	//return;	
}

simulated function InitMotionBlur(float NewBlurFactor, float NewBlurTime, optional bool bNoFading, optional bool bNoAdd)
{
	PC = Level.GetLocalPlayerController();
	// End:0x26
	if(PC == none)
	{
		Destroy();		
	}
	else
	{
		// End:0x90
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
			// End:0xFD
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

static function BC_MotionBlurActor DoMotionBlur(PlayerController PC, float NewBlurFactor, float NewBlurTime, optional bool bNoFading)
{
	local BC_MotionBlurActor B;
	local int i;

	// End:0x0D
	if(PC == none)
	{
		return none;
	}
	i = 0;
	J0x14:

	// End:0x78 [Loop If]
	if(i < PC.Attached.Length)
	{
		// End:0x6E
		if(BC_MotionBlurActor(PC.Attached[i]) != none)
		{
			B = BC_MotionBlurActor(PC.Attached[i]);
			// [Explicit Break]
			goto J0x78;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	J0x78:

	// End:0xBF
	if(B == none)
	{
		B = PC.Spawn(default.Class, PC,, PC.Location);
		B.SetBase(PC);
	}
	// End:0xE9
	if(B != none)
	{
		B.InitMotionBlur(NewBlurFactor, NewBlurTime, bNoFading);
	}
	return B;
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
	i = 0;
	J0x14:

	// End:0x78 [Loop If]
	if(i < PC.CameraEffects.Length)
	{
		// End:0x6E
		if(MotionBlur(PC.CameraEffects[i]) != none)
		{
			MBlur = MotionBlur(PC.CameraEffects[i]);
			// [Explicit Break]
			goto J0x78;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	J0x78:

	// End:0x92
	if(MBlur == none)
	{
		MBlur = new Class'Engine.MotionBlur';
	}
	// End:0xC7
	if(bNoFade)
	{
		MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor)));		
	}
	else
	{
		MBlur.BlurAlpha = byte(float(255) - (float(255) * FMin(1.0000000, BlurFactor * ((BlurEndTime - Level.TimeSeconds) / BlurTime))));
	}
	bIsBlurred = true;
	// End:0x16D
	if((PC.CameraEffects.Length < 1) || PC.CameraEffects[PC.CameraEffects.Length - 1] != MBlur)
	{
		PC.AddCameraEffect(MBlur, true);
	}
	//return;	
}

