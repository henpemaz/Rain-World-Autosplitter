state("RainWorld", "steam15") {}

startup {
	// Autosplitter by Henpemaz, for thanks suggestions complaints or corrections, reach me up on Discord Skype Github or whatever, or just submit a PR directly on GitHub
	
	//print("Startup");
	
	// If only people had invented something like Enums in C#...
	// These are here for debugging and for quickly looking up processes IDs
	//var ProcessIDValue = new Dictionary<string,int>(){{"NULL", -1},{"MainMenu", 0},{"Game", 1},{"SleepScreen", 2},{"DeathScreen", 3},{"StarveScreen", 4},{"RegionSelect", 5},{"OptionsMenu", 6},{"MusicPlayer", 7},{"GhostScreen", 8},{"KarmaToMaxScreen", 9},{"SlideShow", 10},{"MenuMic", 11},{"PauseMenu", 12},{"FastTravelScreen", 13},{"RegionsOverviewScreen", 14},{"CustomEndGameScreen", 15},{"InputSelect", 16},{"TutorialControlsPage", 17},{"SlugcatSelect", 18},{"IntroRoll", 19},{"Credits", 20},{"ConsoleOptionsMenu", 21},{"Dream", 22},{"RainWorldSteamManager", 23},{"MultiplayerMenu", 24},{"MultiplayerResults", 25},{"InputOptions", 26},{"Statistics", 27}};

	// var ProcessIDName = new Dictionary<int,string>(){
	// 	{-1, "NULL"},
	// 	{0, "MainMenu"},
	// 	{1, "Game"},
	// 	{2, "SleepScreen"},
	// 	{3, "DeathScreen"},
	// 	{4, "StarveScreen"},
	// 	{5, "RegionSelect"},
	// 	{6, "OptionsMenu"},
	// 	{7, "MusicPlayer"},
	// 	{8, "GhostScreen"},
	// 	{9, "KarmaToMaxScreen"},
	// 	{10, "SlideShow"},
	// 	{11, "MenuMic"},
	// 	{12, "PauseMenu"},
	// 	{13, "FastTravelScreen"},
	// 	{14, "RegionsOverviewScreen"},
	// 	{15, "CustomEndGameScreen"},
	// 	{16, "InputSelect"},
	// 	{17, "TutorialControlsPage"},
	// 	{18, "SlugcatSelect"},
	// 	{19, "IntroRoll"},
	// 	{20, "Credits"},
	// 	{21, "ConsoleOptionsMenu"},
	// 	{22, "Dream"},
	// 	{23, "RainWorldSteamManager"},
	// 	{24, "MultiplayerMenu"},
	// 	{25, "MultiplayerResults"},
	// 	{26, "InputOptions"},
	// 	{27, "Statistics"}};
	// 	
	// vars.ProcessIDValue = ProcessIDValue;
	// vars.ProcessIDName = ProcessIDName;
	
	// SETTINGS
	
	// START condition
	settings.Add("start", true, "Start condition");
	settings.SetToolTip("start", "Starts the timer if you have the option selected when using one of the following slugcats.");
	settings.Add("start_0", false, "Survivor", "start"); 
	settings.Add("start_1", false, "Monk", "start"); 
	settings.Add("start_2", false, "Hunter", "start"); 
	settings.Add("start_any", true, "Any", "start");
	settings.SetToolTip("start_any", "Hopefully works with modded slugcats too...");
	
	
	// COMMON milestones
	settings.Add("common", true, "Milestones");
	settings.Add("tenKarma", false, "Max Karma", "common");
	settings.Add("theMark", false, "The Mark (Monk/Surv)", "common");
	settings.Add("moonNeuron", false, "Give Neuron to Moon (Monk/Surv)", "common");
	settings.Add("moonRevived", false, "Moon Revived (Hunter only)", "common");
	settings.Add("pebblesSeenGreenNeuron", false, "Pebbles Seen Green Neuron (Hunter only)", "common");
	settings.Add("pebblesHasIncreasedRedsKarmaCap", false, "Pebbles Has Increased Reds Karma Cap (Hunter only)", "common");
	settings.Add("ascended", true, "Ascended", "common");
	settings.SetToolTip("ascended", "Splits when you have ascended and the game exits");
	
	
	// SHELTER trigger points
	// Hmmmmm
	

	// KARMA CACHE trigger points
	settings.Add("karma_cache", false, "Karma cache");
	settings.SetToolTip("karma_cache", "Splits when the shelter opens after a starve and you have the specified Karma");
	//settings.Add("kc_0", false, "1 Karma", "karma_cache");
	settings.Add("kc_1", false, "2 Karma", "karma_cache");
	settings.Add("kc_2", false, "3 Karma", "karma_cache");
	settings.Add("kc_3", false, "4 Karma", "karma_cache");
	settings.Add("kc_4", false, "5 Karma", "karma_cache");
	
	
	// MAX KARMA trigger points
	// Hmmmmm
	
	
	// PASSAGES aka ACHIEVEMENTS splits
	settings.Add("achievements", false, "Achievements");
	settings.SetToolTip("achievements", "Splits when you complete each of the specified achievements.");
	settings.Add("ach_0", false, "Survivor", "achievements");
	settings.Add("ach_1", false, "Hunter", "achievements");
	settings.Add("ach_2", false, "Saint", "achievements");
	settings.Add("ach_3", false, "Wanderer", "achievements");
	settings.Add("ach_4", false, "Chieftain", "achievements");
	settings.Add("ach_5", false, "Monk", "achievements");
	settings.Add("ach_6", false, "Outlaw", "achievements");
	settings.Add("ach_7", false, "Dragon Slayer", "achievements");
	settings.Add("ach_8", false, "Scholar", "achievements");
	settings.Add("ach_9", false, "Friend", "achievements");
	
	
	// ECHOS splits
	settings.Add("echos", false, "Echos");
	settings.SetToolTip("echos", "Splits when you meet each of the specified echos.");
	settings.Add("ech_0", false, "Nineteen Spades, Endless Reflections (Chimney Canopy)", "echos");
	settings.Add("ech_1", false, "Droplets upon Five Large Droplets (Sky Islands)", "echos");
	settings.Add("ech_2", false, "A Bell, Eighteen Amber Beads (Farm Arrays)", "echos");
	settings.Add("ech_3", false, "Four Needles under Plentiful Leaves (Shaded Citadel)", "echos");
	settings.Add("ech_4", false, "Six Grains of Gravel, Mountains Abound (The Exterior)", "echos");
	settings.Add("ech_5", false, "Two Sprouts, Twelve Brackets (Subterranean)", "echos");
	
	
	// VOID SEA triggers
	settings.Add("voidsea", false, "Void Sea triggers");
	settings.SetToolTip("voidsea", "Splits in the final room of the game as the encounter with the Void Worm progresses");
	// settings.Add("worms_0", false, "Idle", "voidsea"); // would be buggy across restarts
	settings.Add("worm_1", false, "Get To Player", "voidsea");
	settings.Add("worm_2", false, "Looking", "voidsea");
	settings.Add("worm_3", false, "Attaching String", "voidsea");
	settings.Add("worm_4", false, "String Attached", "voidsea");
	settings.Add("worm_5", false, "Swim Up", "voidsea");
	settings.Add("worm_6", false, "Swim Down", "voidsea");
	settings.Add("worm_7", false, "Depth Reached", "voidsea");
	settings.Add("worm_8", false, "Swim Back Up", "voidsea");
	// There are another set of triggers (VoidSeaScene.DeepDivePhase) but those go through quite rapidly as you move to the second space and the room unloads
	
	
	// GATE trigger points
	settings.Add("gates", false, "Gate animation");
	settings.SetToolTip("gates", "Splits when you are crossing gates and the gate hits a certain state. Might not work correctly if you leave the room before the trigger.");
	// settings.Add("gate_0", false, "Middle-Closed", "gates"); // default state, would be buggy across restarts or multiple gates
	settings.Add("gate_1", false, "Closing AirLock", "gates");
	settings.Add("gate_2", false, "Waiting", "gates");
	settings.Add("gate_3", false, "Opening Middle", "gates");
	settings.Add("gate_4", false, "Middle Open", "gates");
	settings.Add("gate_5", false, "Closing Middle", "gates");
	settings.Add("gate_6", false, "Closed", "gates"); // Most people don't stay around long enough to see this


	// ROOM splits
	settings.Add("rooms", false, "Rooms");
	settings.SetToolTip("rooms", "Splits when entering the selected rooms. You might want a map with room names. Hey I've got a map with room names, its in my github.");
	settings.Add("rooms_once", true, "Don't split when visiting the same room twice", "rooms");
	settings.SetToolTip("rooms_once", "Checks the \"room visited\" property in the save state before splitting.");
	settings.Add("rooms_all", false, "Split entering every single room in the game", "rooms");
	settings.SetToolTip("rooms_all", "So you don't have to check a whole lot of checkboxes.");
	
	settings.Add("GATES_parent", false, "Splits for Gate rooms", "rooms");
	foreach (string room in new List<string>(){"GATE_HI_CC", "GATE_HI_GW", "GATE_DS_GW", "GATE_SI_CC", "GATE_SU_DS", "GATE_SU_HI", "GATE_HI_SH", "GATE_SH_SL", "GATE_GW_SL", "GATE_SI_LF", "GATE_LF_SU", "GATE_CC_UW", "GATE_SH_UW", "GATE_DS_SB", "GATE_SB_SL", "GATE_LF_SB", "GATE_UW_SS", "GATE_SS_UW"} .OrderBy(s => s)){
		settings.Add(room, false, room, "GATES_parent");
	}
	

	settings.Add("CC_parent", false, "Splits for Chimney Canopy (CC)", "rooms");
	foreach (string room in new List<string>(){"CC_S04", "CC_C09", "CC_C12", "CC_A06", "CC_H01", "CC_C07", "CC_B04", "CC_S05", "CC_D01", "CC_C13", "CC_A15", "CC_B08", "CC_B05", "CC_A10", "CC_B01", "CC_B06", "CC_C04", "CC_B13", "CC_C05", "CC_B10", "CC_A12", "CC_S01", "CC_A02", "CC_A16", "CC_C08", "CC_A07", "CC_C11", "CC_B12", "CC_F01", "CC_C03", "CC_A17", "CC_S03", "CC_B11", "CC_B14"} .OrderBy(s => s)){
		settings.Add(room, false, room, "CC_parent");
	}

	settings.Add("DS_parent", false, "Splits for Drainage System (DS)", "rooms");
	foreach (string room in new List<string>(){"DS_S03", "DS_B02", "DS_A22", "DS_A06", "DS_A02", "DS_A01", "DS_A20", "DS_S01r", "DS_B03", "DS_A15", "DS_A23", "DS_A09", "DS_A19", "DS_B04", "DS_A08", "DS_S04", "DS_B07", "DS_A16", "DS_A07", "DS_A17", "DS_A24", "DS_A11", "DS_C04", "DS_A14", "DS_B01", "DS_A25", "DS_B08", "DS_C01", "DS_S02l", "DS_A21", "DS_C03", "DS_B10", "DS_D01", "DS_A05", "DS_D03", "DS_A27", "DS_C02", "DS_D02", "DS_A26", "DS_B06", "DS_A13", "DS_A10"} .OrderBy(s => s)){
		settings.Add(room, false, room, "DS_parent");
	}

	settings.Add("HI_parent", false, "Splits for Industrial Complex (HI)", "rooms");
	foreach (string room in new List<string>(){"HI_C13", "HI_S06", "HI_B04", "HI_S03", "HI_B12", "HI_B13", "HI_A15", "HI_A20", "HI_S01", "HI_A14", "HI_A07", "HI_C02", "HI_B02", "HI_A22", "HI_C14", "HI_C01", "HI_B03", "HI_B08", "HI_C04", "HI_A25", "HI_A21", "HI_S02", "HI_B06", "HI_A10", "HI_S05", "HI_C11", "HI_B09", "HI_B07", "HI_B14", "HI_D01", "HI_C03", "HI_A11", "HI_B15", "HI_A04", "HI_A26", "HI_B05", "HI_A16", "HI_A17", "HI_A27", "HI_A23", "HI_A18", "HI_C05", "HI_A06", "HI_A24", "HI_S04", "HI_A19"} .OrderBy(s => s)){
		settings.Add(room, false, room, "HI_parent");
	}

	settings.Add("GW_parent", false, "Splits for Garbage Wastes (GW)", "rooms");
	foreach (string room in new List<string>(){"GW_S05", "GW_S04", "GW_S03", "GW_C06", "GW_S02", "GW_E02", "GW_B02", "GW_C03", "GW_C05", "GW_A24", "GW_B05", "GW_A20", "GW_A21", "GW_S07", "GW_A19", "GW_B01", "GW_A01", "GW_C01", "GW_B04", "GW_A12", "GW_A05", "GW_A08", "GW_A06", "GW_S01", "GW_A07", "GW_A10", "GW_D01", "GW_B03", "GW_A14", "GW_B07", "GW_A04", "GW_S06", "GW_C08", "GW_C02", "GW_A13", "GW_A11", "GW_S08", "GW_B06", "GW_A22", "GW_A23", "GW_C11", "GW_C04", "GW_B08", "GW_B09", "GW_D02", "GW_C07", "GW_C10", "GW_E01", "GW_C09"} .OrderBy(s => s)){
		settings.Add(room, false, room, "GW_parent");
	}

	settings.Add("SI_parent", false, "Splits for Sky Islands (SI)", "rooms");
	foreach (string room in new List<string>(){"SI_S03", "SI_A07", "SI_A06", "SI_B04", "SI_B02", "SI_C07", "SI_C02", "SI_C01", "SI_C04", "SI_D01", "SI_C03", "SI_B01", "SI_A20", "SI_A21", "SI_D03", "SI_A17", "SI_S04", "SI_A18", "SI_C05", "SI_A28", "SI_A27", "SI_S05", "SI_C06", "SI_B10", "SI_B09", "SI_A02", "SI_A23", "SI_C08", "SI_D05", "SI_B11", "SI_D06", "SI_B12", "SI_B03", "SI_C09", "SI_D07", "SI_B13"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SI_parent");
	}

	settings.Add("SU_parent", false, "Splits for Outskirts (SU)", "rooms");
	foreach (string room in new List<string>(){"SU_B13", "SU_A33", "SU_B04", "SU_A34", "SU_A37", "SU_S04", "SU_A63", "SU_B12", "SU_A17", "SU_A40", "SU_B07", "SU_A02", "SU_A53", "SU_A39", "SU_A38", "SU_A25", "SU_A24", "SU_A23", "SU_A22", "SU_C04", "SU_A41", "SU_A42", "SU_A43", "SU_A44", "SU_S01", "SU_A06", "SU_A36", "SU_B08", "SU_B09", "SU_A35", "SU_A20", "SU_A31", "SU_A32", "SU_B05", "SU_A07", "SU_A45", "SU_C02", "SU_B06", "SU_B11", "SU_A12", "SU_A13", "SU_B02", "SU_A29", "SU_B10", "SU_A10", "SU_B01", "SU_S03", "SU_A04", "SU_C01", "SU_B14", "SU_A30"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SU_parent");
	}

	settings.Add("SH_parent", false, "Splits for Shaded Citadel (SH)", "rooms");
	foreach (string room in new List<string>(){"SH_C11", "SH_S03", "SH_S05", "SH_D01", "SH_A25", "SH_A13", "SH_A14", "SH_C02", "SH_B08", "SH_A11", "SH_A15", "SH_A12", "SH_B09", "SH_A05", "SH_S04", "SH_B01", "SH_C10", "SH_A21", "SH_C03", "SH_S10", "SH_B15", "SH_B16", "SH_C07", "SH_S01", "SH_B17", "SH_C09", "SH_C01", "SH_B06", "SH_A17", "SH_A16", "SH_A24", "SH_S06", "SH_B07", "SH_S07", "SH_B13", "SH_B11", "SH_D02", "SH_B10", "SH_A06", "SH_B02", "SH_B03", "SH_C04", "SH_S02", "SH_A10", "SH_C05", "SH_E05", "SH_C13", "SH_A07", "SH_B04", "SH_A04", "SH_A26", "SH_A19", "SH_B05", "SH_C08", "SH_A22", "SH_C12", "SH_A23", "SH_A09", "SH_A08", "SH_E02", "SH_S08", "SH_B12", "SH_S09", "SH_E03", "SH_E01", "SH_H01", "SH_E04", "SH_D03"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SH_parent");
	}

	settings.Add("SL_parent", false, "Splits for Shoreline (SL)", "rooms");
	foreach (string room in new List<string>(){"SL_S02", "SL_A08", "SL_S07", "SL_C12", "SL_B02", "SL_C11", "SL_A14", "SL_E03", "SL_A02", "SL_A17", "SL_C01", "SL_A13", "SL_B01", "SL_F01", "SL_C02", "SL_C10", "SL_A10", "SL_F02", "SL_S05", "SL_D06", "SL_D04", "SL_A12", "SL_H02", "SL_H03", "SL_C09", "SL_A16", "SL_S10", "SL_I01", "SL_A15", "SL_S06", "SL_AI", "SL_C08", "SL_C05", "SL_S09", "SL_C04", "SL_D01", "SL_D02", "SL_D03", "SL_A07", "SL_A04", "SL_S03", "SL_E01", "SL_B04", "SL_C03", "SL_A11", "SL_A05", "SL_E02", "SL_S08", "SL_C07", "SL_A03", "SL_C06", "SL_S04", "SL_A06", "SL_D05", "SL_S11"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SL_parent");
	}

	settings.Add("LF_parent", false, "Splits for Farm Arrays (LF)", "rooms");
	foreach (string room in new List<string>(){"LF_S04", "LF_C05", "LF_A07", "LF_F02", "LF_A04", "LF_S02", "LF_A06", "LF_E04", "LF_A03", "LF_H01", "LF_A15", "LF_S06", "LF_A05", "LF_J01", "LF_C03", "LF_D03", "LF_E02", "LF_E03", "LF_A10", "LF_D02", "LF_D06", "LF_S01", "LF_E01", "LF_D01", "LF_B02", "LF_S07", "LF_A17", "LF_C01", "LF_B03", "LF_B05", "LF_D04", "LF_A14", "LF_S05", "LF_A11", "LF_A13", "LF_A12", "LF_B01", "LF_D07", "LF_C02", "LF_A02", "LF_H02", "LF_A01", "LF_E05", "LF_B04", "LF_D08", "LF_S03"} .OrderBy(s => s)){
		settings.Add(room, false, room, "LF_parent");
	}

	settings.Add("UW_parent", false, "Splits for The Exterior (UW)", "rooms");
	foreach (string room in new List<string>(){"UW_C08", "UW_C07", "UW_H01", "UW_A14", "UW_A12", "UW_F01", "UW_A13", "UW_S03", "UW_E01", "UW_A02", "UW_J01", "UW_A01", "UW_D01", "UW_D07", "UW_S04", "UW_C05", "UW_D06", "UW_S01", "UW_C04", "UW_D05", "UW_A04", "UW_C02", "UW_A05", "UW_C01", "UW_A03", "UW_J02", "UW_I01", "UW_S02", "UW_A10", "UW_A11", "UW_A06", "UW_E04", "UW_A08", "UW_C03", "UW_D04", "UW_B01", "UW_S07", "UW_D03", "UW_A09", "UW_S06", "UW_E03", "UW_E02", "UW_A07", "UW_C06", "UW_D02", "UW_S05"} .OrderBy(s => s)){
		settings.Add(room, false, room, "UW_parent");
	}

	settings.Add("SB_parent", false, "Splits for Subterranean (SB)", "rooms");
	foreach (string room in new List<string>(){"SB_F03", "SB_A10", "SB_A09", "SB_H03", "SB_S06", "SB_H02", "SB_A04", "SB_A13", "SB_A01", "SB_A11", "SB_B01", "SB_S07", "SB_A12", "SB_C01", "SB_B02", "SB_C05", "SB_A03", "SB_E04", "SB_C06", "SB_S03", "SB_F02", "SB_D04", "SB_S04", "SB_G03", "SB_F01", "SB_J01", "SB_E02", "SB_G02", "SB_S05", "SB_C07", "SB_J02", "SB_J03", "SB_S02", "SB_I01", "SB_S01", "SB_D06", "SB_E05", "SB_A14", "SB_D02", "SB_A02", "SB_J04", "SB_A08", "SB_B03", "SB_A07", "SB_E03", "SB_D05", "SB_A06", "SB_A05", "SB_D03", "SB_D07", "SB_D01", "SB_C08", "SB_E01", "SB_E06", "SB_C09", "SB_L01"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SB_parent");
	}

	settings.Add("SS_parent", false, "Splits for Five Pebbles (SS)", "rooms");
	foreach (string room in new List<string>(){"SS_D08", "SS_S04", "SS_E08", "SS_D07", "SS_L01", "SS_AI", "SS_E07", "SS_E06", "SS_C08", "SS_A14", "SS_LAB13", "SS_A01", "SS_D02", "SS_LAB8", "SS_LAB1", "SS_LAB2", "SS_LAB6", "SS_A17", "SS_E03", "SS_LAB7", "SS_LAB9", "SS_LAB3", "SS_LAB12", "SS_LAB11", "SS_LAB10", "SS_LAB5", "SS_LAB4", "SS_E05", "SS_I03", "SS_C07", "SS_C03", "SS_B02", "SS_S05", "SS_A16", "SS_A03", "SS_A15", "SS_E02", "SS_A04", "SS_B06", "SS_A11", "SS_D03", "SS_D04", "SS_C04", "SS_C06", "SS_H01", "SS_F02", "SS_S02", "SS_B03", "SS_E01", "SS_F01", "SS_C02", "SS_I02", "SS_A10", "SS_A09", "SS_B01", "SS_A08", "SS_A19", "SS_S01", "SS_B05", "SS_D06", "SS_A18", "SS_F03", "SS_B04", "SS_S03", "SS_A13", "SS_E04", "SS_D05"} .OrderBy(s => s)){
		settings.Add(room, false, room, "SS_parent");
	}
	
}

shutdown{}

init {
	//print("Init");
    var pattern = new SigScanTarget(0,
        "?? ?? ?? ?? 00 00 00 00 5A 27 00 00 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90 01 00 00 20 03 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 12 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 01 00 00 00 01 01 00 01 01 00 00 ?? 01 00 00 01 01 00 00 00 00 00 00 ?? 00 00 00"
    );
	int rw = 0;
	int pm = 0;
    foreach (var page in memory.MemoryPages())
	{
		var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
		var ptr = scanner.Scan(pattern);
		if (ptr != IntPtr.Zero)
		{
			rw = (int)ptr;
			print("Found RainWorld instance at " + rw.ToString("X8"));
			break;
		}
	}
	
	// RW base class and the ProcessManager are pretty much the only two objects that will survive over menuing and stuff
	// so we get a handle to those once the game loads up and we reference everything from them.
	if (rw != 0){
		pm = memory.ReadValue<int>((IntPtr)rw + 0x10);
		
		if ( pm == 0){
			print("RW Process Manager is NULL, is the game still loading ?");
			Thread.Sleep(1000);
			throw new Exception();
		}
		
		print("RW ProcessManager instance at " + pm.ToString("X8"));

	} else {
        // Waiting for the game
		print("Could not find RainWorld instance, is the game still loading ?");
        Thread.Sleep(1000);
        throw new Exception();
    }
	
	vars.rw = rw;
	vars.pm = pm;
	
	// Game processes (RainWorldGame.ProcessManager.MainLoopProcess)
	vars.processID = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0xc));
	vars.hasProcess = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x18));
	vars.hasProcess.FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;
	vars.upcomingProcessID = new MemoryWatcher<int>((IntPtr)pm + 0x3c);
	vars.hasUpcomingProcess = new MemoryWatcher<bool>((IntPtr)pm + 0x40);
	vars.processWatchers = new MemoryWatcherList() {
		vars.processID,
		vars.hasProcess,
		vars.upcomingProcessID,
		vars.hasUpcomingProcess,
		};
	
	// In the main menus, only the Character Selection stuff matters so far
	vars.startGameCondition = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0x28, 0xc));
	vars.selectedSlugcat = new MemoryWatcher<int>(new DeepPointer((IntPtr)rw + 0x18, 0x14, 0x1c, 0x10));
	vars.menuWatchers = new MemoryWatcherList() {
		vars.startGameCondition,
		vars.selectedSlugcat
		};
	
	// Game actual stuff
	vars.roomName = new StringWatcher(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x98, 0xc, 0xc), ReadStringType.UTF16, 24);
	vars.gateMode = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x88, 0x38));
	vars.shelterClosedFac = new MemoryWatcher<float>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x8c, 0x34));
	vars.wormPhase = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x9c, 0x8, 0x18, 0x30, 0x8, 0x10, 0x50, 0x1c));
	vars.theMark = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x35));
	vars.pebblesHasIncreasedRedsKarmaCap = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x38));
	vars.moonRevived = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x28, 0x18));
	vars.pebblesSeenGreenNeuron = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x28, 0x19));
	vars.moonNeuronsGiven = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x28, 0x8, 0x8, 0x20));
	//vars.extraCycles = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x68)); // pebblesHasIncreasedRedsKarmaCap is probably a better flag
	
	vars.karmaCap = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x35)); // Special fella can be updated when ghost screen loads

	vars.ingameWatchers = new MemoryWatcherList() {
		vars.roomName,
		vars.gateMode,
		vars.shelterClosedFac,
		vars.wormPhase,
		vars.theMark,
		vars.pebblesHasIncreasedRedsKarmaCap,
		vars.moonRevived,
		vars.pebblesSeenGreenNeuron,
		vars.moonNeuronsGiven,
		//vars.extraCycles,
		vars.karmaCap,
		};
	
	
	// Room visited status (so we don't count them twice)
	var roomIndexPtr = new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x98, 0x34);
	var firstRoomIndexPtr = new DeepPointer((IntPtr)pm + 0xc, 0x28, 0x10, 0x54, 0x20);
	var regionNumberPtr = new DeepPointer((IntPtr)pm + 0xc, 0x28, 0x10, 0x54, 0x24);
	Func<bool> roomVisited = () =>
    {
        int roomIndex = roomIndexPtr.Deref<int>(game);
		int firstRoomIndex = firstRoomIndexPtr.Deref<int>(game);
		int regionNumber = regionNumberPtr.Deref<int>(game);
        return new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x10, 0x10 + regionNumber*4, 0x34, 0x10 + roomIndex - firstRoomIndex).Deref<bool>(game);
    };
	vars.roomVisited = roomVisited;
	
	// Cycle Start
	vars.malnourished = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x3c));
	vars.cycleStartWatchers = new MemoryWatcherList() {
		vars.malnourished,
	};
	
	// Cycle End
	vars.karma = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x2c));
	vars.karmaCap = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x30));
	vars.ascended = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x37));
	vars.sawAGhost = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x80));
	vars.cycleEndWatchers = new MemoryWatcherList() {
		vars.karma,

		vars.ascended,
		vars.sawAGhost, // set here and used in the upcoming process 
		vars.malnourished, // appears here too
	};
	
	// Trackers aka Passages aka Achievements
	// Updated at end of cycle when game process is about to switch out
	var trackersSizePtr = new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x14, 0x8, 0xc);
	var trackersArrayPtr = new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x14, 0x8, 0x8);
	vars.oldTrackers = new bool[10];
	vars.currentTrackers = new bool[10];
	vars.trackersChanged = new bool[10];
	vars.trackersChangedAny = false;
	Action updateTrackerStatus = () =>
    {
		vars.oldTrackers = vars.currentTrackers;
		vars.currentTrackers = new bool[10];
		int trackersSize = trackersSizePtr.Deref<int>(game);
		IntPtr trackersArrayBase = (IntPtr) trackersArrayPtr.Deref<int>(game) + 0x10;
		for(int i = 0; i < trackersSize; i++){
			int trackerID = new DeepPointer(trackersArrayBase + 4*i, 0x8).Deref<int>(game);
			if(trackerID > 0x9){continue;}
			switch(trackerID){
			case 0x0: // Survivor
				int value = new DeepPointer(trackersArrayBase + 4*i, 0x20).Deref<int>(game);
				vars.currentTrackers[trackerID] = new DeepPointer(trackersArrayBase + 4*i, 0x20).Deref<int>(game) >= 5;
				break;
			case 0x6: // Outlaw
				vars.currentTrackers[trackerID] = new DeepPointer(trackersArrayBase + 4*i, 0x20).Deref<int>(game) >= 7;
				break;
			case 0x1: // Hunter
			case 0x2: // Saint
			case 0x5: // Monk
				vars.currentTrackers[trackerID] = new DeepPointer(trackersArrayBase + 4*i, 0x20).Deref<int>(game) >= 12;
				break;
			case 0x4: // Chieftain
			case 0x9: // Friend
				vars.currentTrackers[trackerID] = new DeepPointer(trackersArrayBase + 4*i, 0x20).Deref<float>(game) >= 1f;
				break;
			case 0x3: // Traveler aka Wanderer
				vars.currentTrackers[trackerID] = true;
				for(int j = 0 ; j < 12; j++){
					if(new DeepPointer(trackersArrayBase + 4*i, 0x10, 0x10 + j).Deref<bool>(game) == false){
						vars.currentTrackers[trackerID] = false;
					}
				}
				break;
			case 0x7: // DragonSlayer
				vars.currentTrackers[trackerID] = true;
				for(int j = 0 ; j < 6; j++){
					if(new DeepPointer(trackersArrayBase + 4*i, 0x10, 0x10 + j).Deref<bool>(game) == false){
						vars.currentTrackers[trackerID] = false;
					}
				}
				break;
			case 0x8: // Scholar
				vars.currentTrackers[trackerID] = new DeepPointer(trackersArrayBase + 4*i, 0x10, 0xc).Deref<int>(game) >= 3;
				break;
			}
		}
		vars.trackersChangedAny = false;
		for(int i = 0; i < 10; i++){
			vars.trackersChanged[i] = false;
			if(vars.currentTrackers[i] && !vars.oldTrackers[i]){
				vars.trackersChanged[i] = true;
				vars.trackersChangedAny = true;
			}
		}
	};
	vars.updateTrackerStatus = updateTrackerStatus;
	
}

