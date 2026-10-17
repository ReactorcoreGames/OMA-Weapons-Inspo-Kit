class WeaponCamo extends Object
	editinlinenew;

struct MaterialSwap
{
	var() Material Material;
	var() string MaterialName;
	var() int Index;
	var() int pIndex;
	var() int AIndex;
};

var() int Weight;
var() string CamoName;
var() array<MaterialSwap> WeaponMaterialSwaps;
var() int Index;

