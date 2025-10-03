// ODST Support script
    _odstMarker = createMarkerLocal["odstMark",[0,0,0]];
    _nearestEnemy = player findNearestEnemy [0,0,0];
    _nearestEnemyPos = [];
    player addEventHandler ["Fired", {
        if ((_this select 4) isEqualTo "OPTRE_G_ELB47_Strobe") then
            {
            _nearestFob = [] call KPLIB_fnc_getNearestFob;
            _has_ODST = [_nearestFob] call KPLIB_fnc_getFobResources select 6;
                if(_has_ODST) then {
                if ((unitcap+8) <= ([] call KPLIB_fnc_getLocalCap)) then {
                _grenadeObj = (_this select 6);
                _moveMarker = [_grenadeObj] spawn
                    {
                        private ["_grenadePos","_grenadeObj"];
                        _grenadeObj = (_this select 0);
                        waitUntil { (getPosATL _grenadeObj select 2) < 0.1 };
                        _grenadePos = getPosATL _grenadeObj;
                        _nearestEnemy = player findNearestEnemy _grenadePos;
                        _nearestEnemyPos = getPosATL _nearestEnemy;
                        "odstMark" setMarkerPosLocal _nearestEnemyPos;
			            [["OPTRE_UNSC_ODST_Soldier_TeamLeader","OPTRE_UNSC_ODST_Soldier_Scout","OPTRE_UNSC_ODST_Soldier_Rifleman_BR","OPTRE_UNSC_ODST_Soldier_Rifleman_AT","OPTRE_UNSC_ODST_Soldier_Paramedic","OPTRE_UNSC_ODST_Soldier_Automatic_Rifleman","OPTRE_UNSC_ODST_Soldier_Scout_Sniper","OPTRE_UNSC_ODST_Soldier_Rifleman_BR"],_grenadePos,["odstMark"],"patrol",WEST] remoteExec ["OPTRE_fnc_CS_ODSTHEV",2];
                        hint "ODST drop inbound!\nHelp is on the way."
                    };
                } else {hint "ODST drop not approved.\nFriendly force strength would exceed capacity."};
              } else {hint "Please build an ODST Uplink at the FOB closest to the area of operations."}; 
            };
        }
    ];