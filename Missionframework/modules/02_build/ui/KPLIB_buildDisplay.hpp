
#include "..\..\00_init\ui\KPLIB_defines.hpp"
/*
    KP Liberation build display defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Overlay of build camera with all building controls
*/

class KPLIB_build {
    idd = -1;
    movingEnable = false;

    class ControlsBackground {

        class KPLIB_ItemsTitle: KPLIB_Title {
            text = "Units list";
            x = KPLIB_GUI_POS_X_CORNER;
            y = KPLIB_GUI_POS_Y_CORNER;
            w = KPLIB_GUI_WIDTH_CORNER;
        };
        class KPLIB_ItemsArea: KPLIB_AreaBackground {
            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_GUI_HEIGHT_AREA_CORNER;
        };

    };

    class Controls {

        class KPLIB_CloseDisplay: KPLIB_CloseCross {
            x = KPLIB_GUI_POS_X_CROSS_CORNER;
            y = KPLIB_GUI_POS_Y_CROSS_CORNER;
            // Close whole build camera
            action = "call KPLIB_fnc_build_camera_close";
        };

        class KPLIB_BuildListGroup: KPLIB_ControlsGroup {
            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_GUI_HEIGHT_AREA_CORNER;

            class Controls {
            };
        };

    };
};
