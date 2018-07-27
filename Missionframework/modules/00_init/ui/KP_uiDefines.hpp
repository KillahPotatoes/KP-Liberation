/*
    Killah Potatoes UI defines, functions and classes

    File: KP_uiDefines.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    UI defines and classes used in mods and missions from the Killah Potatoes Gaming Community.
*/

// BI class includes
// Details via: "Default" call BIS_fnc_exportGUIBaseClasses;
#include "A3_defines.hpp"

/*
    --- General Defines ---
*/

// Text sizes
#define KP_TEXT_XS                      safeZoneH * 0.016
#define KP_TEXT_S                       safeZoneH * 0.018
#define KP_TEXT_M                       safeZoneH * 0.02
#define KP_TEXT_L                       safeZoneH * 0.025
#define KP_TEXT_XL                      safeZoneH * 0.03

// Constant values for calculation
#define KP_SPACING_X                    0.002
#define KP_SPACING_Y                    0.004
#define KP_HEIGTH_TITLE                 0.035
#define KP_HEIGTH_BUTTON                0.025

// Colors
#define KP_COLOR_PLAYERDEFINE           {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"}
#define KP_COLOR_BACKGROUND             {0, 0, 0, 0.5}
#define COLOR_BROWN                     {0.30, 0.25, 0.2, 0.75}
#define COLOR_GREEN                     {0.2, 0.23, 0.18, 0.75}
#define COLOR_GREEN_ALPHA               {0.2, 0.23, 0.18, 0.4}
#define COLOR_GREEN_NOALPHA             {0.2, 0.23, 0.18, 1}
#define COLOR_LIGHTGREEN                {0.4, 0.55, 0.36, 0.4}
#define COLOR_LIGHTGRAY                 {0.6, 0.6, 0.6, 0.8}
#define COLOR_LIGHTGRAY_ALPHA           {0.6, 0.6, 0.6, 0.55}
#define COLOR_WHITE                     {1, 1, 1, 1}
#define COLOR_NOALPHA                   {0, 0, 0, 0}
#define COLOR_BLUFOR                    {0, 0.3, 1, 1}
#define COLOR_OPFOR                     {1, 0, 0, 1}
#define COLOR_GUER                      {0.5, 0.5, 0.5, 0.5}
#define COLOR_WHITE_TRANSP              {1, 1, 1, 0.5}
#define COLOR_BLACK                     {0, 0, 0, 1}
#define COLOR_BLACK_ALPHA               {0, 0, 0, 0.85}
#define COLOR_BLUFOR_NOALPHA            {0, 0, 1, 1}
#define COLOR_OPFOR_NOALPHA             {1, 0, 0, 1}
#define COLOR_RED_DISABLED              {1, 0, 0, 0.4}
#define COLOR_BLEEDOUT                  {0.66, 0, 0, 0.8}
#define COLOR_BRIGHTGREEN               {0.2, 1, 0.2, 1}
#define COLOR_BLUE                      {0.2, 0.2, 1, 1}

/*
    --- Functions ---
*/

/*
    Get X coordinate
    Example: KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,2,4)
    KP_X_VAL -> Left offset of the left dialog side from the edge of the screen
    KP_WIDTH_VAL -> Width of the whole dialog (KP_X_VAL spacing to the left and to the right)
    2 -> Coordinate of the 3rd element position (0,1,2,3,etc.)
    4 -> In relation to a 4 element X grid

    GETX is for a coordinate in relation to the whole dialog width
    GETCX is for a coordinate in relation to the content area (which has an equal spacing to all sides)
*/

#define KP_GETX(XVAL,WVAL,POS,GRID)     safeZoneX + safeZoneW * (XVAL + POS * (WVAL + KP_SPACING_X) / GRID)
#define KP_GETCX(XVAL,WVAL,POS,GRID)    safeZoneX + safeZoneW * (XVAL + (POS * WVAL + (GRID - POS) * KP_SPACING_X) / GRID)
#define KP_GETX_CROSS(XVAL)             safeZoneX + safeZoneW * (1 - XVAL - 0.02)

