/*
    File: fn_getCivCount.sqf
    Authors: 
    Date: 2025-11-15
    Last Update: 2025-11-15
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"

params [
    ["_sectorType", "", [""]]
];

private _amount = round ((3 + (floor (random 7))) * GRLIB_civilian_activity);
if (_sectorType == SECTOR_TYPE_BIGTOWN) then {
    _amount = _amount + 10;
};
_amount = _amount * (sqrt (GRLIB_unitcap));

_amount
