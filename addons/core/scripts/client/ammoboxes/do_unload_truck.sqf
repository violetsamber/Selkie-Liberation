params [ "_truck_to_unload"];
private [ "_next_box", "_next_pos", "_offset" ];

_offset = 0;

{
    if ( _x select 0 == typeOf _truck_to_unload ) then { _offset = _x select 1; };
} forEach KPLIB_transportConfigs;

if ( _truck_to_unload getVariable ["GRLIB_ammo_truck_load", 0] > 0 ) then {
    _truck_to_unload setVariable ["GRLIB_ammo_truck_load", 0, true];
    [_truck_to_unload, false] remoteExec ["KPLIB_fnc_protectObject"];

    {
        _next_box = _x;
        [_next_box, false] remoteExec ["KPLIB_fnc_protectObject"];
        sleep 0.5;
        detach _next_box;
        _next_box setPos (_truck_to_unload getPos [_offset, getDir _truck_to_unload]);
        _next_box setDir (getDir _truck_to_unload);
        _next_box setVelocity [0,0,0];
        _next_box setDamage 0;
        _offset = _offset - 2.2;
        sleep 0.5;
        [_next_box] remoteExec ["KPLIB_fnc_protectObject"];
        [_next_box, true] remoteExec ["enableRopeAttach"];
    } forEach ( attachedObjects _truck_to_unload);

    sleep 0.5;

    [_truck_to_unload] remoteExec ["KPLIB_fnc_protectObject"];

    hint localize "STR_BOX_UNLOADED";
    uiSleep 2;
    hint "";
};
