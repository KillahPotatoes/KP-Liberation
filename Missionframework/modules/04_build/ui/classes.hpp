/*
    KPLIB_fnc_

    File: classes.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-03
    Last Update: 2018-11-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Build module custom classes
*/

/*
    Custom dialog controls definitions
*/
class KPLIB_BUILD_DialogTitleC: KPGUI_PRE_DialogTitleC {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_C;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};

// Cross symbol
class KPLIB_BUILD_DialogCrossC: KPGUI_PRE_DialogCrossC {
    x = safeZoneX + safeZoneW * (KP_X_VAL_C + KP_WIDTH_VAL_C - 0.02);
    y = KP_GETY_CROSS(KP_Y_VAL_C);
};

// Background
class KPLIB_BUILD_DialogBackgroundC: KPGUI_PRE_DialogBackgroundC {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
    h = safeZoneH * KP_HEIGHT_VAL_C;
};

// Button
class KPLIB_BUILD_DialogButtonC: KPGUI_PRE_DialogButtonC {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = KP_GETY_BELOW(KP_Y_VAL_C,KP_HEIGHT_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};
