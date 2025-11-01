
params [
    ["_spawnMarker", "", ["",[]]],
    ["_targetsector", "", ["",[]]],
	["_teamCount", 1, [1]]
];

if (_targetsector isEqualTo "") exitWith {false};

private _targetPos = _targetsector;
if (_targetPos isEqualType "") then {
    _targetPos = markerPos _targetsector;
};

private _units = [
	"Selkie_UNSC_ODST_TeamLeader", 
	"Selkie_UNSC_ODST_Autoriflemaid", 
	"Selkie_UNSC_ODST_Breacher", 
	"Selkie_UNSC_ODST_Grenadier", 
	"Selkie_UNSC_ODST_Corpsmaid", 
	"Selkie_UNSC_ODST_MissileSpecialist", 
	"Selkie_UNSC_ODST_Riflemaid_BR55", 
	"Selkie_UNSC_ODST_Riflemaid_MA5"
];

private _team = configFile >> "CfgGroups" >> "Indep" >> "Selkie_UNSC_Marines_ODST" >> "Infantry" >> "UNSC_ODST_AssaultSquad";
private _units = [];

for "_i" from 1 to _teamCount do 
{
	private _group = [markerPos _spawnMarker, GRLIB_side_enemy, (_team)] call BIS_fnc_spawnGroup;
	[_group, 500, 15] spawn lambs_wp_fnc_taskRush;
	_units append units _group;
};

private _ship = [_targetPos vectorAdd [0,100,0], 180, 2500, "OPTRE_Frigate_UNSC", GRLIB_side_enemy] call SciFiSupportPLUS_fnc_JumpShipIn;

sleep 5;

[ 
	_targetPos, 
	_units, 
	"Frigate", 
	15, 
	3, 
	-1,
	2500, 
	1500, 
	1000, 
	400, 
	300, 
	true, 
	true, 
	600, 
	true 
] call OPTRE_fnc_HEV;


sleep 45;

[_ship] call ScifiSupportPLUS_fnc_JumpOut;
