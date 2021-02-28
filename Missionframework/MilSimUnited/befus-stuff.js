params [["_resource", KP_liberation_supply_crate],["_amount", 100],["_pos", getPos player]];

private _crate = _resource createVehicle getPos player; 
_crate setMass 500; 
_crate setVariable ["KP_liberation_crate_value", 100, true]; 
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearItemCargoGlobal _crate;


addMissionEventHandler ["MapSingleClick", { 
    params ["", "_pos", "", ""]; 
    _marker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition; 
    if (_marker in sectors_allSectors) then { 
        if (_marker in blufor_sectors) then { 
            blufor_sectors = blufor_sectors - [_marker]; 
        } else { 
            blufor_sectors = blufor_sectors + [_marker]; 
        }; 
        publicVariable "blufor_sectors"; 
    }; 
    removeMissionEventHandler ["MapSingleClick", _thisEventHandler]; 
    openMap [false, false]; 
}]; 
openMap [true, true];