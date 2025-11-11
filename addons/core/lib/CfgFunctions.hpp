class COMMON_FUNCTIONS_NAMESPACE {
    class functions {
        file = "lib\functions";

        class addActionsFob             {};
        class addActionsPlayer          {};
        class addObjectInit             {};
        class addRopeAttachEh           {};
        class addCombatReadiness        {};
        class allowCrewInImmobile       {};
        class checkClass                {};
        class checkCrateValue           {};
        class checkGear                 {};
        class checkWeaponCargo          {};
        class cleanOpforVehicle         {};
        class clearCargo                {};
        class clearGrpWaypoints         {};
        class crAddAceAction            {};
        class crateFromStorage          {};
        class crateToStorage            {};
        class crawlAllItems             {};
        class createClearance           {};
        class createClearanceConfirm    {};
        class createCrate               {};
        class createManagedUnit         {};
        class crGetMulti                {};
        class crGlobalMsg               {};
        class doSave                    {};
        class fillStorage               {};
        class forceBluforCrew           {};
        class getAdaptiveVehicle        {};
        class getBluforRatio            {};
        class getCommander              {};
        class getCrateHeight            {};
        class getFobName                {};
        class getFobResources           {};
        class getGroupType              {};
        class getLessLoadedHC           {};
        class getLoadout                {};
        class getLocalCap               {};
        class getLocationName           {};
        class getMilitaryId             {};
        class getMobileRespawns         {};
        class getNearbyPlayers          {};
        class getNearestBluforObjective {};
        class getNearestBluforMarker    {};
        class getNearestFob             {};
        class getNearestSector          {};
        class getNearestTower           {};
        class getNearestViVTransport    {};
        class getOpforCap               {};
        class getOpforFactor            {};
        class getOpforSpawnPoint        {};
        class getPlayerCount            {};
        class getResistanceTier         {};
        class getSaveableParam          {};
        class getSaveData               {};
        class getSectorOwnership        {};
        class getSectorRange            {};
        class getSquadComp              {};
        class getSquadCompTransport     {};
        class getStoragePositions       {};
        class getUnitPositionId         {};
        class getUnitsCount             {};
        class getWeaponComponents       {};
        class getRandomPointInCircle    {};
        class getTimeSinceLastBattlegroup {};
        class getSectorValue            {};
        class handlePlacedZeusObject    {};
        class hasPermission             {};
        class initSectors               {};
        class isBigtownActive           {};
        class isClassUAV                {};
        class isRadio                   {};
        class log                       {};
        class pickRandomClasses         {};
        class lambs_enableReinforcements{};
        class potatoScan                {};
        class protectObject             {};
        class secondsToTimer            {};
        class setDiscordState           {};
        class setFobMass                {};
        class setLoadableViV            {};
        class setLoadout                {};
        class setVehicleCaptured        {};
        class setCombatReadiness        {};
        class setVehicleSeized          {};
        class sortStorage               {};
        class spawnBuildingSquad        {};
        class spawnBuildingSquadModified{};
        class spawnCivilians            {};
        class spawnGuerillaGroup        {};
        class spawnMilitaryPostSquad    {};
        class spawnMilitiaCrew          {};
        class spawnRegularSquad         {};
        class spawnVehicle              {};
        class swapInventory             {};
        class deleteGroup               {};
    };
    class functions_curator {
        file = "lib\functions\curator";

        class initCuratorHandlers       {
            postInit = 1;
        };
        class requestZeus               {};
    };
    class functions_ui {
        file = "lib\functions\ui";

        class overlayUpdateResources    {};
    };

};

class COMMON_FUNCTIONS_NAMESPACE_INIT {
    class functions {
        file = "lib\functions\init";
        class liberation_config    {};
        class objectInits          {};
        class fetch_params         {};
        class presets              {};
        class variables            {};
    };
};
