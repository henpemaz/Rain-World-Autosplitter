state("RainWorld", "steam15") {}

startup {
	print("Startup");
	
	// If only people had invented something like Enums in C#...
	var ProcessIDValue = new Dictionary<string,int>(){{"NULL", -1},{"MainMenu", 0},{"Game", 1},{"SleepScreen", 2},{"DeathScreen", 3},{"StarveScreen", 4},{"RegionSelect", 5},{"OptionsMenu", 6},{"MusicPlayer", 7},{"GhostScreen", 8},{"KarmaToMaxScreen", 9},{"SlideShow", 10},{"MenuMic", 11},{"PauseMenu", 12},{"FastTravelScreen", 13},{"RegionsOverviewScreen", 14},{"CustomEndGameScreen", 15},{"InputSelect", 16},{"TutorialControlsPage", 17},{"SlugcatSelect", 18},{"IntroRoll", 19},{"Credits", 20},{"ConsoleOptionsMenu", 21},{"Dream", 22},{"RainWorldSteamManager", 23},{"MultiplayerMenu", 24},{"MultiplayerResults", 25},{"InputOptions", 26},{"Statistics", 27}};

	var ProcessIDName = new Dictionary<int,string>(){
		{-1, "NULL"},
		{0, "MainMenu"},
		{1, "Game"},
		{2, "SleepScreen"},
		{3, "DeathScreen"},
		{4, "StarveScreen"},
		{5, "RegionSelect"},
		{6, "OptionsMenu"},
		{7, "MusicPlayer"},
		{8, "GhostScreen"},
		{9, "KarmaToMaxScreen"},
		{10, "SlideShow"},
		{11, "MenuMic"},
		{12, "PauseMenu"},
		{13, "FastTravelScreen"},
		{14, "RegionsOverviewScreen"},
		{15, "CustomEndGameScreen"},
		{16, "InputSelect"},
		{17, "TutorialControlsPage"},
		{18, "SlugcatSelect"},
		{19, "IntroRoll"},
		{20, "Credits"},
		{21, "ConsoleOptionsMenu"},
		{22, "Dream"},
		{23, "RainWorldSteamManager"},
		{24, "MultiplayerMenu"},
		{25, "MultiplayerResults"},
		{26, "InputOptions"},
		{27, "Statistics"}};
		
	vars.ProcessIDValue = ProcessIDValue;
	vars.ProcessIDName = ProcessIDName;
	
	// Splits are optional, so people don't complain too much about it
	 settings.Add("SU_A22", true, "Split after the Tutorial");
	 settings.SetToolTip("SU_A22", "Splits when entering SU_A22");
	 
	 settings.Add("SU_S03", true, "Split on entering Shelter in Outskirts");
	 settings.SetToolTip("SU_S03", "Splits when entering SU_S03");
	 
	 settings.Add("4karma", true, "Split with 4 Karma");
	 settings.SetToolTip("4karma", "Splits when SU_S03 shelter door opens and you have 4 Karma");
	 
	 settings.Add("GATE_SU_DS", true, "Split on gate to Drainage");
	 settings.SetToolTip("GATE_SU_DS", "Splits when gate in GATE_SU_DS closes airlock");
	 
	 settings.Add("GATE_DS_SB", true, "Split on gate to Subterranean");
	 settings.SetToolTip("GATE_DS_SB", "Splits when gate in GATE_DS_SB closes airlock");
	 
	 settings.Add("SB_E05", true, "Split when getting to Depths");
	 settings.SetToolTip("SB_E05", "Splits when entering SB_E05");
	 
	 settings.Add("SB_D07", true, "Split after the Guardians");
	 settings.SetToolTip("SB_D07", "Splits when entering SB_D07");
	 
	 settings.Add("SB_L01", true, "Split when getting to the Void Sea room");
	 settings.SetToolTip("SB_L01", "Splits when entering SB_L01");
	 
	 settings.Add("wormstring", true, "Split when worm strings you");
	 settings.SetToolTip("wormstring", "Splits when the Worm in the Void Sea hooks you up");
	 
	 settings.Add("ascended", true, "Split when the game ends");
	 settings.SetToolTip("ascended", "Splits when you have ascended and the game exits");
}

shutdown{}

