params [
    ["_group", objNull]
];

if (isNull _group) exitWith {};

private _vehicles = [];
private _units = units _group;

{
    private _vehicle = objectParent _x;
    if (!isNull _vehicle) then {
        _vehicles pushBack _vehicle;
    };
    deleteVehicle _x;
} forEach _units;

{
    deleteVehicleCrew _x;
    deleteVehicle _x;
} forEach _vehicles;