class FadeColor extends ConstantMaterial
	native
	editinlinenew
	collapsecategories
	safereplace
	hidecategories(Object);

enum EColorFadeType
{
	FC_Linear,                      // 0
	FC_Sinusoidal                   // 1
};

var() Color Color1;
var() Color Color2;
var() float FadePeriod;
var() float FadePhase;
var() FadeColor.EColorFadeType ColorFadeType;

