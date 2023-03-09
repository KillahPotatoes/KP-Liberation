// AUTHOR	      :	Terox (terox_@hotmail.com)
// MP MACHINE	  :	all
// Called from	:	Description.ext\cfgfunctions class;
// Called using	: #include "Txu_Info\cfgfunctions.hpp"
// Time Called	:	After description.ext, before mission.sqm (Pre-Init)
// Description	:	Core scripting initialisation, precompiling all functions and declaring global vars
//
// PARAMS	:	NONE



  private ["_pathCORE", "_pathFNC"];

/////////////////////////////////
//     DEFINE SCRIPT PATHS     //
/////////////////////////////////

  _pathCORE         = "TXU_INFO\";
  _pathFNC          = _pathCORE  + "f\";

/*     ----------------------     */
/*         LOG RPT ENTRY          */
/*     ----------------------     */
// stamp mission name to .rpt
// helps to distinguish which error logged in the rpt is linked to which missiom
  diag_log text "";
  diag_log text "";
  diag_log text format["|=========================  %1. %2 =========================|", missionName, worldName];
  diag_log text "INCLUDES: TXU_INFO (Briefing with Clickable links)";
  diag_log text "";
  diag_log text "";

//////////////////////////////
//     DEFINE FUNCTIONS     //
//////////////////////////////

  // Functions - GUI CONTROL
  TXU_INFO_fctrl_Buttons   =  compileFinal preprocessfilelinenumbers (_pathFNC + "fctrl_Buttons.sqf");
  TXU_INFO_fbriefingEH     =  compileFinal preprocessfilelinenumbers (_pathFNC + "fbriefingEH.sqf");
  TXU_INFO_fmapEH          =  compileFinal preprocessfilelinenumbers (_pathFNC + "fmapEH.sqf");




