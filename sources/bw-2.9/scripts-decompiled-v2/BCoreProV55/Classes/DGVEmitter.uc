class DGVEmitter extends BallisticEmitter;

var() bool bAutoAlignVelocity;
var Rotator OldRotation;
var Range SVX[8];
var Range SVY[8];
var Range SVZ[8];
var() array<int> DisableDGV;
var() bool bAutoInit;
var() bool bAlignOnTrigger;
var() bool bVerticalZ;
var() bool bYIsSpread;
var() bool bModifyLossRange;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x15
	if(bAutoInit)
	{
		InitDGV();
	}
	//return;	
}

simulated function InitDGV()
{
	local int i;

	i = 0;
	J0x07:

	// End:0xB6 [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x3D
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0xAC;
		}
		SVX[i] = Emitters[i].StartVelocityRange.X;
		SVY[i] = Emitters[i].StartVelocityRange.Y;
		SVZ[i] = Emitters[i].StartVelocityRange.Z;
		J0xAC:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0xD3
	if(bAutoAlignVelocity)
	{
		OldRotation = Rotation;
		SetTimer(0.1000000, true);
	}
	AlignVelocity();
	//return;	
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	// End:0x0F
	if(bAlignOnTrigger)
	{
		AlignVelocity();
	}
	super(Emitter).Trigger(Other, EventInstigator);
	//return;	
}

simulated function AlignVelocity()
{
	local int i;
	local Vector X, Y, Z, VMax, vmin;

	GetAxes(Rotation, X, Y, Z);
	i = 0;
	J0x1D:

	// End:0x81A [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x53
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0x810;
		}
		// End:0x17A
		if(bVerticalZ)
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Min);
			// End:0x177
			if(bYIsSpread)
			{
				VMax = VMax + ((Z * SVY[i].Max) * Abs(X.Z));
				vmin = vmin + ((Z * SVY[i].Min) * Abs(X.Z));
			}			
		}
		else
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (Z * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (Z * SVZ[i].Min);
		}
		Emitters[i].StartVelocityRange = VtoRV(VMax, vmin);
		VMax = ((X * default.Emitters[i].StartLocationRange.X.Max) + (Y * default.Emitters[i].StartLocationRange.Y.Max)) + (Z * default.Emitters[i].StartLocationRange.Z.Max);
		vmin = ((X * default.Emitters[i].StartLocationRange.X.Min) + (Y * default.Emitters[i].StartLocationRange.Y.Min)) + (Z * default.Emitters[i].StartLocationRange.Z.Min);
		Emitters[i].StartLocationRange = VtoRV(VMax, vmin);
		Emitters[i].StartLocationOffset = ((X * default.Emitters[i].StartLocationOffset.X) + (Y * default.Emitters[i].StartLocationOffset.Y)) + (Z * default.Emitters[i].StartLocationOffset.Z);
		// End:0x470
		if(SpriteEmitter(Emitters[i]) != none)
		{
			SpriteEmitter(Emitters[i]).ProjectionNormal = ((X * SpriteEmitter(default.Emitters[i]).ProjectionNormal.X) + (Y * SpriteEmitter(default.Emitters[i]).ProjectionNormal.Y)) + (Z * SpriteEmitter(default.Emitters[i]).ProjectionNormal.Z);
		}
		// End:0x810
		if(bModifyLossRange)
		{
			VMax.X = (Abs(X.X * default.Emitters[i].VelocityLossRange.X.Max) + Abs(X.Y * default.Emitters[i].VelocityLossRange.X.Max)) + Abs(X.Z * default.Emitters[i].VelocityLossRange.X.Max);
			VMax.Y = (Abs(Y.X * default.Emitters[i].VelocityLossRange.Y.Max) + Abs(Y.Y * default.Emitters[i].VelocityLossRange.Y.Max)) + Abs(Y.Z * default.Emitters[i].VelocityLossRange.Y.Max);
			VMax.Z = (Abs(Z.X * default.Emitters[i].VelocityLossRange.Z.Max) + Abs(Z.Y * default.Emitters[i].VelocityLossRange.Z.Max)) + Abs(Z.Z * default.Emitters[i].VelocityLossRange.Z.Max);
			vmin.X = (Abs(X.X * default.Emitters[i].VelocityLossRange.X.Min) + Abs(X.Y * default.Emitters[i].VelocityLossRange.X.Min)) + Abs(X.Z * default.Emitters[i].VelocityLossRange.X.Min);
			vmin.Y = (Abs(Y.X * default.Emitters[i].VelocityLossRange.Y.Min) + Abs(Y.Y * default.Emitters[i].VelocityLossRange.Y.Min)) + Abs(Y.Z * default.Emitters[i].VelocityLossRange.Y.Min);
			vmin.Z = (Abs(Z.X * default.Emitters[i].VelocityLossRange.Z.Min) + Abs(Z.Y * default.Emitters[i].VelocityLossRange.Z.Min)) + Abs(Z.Z * default.Emitters[i].VelocityLossRange.Z.Min);
			Emitters[i].VelocityLossRange = VtoRV(VMax, vmin);
		}
		J0x810:

		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	//return;	
}

simulated event Timer()
{
	// End:0x0D
	if(!bAutoAlignVelocity)
	{
		return;
	}
	// End:0x2D
	if(Rotation != OldRotation)
	{
		OldRotation = Rotation;
		AlignVelocity();
	}
	//return;	
}

defaultproperties
{
	bAutoInit=true
	bAlignOnTrigger=true
	bVerticalZ=true
	bYIsSpread=true
	bModifyLossRange=true
	bDirectional=true
}
