/*
    KP Liberation build display defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2019-04-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Overlay of build camera with all building controls
*/

// Build display
class KPLIB_build {
    idd = -1;
    movingEnable = 0;

    onLoad = "call KPLIB_fnc_build_displayLoad";
    onUnload = "call KPLIB_fnc_build_displayUnload";
    onKeyDown = "['onKeyDown', _this] call KPLIB_fnc_build_handleKeys";
    onKeyUp = "['onKeyUp', _this] call KPLIB_fnc_build_handleKeys";

    class controlsBackground {

        class KPLIB_LogoRightCorner: KPGUI_PRE_LogoRightCorner {};

        class MouseHandler: KPGUI_PRE_ControlsGroupNoScrollbars {
            idc = KPLIB_IDC_MOUSEHANDLER;
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            onMouseButtonDown = "['onMouseButtonDown', _this] call KPLIB_fnc_build_handleMouse";
            onMouseButtonUp = "['onMouseButtonUp', _this] call KPLIB_fnc_build_handleMouse";
            onMouseZChanged = "['onMouseZChanged', _this] call KPLIB_fnc_build_handleMouse";
            onMouseMoving = "['onMouseMoving', _this] call KPLIB_fnc_build_handleMouse";
            onMouseHolding = "['onMouseHolding', _this] call KPLIB_fnc_build_handleMouse";
        };

        #include "buildDisplay_leftBg.hpp"
        #include "buildDisplay_rightBg.hpp"

    };

    class Controls {

        #include "buildDisplay_left.hpp"
        #include "buildDisplay_right.hpp"

    };
};