/*
    Get Y coordinate
    Example: KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,8)
    KP_Y_VAL -> Top offset of the dialog top from the edge of the screen
    KP_HEIGHT_VAL -> Height of the area between title bar and bottom buttons in the dialog
    3 -> Coordinate of the 4th element position (0,1,2,3,etc.)
    8 -> In relation to a 8 element Y grid

    GETY_AREA is for the Y coordinate of the beginning of the background (which frames the content area)
    GETY_BELOW is for the Y coordinate of the buttons below the background
*/
#define KP_GETCY(YVAL,HVAL,POS,GRID)    safeZoneY + safeZoneH * ((YVAL + KP_HEIGTH_TITLE + KP_SPACING_Y) + (POS * HVAL + (GRID - POS) * KP_SPACING_Y) / GRID)
#define KP_GETY_CROSS(YVAL)             safeZoneY + safeZoneH * (YVAL + 0.005)
#define KP_GETY_AREA(YVAL)              safeZoneY + safeZoneH * (YVAL + KP_HEIGTH_TITLE + KP_SPACING_Y)
#define KP_GETY_BELOW(YVAL,HVAL)        safeZoneY + safeZoneH * (YVAL + KP_HEIGTH_TITLE + 2 * KP_SPACING_Y + HVAL)

/*
    Get width for an element
    Example: KP_GETW(KP_WIDTH_VAL,2)
    KP_WIDTH_VAL -> Width of the whole dialog (KP_X_VAL spacing to the left and to the right)
    2 -> Width for an element which fits 2 times in the content area from left to right (substracted by spacings to other elements left and right)

    GETW is in relation to the content area
    GETWPLAIN is in relation to the whole dialog width (for the buttons below for example)
*/
#define KP_GETW(WVAL,GRID)             safeZoneW * ((WVAL - (GRID + 1) * KP_SPACING_X) / GRID)
#define KP_GETWPLAIN(WVAL,GRID)        safeZoneW * ((WVAL - (GRID - 1) * KP_SPACING_X) / GRID)

/*
    Get height for an element
    Example: KP_GETH(KP_HEIGHT_VAL,10)
    KP_HEIGHT_VAL -> Height of the area between title bar and bottom buttons in the dialog
    10 -> Height for an element which fits 10 times in the content area from top to bottom (substracted by spacings to other elements above and below)
*/
#define KP_GETH(HVAL,GRID)             safeZoneH * ((HVAL - (GRID + 1) * KP_SPACING_Y) / GRID)

/*
    --- General Classes ---
*/

// Title bar for dialogs
class KP_Title: RscText {
    colorBackground[] = KP_COLOR_PLAYERDEFINE;
    text = "DIALOG TITLE";
    h = safeZoneH * KP_HEIGTH_TITLE;
    shadow = 1;
    sizeEx = KP_TEXT_XL;
};

// Cross symbol for dialog close
class KP_CloseCross: RscActiveText {
    style = 48;
    color[] = {1, 1, 1, 0.75};
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 0.75};
    colorActive[] = {1, 1, 1, 1};
    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
    tooltip = "$STR_DISP_CLOSE";
    action = "closeDialog 0";
};

// General background for the dialog area
class KP_Background: RscText {
    colorBackground[] = KP_COLOR_BACKGROUND;
};

// Normal Text
class KP_Text: RscText {
    sizeEx = KP_TEXT_M;
};

// Active Text
class KP_ActiveText: RscActiveText {
    style = 2;
    sizeEx = KP_TEXT_M;
};

// Picture
class KP_Picture: RscText {
    style = 48;
};

// Picture which keeps aspect ratio
class KP_PictureRatio: RscText {
    style = 48 + 2048;
};

// Button
class KP_Button: RscButton {
    h = safeZoneH * KP_HEIGTH_BUTTON;
    sizeEx = KP_TEXT_M;
};

// Shortcut Button
class KP_ShortcutButton: RscShortcutButton {
    colorBackground[] = {0.2, 0.2, 0.2, 1};
    colorBackgroundFocused[] = {0.25, 0.25, 0.25, 1};
    colorBackground2[] = {0.25, 0.25, 0.25, 1};
    style = 2;
    sizeEx = KP_TEXT_M;
}