init {
	print("Init");
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
	
	if (rw != 0){
		pm = memory.ReadValue<int>((IntPtr)rw + 0x10);
		
		if ( pm == 0){
			print("RW Process Manager is NULL");
			Thread.Sleep(1000);
			throw new Exception();
		}
		
		print("RW ProcessManager instance at " + pm.ToString("X8"));

	} else {
        // Waiting for the game
		print("Could not find RainWorld instance");
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
	// I'm considering breaking down gateWatchers and shelterWatchers but it might just not be worth it. Same with voidSeaWatcher lol
	vars.roomName = new StringWatcher(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x98, 0xc, 0xc), ReadStringType.UTF16, 12);
	vars.roomNameGate = new StringWatcher(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x98, 0xc, 0xc), ReadStringType.UTF16, 20);
	vars.roomNameLength = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x98, 0xc, 0x8));
	vars.gateMode = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x88, 0x38));
	// This guy gets initialized to false when the game loads the shelter and takes a couple frames to update to the actual state
	vars.shelterClosed = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x8c, 0x54));
	// This one is better but its a float
	vars.shelterClosedFac = new MemoryWatcher<float>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x8c, 0x34));
	vars.wormPhase = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x54, 0x10, 0x104, 0x9c, 0x8, 0x18, 0x30, 0x8, 0x10, 0x50, 0x1c));
	vars.ingameWatchers = new MemoryWatcherList() {
		vars.roomName,
		vars.roomNameGate,
		vars.roomNameLength,
		vars.gateMode,
		vars.shelterClosed,
		vars.shelterClosedFac,
		vars.wormPhase,
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
	
	// End of Cycle stuff
	vars.karma = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x2c));
	vars.karmaCap = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x30));
	vars.theMark = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x35));
	vars.pebblesHasIncreasedRedsKarmaCap = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x38));
	vars.ascended = new MemoryWatcher<bool>(new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x37));
	vars.sawAGhost = new MemoryWatcher<int>(new DeepPointer((IntPtr)pm + 0xc, 0x80));
	vars.cycleWatchers = new MemoryWatcherList() {
		vars.karma,
		vars.karmaCap,
		vars.theMark,
		vars.pebblesHasIncreasedRedsKarmaCap,
		vars.ascended,
		vars.sawAGhost,
	};
	
	// Trackers aka Passages aka Achievements
	var trackersSizePtr = new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x14, 0x8, 0xc);
	var trackersArrayPtr = new DeepPointer((IntPtr)pm + 0xc, 0x40, 0x1c, 0x2c, 0x14, 0x8, 0x8);
	vars.oldTrackers = new bool[10];
	vars.currentTrackers = new bool[10];
	vars.trackersChanged = false;
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
		vars.trackersChanged = false;
		for(int i = 0; i < 12; i++){
			if(vars.currentTrackers[i] && !vars.oldTrackers[i]){
				vars.trackersChanged = true;
				break;
			}
		}
	};
	vars.updateTrackerStatus = updateTrackerStatus;
	
}

exit {
	print("Exit");
}


update {
	vars.processWatchers.UpdateAll(game);
	
	if(vars.hasProcess.Current && vars.processID.Current == 18){
		vars.menuWatchers.UpdateAll(game);
	}
	
	if(vars.hasProcess.Current && vars.processID.Current == 1){
		vars.ingameWatchers.UpdateAll(game);
		
		if(vars.hasUpcomingProcess.Changed && vars.hasUpcomingProcess.Current){
			vars.cycleWatchers.UpdateAll();
			vars.updateTrackerStatus();
		}
		
	}
	
	
	// Debug
	
	if(vars.hasProcess.Changed && vars.hasProcess.Current){
		print("Switched to screen " + vars.ProcessIDName[vars.processID.Current] + " " + vars.processID.Current);
	}		
	if(vars.hasUpcomingProcess.Changed && vars.hasUpcomingProcess.Current){
		print("Switcing to screen " + vars.ProcessIDName[vars.upcomingProcessID.Current] + " " + vars.upcomingProcessID.Current);
		
		if(vars.processID.Current == 1){
			var ts = vars.trackerStatus();
			print("Passages are " + string.Join(",", ts));
		}
	}
	if(vars.selectedSlugcat.Changed){
		print("Selected Slugcat is " + vars.selectedSlugcat.Current);
	}
	if(vars.roomName.Changed){
		print("Room name is " + vars.roomName.Current);
		print("visited = " + vars.roomVisited());
	}
	if(vars.karma.Changed){
		print("Karma is " + vars.karma.Current);
	}
	if(vars.ascended.Changed){
		print("Ascended is " + vars.ascended.Current);
	}
	if(vars.wormPhase.Changed){
		print("Worm phase is " + vars.wormPhase.Current);
	}
	if(vars.gateMode.Changed){
		print("Gate Mode is " + vars.gateMode.Current);
	}
	if(vars.shelterClosedFac.Changed && (vars.shelterClosedFac.Current == 1f || vars.shelterClosedFac.Current == 0f)  ){
		print("Shelter Closed is " + vars.shelterClosedFac.Current);
	}
	
	
}

start {
	// Is in CharacterSelect and NOW has upcoming process && is game && start new game && right slugcat
	return vars.processID.Current == 18 && vars.hasUpcomingProcess.Changed && vars.hasUpcomingProcess.Current && vars.upcomingProcessID.Current == 1 && vars.startGameCondition.Current == 1 && vars.selectedSlugcat.Current == 0;
}

isLoading {}
gameTime {}
reset {}

split {
	// ROOM TRIGGERS
	if(vars.roomName.Changed && settings.ContainsKey(vars.roomName.Current) && !vars.roomVisited()){
		return settings[vars.roomName.Current];
	}
	
	// GATE TRIGGERS
	if(vars.gateMode.Changed && vars.gateMode.Current == 2 && vars.roomNameLength.Current == 10 && settings.ContainsKey(vars.roomNameGate.Current)){
		return settings[vars.roomNameGate.Current];
	}
	
	// KARMA CACHE TRIGGER
	if(vars.shelterClosed.Changed && vars.shelterClosedFac.Current == 0f && vars.roomName.Current == "SU_S03" && vars.karma.Current == 3){ // Karma is 0-indexed so 3 is "4"
		return settings["4karma"];
	}
	
	// WORM TRIGGER
	if(vars.wormPhase.Changed && vars.wormPhase.Current == 4 && vars.roomName.Current == "SB_L01"){
		return settings["wormstring"];
	}
	
	// ASCENDED TRIGGER
	if(vars.ascended.Changed && vars.ascended.Current == true){
		return settings["ascended"];
	}

}

