/*
    File: fn_potatoScan.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current Potato 01, if alive.

    Parameter(s):
        NONE

    Returns:
        Potato 01 [OBJECT]
*/

private _potatoes = vehicles select {typeOf _x == huron_typeName && alive _x};
if (_potatoes isNotEqualTo []) then {
    _potatoes select 0
} else {
    objNull
};
