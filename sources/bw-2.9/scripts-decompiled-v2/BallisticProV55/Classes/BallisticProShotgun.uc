class BallisticProShotgun extends BallisticShotgun
	abstract
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float CrosshairSpreadAngle;
var int MaxSpreadFactor;

simulated function PostBeginPlay()
{
	super(BallisticWeapon).PostBeginPlay();
	CrosshairSpreadAngle = BallisticProShotgunFire(bFireMode[0]).GetCrosshairInaccAngle();
	MaxSpreadFactor = BallisticProShotgunFire(bFireMode[0]).MaxSpreadFactor;
	//return;	
}

simulated function DrawSimpleCrosshairs(Canvas C)
{
	local float offset;

	offset = ((C.ClipX / float(2)) * Tan((CrosshairSpreadAngle * Lerp(AimComponent.GetFireChaos(), 1.0000000, float(MaxSpreadFactor))) * 0.0000959)) / Tan((Instigator.Controller.FovAngle / float(2)) * 0.0174533);
	// End:0x97
	if(!bScopeView)
	{
		offset += AimComponent.CalcCrosshairOffset(C);
	}
	DrawSimpleCrosshairBars(C, int(offset), int(offset));
	//return;	
}

