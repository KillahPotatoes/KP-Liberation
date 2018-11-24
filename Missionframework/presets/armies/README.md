# KP Liberation Army Presets Cheat Sheet

## Description
The army preset files are chosen for either friendly (player) or enemy side in Liberation.
Each preset can be used for both sides out of the box.
It handles the creation of all needed variables and arrays.
This way friendly and enemy classnames etc. can be retrieved by just placing an `F` or `E` at the end of the variable/array.

Example:
```
// Friendly Special Forces Array
KPLIB_preset_specOpsF

// Enemy Special Forces Array
KPLIB_preset_specOpsE
```

## Created Variables and Arrays
Each listed variable/array needs the `F` or `E` suffix to access the corresponding friendly or enemy values.

### Variables

* **KPLIB_preset_addBoat**

  *Boats which spawn in the boat racks of the Liberty.*

* **KPLIB_preset_addHeli**

  *Additional helicopter which spawns at the Operation Base.*

* **KPLIB_preset_airBuilding**

  *The building defined to unlock FOB air vehicle availability.*

* **KPLIB_preset_arsenalBox**

  *This is the virtual arsenal as portable supply crate.*

* **KPLIB_preset_color**

  *Color for this side.*

* **KPLIB_preset_colorAct**

  *Color for this side. (active)*

* **KPLIB_preset_crateAmmo**

  *Ammunition resource crate.*

* **KPLIB_preset_crateFuel**

  *Fuel resource crate.*

* **KPLIB_preset_crateSupply**

  *Supply resource crate.*

* **KPLIB_preset_fobBox**

  *FOB Container to create a new FOB.*

* **KPLIB_preset_fobBuilding**

  *FOB HQ Building.*

* **KPLIB_preset_fobTruck**

  *FOB Truck to create a new FOB.*

* **KPLIB_preset_logiBuilding**

  *The building defined to unlock FOB logistic functionalities.*

* **KPLIB_preset_logiTruck**

  *Trucks which are used in the logistic convoy system.*

* **KPLIB_preset_mortar**

  *Static Mortar Classname.*

* **KPLIB_preset_potato**

  *Potato 01, a multipurpose mobile respawn helicopter.*

* **KPLIB_preset_respawnTruck**

  *Mobile respawn (and medical) truck.*

* **KPLIB_preset_rsAntiAir**

  *AA Specialist.*

* **KPLIB_preset_rsAntiTank**

  *AT Specialist.*

* **KPLIB_preset_rsAutorifleMan**

  *Autorifleman.*

* **KPLIB_preset_rsCrewmanHeli**

  *Helicopter crew.*

* **KPLIB_preset_rsCrewmanVeh**

  *Vehicle crew.*

* **KPLIB_preset_rsEngineer**

  *Engineer.*

* **KPLIB_preset_rsGrenadier**

  *Grenadier.*

* **KPLIB_preset_rsHeavyGunner**

  *Heavy Gunner.*

* **KPLIB_preset_rsPilotHeli**

  *Helicopter pilot.*

* **KPLIB_preset_rsPilotJet**

  *Jet pilot.*

* **KPLIB_preset_rsLightAt**

  *Light Anti Tank.*

* **KPLIB_preset_rsMarksman**

  *Marksman.*

* **KPLIB_preset_rsMedic**

  *Medic.*

* **KPLIB_preset_rsOfficer**

  *Officer.*

* **KPLIB_preset_rsParatrooper**

  *Paratrooper.*

* **KPLIB_preset_rsRifleman**

  *Rifleman.*

* **KPLIB_preset_rsSharpshooter**

  *Sharpshooter.*

* **KPLIB_preset_rsSquadLeader**

  *Squad Leader.*

* **KPLIB_preset_rsSurvivor**

  *Survivor.*

* **KPLIB_preset_rsTeamLeader**

  *Team Leader.*

* **KPLIB_preset_sfDiver**

  *Special Forces Diver.*

* **KPLIB_preset_sfExplosive**

  *Special Forces Explosive Specialist.*

* **KPLIB_preset_sfLightAt**

  *Special Forces Light Anti Tank.*

* **KPLIB_preset_sfMarksman**

  *Special Forces Marksman.*

* **KPLIB_preset_sfMedic**

  *Special Forces Medic.*

* **KPLIB_preset_sfRifleman**

  *Special Forces Rifleman.*

* **KPLIB_preset_sfSharpshooter**

  *Special Forces Sharpshooter.*

* **KPLIB_preset_sfSniper**

  *Special Forces Sniper.*

* **KPLIB_preset_sfSpotter**

  *Special Forces Spotter.*

* **KPLIB_preset_sfTeamLeader**

  *Special Forces Teamleader.*

* **KPLIB_preset_side**

  *Side for this preset.*

* **KPLIB_preset_slotHeli**

  *Helipad used to increase the GLOBAL rotary-wing cap.*

* **KPLIB_preset_slotJet**

  *Hangar used to increase the GLOBAL fixed-wing cap.*

* **KPLIB_preset_staticAa**

  *Static AA Classname.*

* **KPLIB_preset_staticAaBig**

  *Static Big AA Classname.*

* **KPLIB_preset_staticAt**

  *Static AT Classname.*

* **KPLIB_preset_storageLarge**

  *Large storage area for resources.*

* **KPLIB_preset_storageSmall**

  *Small storage area for resources.*

### Arrays
Nearly all listed arrays come in 2 variants beside of the usual F/E suffix.

The first variant e.g. `soldiers` is a build system compatible multi-dimensional array with resource costs.

The second variant has the suffix `Pl` for "Plain" e.g. `soldiersPl` which is a one-dimensional array with only the classnames.

* **KPLIB_preset_alphabet**

  *Military alphabet with `0 = A` to `25 = Z` (obviously only one-dimensional)*

* **KPLIB_preset_antiAir**

  *Anti Air vehicles.*

* **KPLIB_preset_arty**

  *Artillery vehicles.*

* **KPLIB_preset_deco**

  *Decorative Objects.*

* **KPLIB_preset_heliTrans**

  *Transport Helicopters.*

* **KPLIB_preset_heliAttack**

  *Attack Helicopters.*

* **KPLIB_preset_hVeh**

  *Heavy vehicles.*

* **KPLIB_preset_jets**

  *Jets.*

* **KPLIB_preset_logistic**

  *Logistic vehicles and objects.*

* **KPLIB_preset_lVeh**

  *Light vehicles.*

* **KPLIB_preset_planeTrans**

  *Transport Planes.*

* **KPLIB_preset_soldiers**

  *Regular infantry units.*

* **KPLIB_preset_specOps**

  *Special Forces units.*

* **KPLIB_preset_statics**

  *Static Defenses.*