exit {
	// print("Exit");
}


update {
	vars.processWatchers.UpdateAll(game);
	
	if(vars.hasProcess.Current && vars.processID.Current == 18){
		vars.menuWatchers.UpdateAll(game);
	}
	
	// Switching in, cycle start
	if(vars.hasProcess.Current && vars.processID.Changed && vars.processID.Current == 1){
		// print("Cycle Start");
		vars.cycleStartWatchers.UpdateAll(game);
	}
	
	if(vars.hasProcess.Current && vars.processID.Current == 1){
		vars.ingameWatchers.UpdateAll(game);
		
		// Game switching out, cycle end
		if(vars.hasUpcomingProcess.Changed && vars.hasUpcomingProcess.Current){
			// print("Cycle End");
			vars.cycleEndWatchers.UpdateAll(game);
			vars.updateTrackerStatus();
		}
		
	}
	
	if(vars.hasUpcomingProcess.Changed && !vars.hasUpcomingProcess.Current && vars.hasProcess.Current && (vars.processID.Current == 8 || vars.processID.Current == 9)){ // Triggers after inter-process comms into the Ghost encounter screen
		vars.karmaCap.Update(game); // This guy can also change here
	}
	
	
}

start {
	// Is in CharacterSelect and NOW has upcoming process && is game && start new game && right slugcat
	if(vars.processID.Current == 18 && vars.hasUpcomingProcess.Changed && vars.hasUpcomingProcess.Current && vars.upcomingProcessID.Current == 1 && vars.startGameCondition.Current == 1 && (settings["start_any"] ||  (settings.ContainsKey("start_"+vars.selectedSlugcat.Current) && settings["start_"+vars.selectedSlugcat.Current]))){
		vars.cycleStartWatchers.ResetAll();
		vars.ingameWatchers.ResetAll();
		vars.cycleEndWatchers.ResetAll();
		return true;
	}
}

