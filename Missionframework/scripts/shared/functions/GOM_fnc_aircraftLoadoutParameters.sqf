//GOM_fnc_aircraftLoadout V1.34 made by Grumpy Old Man 17-5-2017

GOM_fnc_aircraftLoadout_NeedsFuelSource = false;
//(default: true) needs fuel supply within 50m of the aircraft or functions will be unavailable

GOM_fnc_aircraftLoadout_NeedsAmmoSource = false;
//(default: true) needs ammo supply within 50m of the aircraft or functions will be unavailable

GOM_fnc_aircraftLoadout_NeedsRepairSource = false;
//(default: true) needs repair supply within 50m of the aircraft or functions will be unavailable

GOM_fnc_allowAllPylons = false;
//(default: false) removes check that only allows compatible pylons to be mounted

GOM_fnc_aircraftLoadoutRepairTime = 60;
//(default: 60) time it takes to repair a vehicle from 0 to 100% health. Going from 50% to 100% will take half the time

GOM_fnc_aircraftLoadoutRefuelRate = 1800;
//(default: 1800) rate in liters per minute a vehicle will be refuelled at. Going from 0 to 100% fuel will take 60 seconds if the vehicle holds 1800l max fuel. wipeout has 1000l max fuel as a measurement

GOM_fnc_removeFuelFromMapObjects = false;
//(default: true) will remove all fuel cargo from map objects like gas stations so players can't land on the roof of a gas station for a maintenance free refill, might affect other parts of your mission so choose carefully
true
