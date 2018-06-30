/*
    KP Liberation specific ui classes

    File: KPLIB_uiClasses.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-16
    Last Update: 2018-06-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    The specific ui classes used in KP Liberation.
*/

// Dialog title bar general
class KPLIB_Title: KPLIB_Text {
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
    };
    text = "DIALOG TITLE";
    h = safeZoneH * KPLIB_GUI_HEIGTH_TITLE;
    shadow = 1;
    sizeEx = KPLIB_GUI_TEXT_SIZE_XLARGE;
};

// Cross symbol for dialog close
class KPLIB_CloseCross: KPLIB_ActiveText {
    style = 48;
    color[] = {1, 1, 1, 0.69999999};
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 0.69999999};
    colorActive[] = {1, 1, 1, 1};
    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
    w="1.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h="1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    tooltip = "$STR_DISP_CLOSE";
    sizeEx = KPLIB_GUI_TEXT_SIZE_XLARGE;
    action = "closeDialog 0";
};

// General background for the dialog area
class KPLIB_AreaBackground: KPLIB_Text {
    colorBackground[] = KPLIB_GUI_COLOR_BACKGROUND;
};
