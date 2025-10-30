private _sourcestr = "Server";
private _position = 0;

if (!isServer) then {
    if (!isNil "hc1") then {
        if (!isNull hc1) then {
            if (local hc1) then {
                _sourcestr = "hc1";
                _position = 1;
            };
        };
    };

    if (!isNil "hc2") then {
        if (!isNull hc2) then {
            if (local hc2) then {
                _sourcestr = "hc2";
                _position = 2;
            };
        };
    };

    if (!isNil "hc3") then {
        if (!isNull hc3) then {
            if (local hc3) then {
                _sourcestr = "hc3";
                _position = 3;
            };
        };
    };
};

private _myfpsmarker = createMarker [format ["fpsmarker%1", _sourcestr], [0, -500 - (500 * _position)]];
_myfpsmarker setMarkerTypeLocal "mil_start";
_myfpsmarker setMarkerSize [0.7, 0.7];

while {true} do {

    private _myfps = diag_fps;
    private _localgroups = {local _x} count allGroups;
    private _localunits = {local _x} count allUnits;

    _myfpsmarker setMarkerColorLocal "ColorGREEN";
    if (_myfps < 30) then {_myfpsmarker setMarkerColorLocal "ColorYELLOW";};
    if (_myfps < 20) then {_myfpsmarker setMarkerColorLocal "ColorORANGE";};
    if (_myfps < 10) then {_myfpsmarker setMarkerColorLocal GRLIB_color_enemy_bright;};

    _myfpsmarker setMarkerText format ["%1: %2 fps, %3 local groups, %4 local units", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits];

    sleep 15;
};