isLoading {}
gameTime {}
reset {}

split {
	// ROOM TRIGGERS
	if(vars.roomName.Changed && (settings["rooms_all"] || (settings.ContainsKey(vars.roomName.Current) && settings[vars.roomName.Current])) && (!settings["rooms_once"] || !vars.roomVisited())){
		return true;
	}
	
	// GATE TRIGGERS
	if(vars.gateMode.Changed && settings.ContainsKey("gate_"+vars.gateMode.Current) && settings["gate_"+vars.gateMode.Current]){
		return true;
	}
	
	// KARMA CACHE TRIGGERS
	if(vars.malnourished.Changed && vars.malnourished.Current == false && vars.shelterClosedFac.Changed && vars.shelterClosedFac.Current == 0f && settings.ContainsKey("kc_"+vars.karma.Current) && settings["kc_"+vars.karma.Current]){
		vars.malnourished.Update(game); // So it loses the "changed" status, resetting doesnt work
		return true;
	}
	
	// VOID SEA TRIGGERS
	if(vars.wormPhase.Changed && settings.ContainsKey("worm_"+vars.wormPhase.Current) && settings["worm_"+vars.wormPhase.Current]){
		return true;
	}
	
	// PASSAGE TRIGGERS
	if(vars.trackersChangedAny){
		for(int i = 0; i<10; i++){
			if(vars.trackersChanged[i] && settings.ContainsKey("ach_"+i) && settings["ach_"+i]){
				vars.trackersChanged[i] = false;
				return true;
			}
			if(i==9){
				vars.trackersChangedAny = false;
			}
		}
	}
	
	// GHOST TRIGGER
	if(vars.sawAGhost.Changed && settings.ContainsKey("ech_"+vars.sawAGhost.Current) && settings["ech_"+vars.sawAGhost.Current]){
		vars.sawAGhost.Update(game);
		return true;
	}
	
	// TEN KARMA TRIGGER
	if(vars.karmaCap.Changed && vars.karmaCap.Current == 9){
		vars.karma.Update(game);
		return settings["tenKarma"];
	}	
	// THE MARK TRIGGER
	if(vars.theMark.Changed && vars.theMark.Current == true){
		vars.theMark.Update(game);
		return settings["theMark"];
	}	
	// GIVE NEURON TO MOON TRIGGER
	if(vars.moonNeuronsGiven.Changed && vars.moonNeuronsGiven.Current == 1){
		vars.moonNeuronsGiven.Update(game);
		return settings["moonNeuron"];
	}	
	// REVIVE MOON TRIGGER
	if(vars.moonRevived.Changed && vars.moonRevived.Current == true){
		vars.moonRevived.Update(game);
		return settings["moonRevived"];
	}
	// PEBBLES SEEN GREEN NEURON TRIGGER
	if(vars.pebblesSeenGreenNeuron.Changed && vars.pebblesSeenGreenNeuron.Current == true){
		vars.pebblesSeenGreenNeuron.Update(game);
		return settings["pebblesSeenGreenNeuron"];
	}
	// PEBBLES HAS INCREASED REDS KARMA CAP TRIGGER
	if(vars.pebblesHasIncreasedRedsKarmaCap.Changed && vars.pebblesHasIncreasedRedsKarmaCap.Current == true){
		vars.pebblesHasIncreasedRedsKarmaCap.Update(game);
		return settings["pebblesHasIncreasedRedsKarmaCap"];
	}
	// ASCENDED TRIGGER
	if(vars.ascended.Changed && vars.ascended.Current == true){
		vars.ascended.Update(game);
		return settings["ascended"];
	}

}