// Controls group
class KP_ControlsGroup: RscControlsGroup {};

// Combo
class KP_Combo: RscCombo {
    colorBackground[] = KP_COLOR_BACKGROUND;
    sizeEx = KP_TEXT_M;
};

// Checkbox
class KP_CheckBox: RscCheckBox {
    style = 2;
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
};

// ListBox
class KP_ListBox: RscListBox {
    sizeEx = KP_TEXT_M;
};

// XListBox
class KP_XListBox: RscXListBox {
    colorBackground[] = KP_COLOR_BACKGROUND;
    sizeEx = KP_TEXT_M;
};

/*
    --- Standard sized dialog components ---
    (X from 0.25 - 0.75, Y from 0.2 - 0.8)
*/

#define KP_X_VAL                        0.25
#define KP_Y_VAL                        0.2

#define KP_WIDTH_VAL                    (1 - 2 * KP_X_VAL)
#define KP_HEIGHT_VAL                   (1 - 2 * KP_Y_VAL - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

// Title bar
class KP_DialogTitle: KP_Title {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL;
    w = KP_GETWPLAIN(KP_WIDTH_VAL,1);
};

// Cross symbol
class KP_DialogCross: KP_CloseCross {
    x = KP_GETX_CROSS(KP_X_VAL);
    y = KP_GETY_CROSS(KP_Y_VAL);
};

// Background
class KP_DialogBackground: KP_Background {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,1);
    y = KP_GETY_AREA(KP_Y_VAL);
    w = KP_GETWPLAIN(KP_WIDTH_VAL,1);
    h = safeZoneH * KP_HEIGHT_VAL;
};

// Button pos 1 in 4 button row
class KP_DialogButton: KP_Button {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,4);
    y = KP_GETY_BELOW(KP_Y_VAL,KP_HEIGHT_VAL);
    w = KP_GETWPLAIN(KP_WIDTH_VAL,4);
};

/*
    --- Large sized dialog components ---
    (X from 0.15 - 0.85, Y from 0.15 - 0.85)
*/

#define KP_X_VAL_L                      0.15
#define KP_Y_VAL_L                      0.15

#define KP_WIDTH_VAL_L                  (1 - 2 * KP_X_VAL_L)
#define KP_HEIGHT_VAL_L                 (1 - 2 * KP_Y_VAL_L - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

// Title bar
class KP_DialogTitleL: KP_Title {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_L;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,1);
};

// Cross symbol
class KP_DialogCrossL: KP_CloseCross {
    x = KP_GETX_CROSS(KP_X_VAL_L);
    y = KP_GETY_CROSS(KP_Y_VAL_L);
};

// Background
class KP_DialogBackgroundL: KP_Background {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_L);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,1);
    h = safeZoneH * KP_HEIGHT_VAL_L;
};

// Button pos 1 in 4 button row
class KP_DialogButtonL: KP_Button {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,4);
    y = KP_GETY_BELOW(KP_Y_VAL_L,KP_HEIGHT_VAL_L);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,4);
};

/*
    --- Corner dialog components ---
    (X from 0.035 - 0.285, Y from 0.05 - 0.8)
*/

#define KP_X_VAL_C                      0.035
#define KP_Y_VAL_C                      0.05

#define KP_WIDTH_VAL_C                  0.2
#define KP_HEIGHT_VAL_C                 (0.75 - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

// Title bar
class KP_DialogTitleC: KP_Title {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_C;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};

// Cross symbol
class KP_DialogCrossC: KP_CloseCross {
    x = KP_GETX_CROSS(KP_X_VAL_C);
    y = KP_GETY_CROSS(KP_Y_VAL_C);
};

// Background
class KP_DialogBackgroundC: KP_Background {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
    h = safeZoneH * KP_HEIGHT_VAL_C;
};

// Button
class KP_DialogButtonC: KP_Button {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,2);
    y = KP_GETY_BELOW(KP_Y_VAL_C,KP_HEIGHT_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};
