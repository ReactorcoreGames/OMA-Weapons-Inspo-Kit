class Material extends Object
	native
	collapsecategories
	noexport
	safereplace
	hidecategories(Object);

enum ESurfaceTypes
{
	EST_Default,                    // 0
	EST_Rock,                       // 1
	EST_Dirt,                       // 2
	EST_Metal,                      // 3
	EST_Wood,                       // 4
	EST_Plant,                      // 5
	EST_Flesh,                      // 6
	EST_Ice,                        // 7
	EST_Snow,                       // 8
	EST_Water,                      // 9
	EST_Glass,                      // 10
	EST_Custom00,                   // 11
	EST_Custom01,                   // 12
	EST_Custom02,                   // 13
	EST_Custom03,                   // 14
	EST_Custom04,                   // 15
	EST_Custom05,                   // 16
	EST_Custom06,                   // 17
	EST_Custom07,                   // 18
	EST_Custom08,                   // 19
	EST_Custom09,                   // 20
	EST_Custom10,                   // 21
	EST_Custom11,                   // 22
	EST_Custom12,                   // 23
	EST_Custom13,                   // 24
	EST_Custom14,                   // 25
	EST_Custom15,                   // 26
	EST_Custom16,                   // 27
	EST_Custom17,                   // 28
	EST_Custom18,                   // 29
	EST_Custom19,                   // 30
	EST_Custom20,                   // 31
	EST_Custom21,                   // 32
	EST_Custom22,                   // 33
	EST_Custom23,                   // 34
	EST_Custom24,                   // 35
	EST_Custom25,                   // 36
	EST_Custom26,                   // 37
	EST_Custom27,                   // 38
	EST_Custom28,                   // 39
	EST_Custom29,                   // 40
	EST_Custom30,                   // 41
	EST_Custom31                    // 42
};

var() Material FallbackMaterial;
var Material DefaultMaterial;
var const transient bool UseFallback;
var const transient bool Validated;
var() Material.ESurfaceTypes SurfaceType;
var int MaterialType;

function Reset()
{
	// End:0x1A
	if(FallbackMaterial != none)
	{
		FallbackMaterial.Reset();
	}
	//return;	
}

function Trigger(Actor Other, Actor EventInstigator)
{
	// End:0x24
	if(FallbackMaterial != none)
	{
		FallbackMaterial.Trigger(Other, EventInstigator);
	}
	//return;	
}

// Export UMaterial::execMaterialUSize(FFrame&, void* const)
native function int MaterialUSize();

// Export UMaterial::execMaterialVSize(FFrame&, void* const)
native function int MaterialVSize();

defaultproperties
{
	DefaultMaterial=Texture'Engine.DefaultTexture'
}
