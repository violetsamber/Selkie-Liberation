private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_supporttomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_support_to_skip = [
    KP_liberation_recycle_building,
    KP_liberation_air_vehicle_building,
    KP_liberation_spartan_building,
    KP_liberation_ODST_building,
    "B_Slingload_01_Repair_F",
    "B_Slingload_01_Fuel_F",
    "B_Slingload_01_Ammo_F"
];

{
    _vehtomark append _x;
} forEach [KPLIB_b_light_classes, KPLIB_b_heavy_classes, KPLIB_b_air_classes, KPLIB_b_support_classes];

_vehtomark = _vehtomark - _support_to_skip;

while { true } do {

    _markedveh = [];
    {
        if (alive _x && (toLower (typeOf _x)) in _vehtomark && (count (crew _x)) == 0 && (_x distance2D startbase) > 500) then {
            _markedveh pushBack _x;
        };
    } forEach vehicles;

    if ( count _markedveh != count _vehmarkers ) then {
        { deleteMarkerLocal _x; } forEach _vehmarkers;
        _vehmarkers = [];

        {
            _marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
            _marker setMarkerColorLocal "ColorKhaki";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerSizeLocal [ 0.75, 0.75 ];
            _vehmarkers pushBack _marker;
        } forEach _markedveh;
    };

    {
        _marker = _vehmarkers select (_markedveh find _x);
        _marker setMarkerPosLocal getPos _x;
        _marker setmarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

    } forEach _markedveh;

    sleep 5;
};
