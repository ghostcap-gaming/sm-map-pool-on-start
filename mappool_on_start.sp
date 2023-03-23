#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>

bool g_bLateLoad = false;

public Plugin myinfo = {
	name = "MapPool on start",
	author = "Lerrdy",
	description = "Randomly chooses a map from a predetermined pool",
	version = "0.1",
	url = "https://ghostcap.com"
}

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max) {
	g_bLateLoad = late;
	
	return APLRes_Success;
}

public void OnPluginStart() {
	if (!g_bLateLoad)
		CreateTimer(10.0, Timer_Map);
}

public Action Timer_Map(Handle Timer) {
	int iRandom = GetRandomInt(0,4);
	
	switch(iRandom) {
		case 0:{ return Plugin_Stop;}
		case 1:{ if (IsMapValid("ze_atix_panic_v1")) ServerCommand("map ze_atix_panic_v1");}
		case 2:{ if (IsMapValid("ze_mojos_minigames_v1_4_1")) ServerCommand("map ze_mojos_minigames_v1_4_1");}
		case 3:{ if (IsMapValid("ze_random_p2")) ServerCommand("map ze_random_p2");}
		case 4:{ if (IsMapValid("ze_voodoo_islands_p5")) ServerCommand("map ze_voodoo_islands_p5");}
	}
	
	return Plugin_Stop;
}