class BallisticPreloadReplicationInfo extends ReplicationInfo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() string CurrentName[255];
var() string MeshList[255];
var() int PreloadNum;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentName, PreloadNum;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		MeshList;
}

