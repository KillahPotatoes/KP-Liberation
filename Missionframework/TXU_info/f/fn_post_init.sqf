/*
// AUTHOR       : Terox (terox_@hotmail.com)
// MP MACHINE   : all
// Called from  : Description.ext\cfgfunctions class;
// Called using : #include "Txu_Info\cfgfunctions.hpp"
// Time Called  : After mission.sqm (Post-Init)
// Description  : Core scripting initialisation for post init functionality
//
// PARAMS : NONE

*/
if!(HasInterface)exitwith{};
player createDiarySubject[ "TXU_TSINFO", "Community Info" ];
player createDiaryRecord[ "TXU_TSINFO", [ "Downloads & Links", "" ] ];

/*
  Map EH does not fire in the initial briefing screen prior to mission start, so...
  1) Use the EachFrame EH to add the buttons during initial briefing
  2) Remove the EachFrameEH once the URL Link buttons are added
  3) Then switch to a less resource hungry MAP EH after the mission starts
*/
TXU_INFO_FrameEHId = addMissionEventHandler ["EachFrame",{[] call TXU_INFO_fbriefingEH}];
[] spawn{sleep 1;TXU_INFO_MapEHId = addMissionEventHandler ["Map",{ _this spawn TXU_INFO_fmapEH  }];};




