/*
    Killah Potatoes GUI defines and functions

    File: KPGUI_defines.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2020-04-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        UI defines and functions used in mods and missions from the Killah Potatoes Gaming Community.
*/

// Prefix for this use case to avoid issues with duplicated definitions
#define KPGUI_PRE                       KPLIB

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
    --- Standard sized dialog components ---
    (X from 0.25 - 0.75, Y from 0.2 - 0.8)
*/

#define KP_X_VAL                        0.25
#define KP_Y_VAL                        0.2

#define KP_WIDTH_VAL                    (1 - 2 * KP_X_VAL)
#define KP_HEIGHT_VAL                   (1 - 2 * KP_Y_VAL - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

/*
    --- Large sized dialog components ---
    (X from 0.15 - 0.85, Y from 0.15 - 0.85)
*/

#define KP_X_VAL_L                      0.15
#define KP_Y_VAL_L                      0.15

#define KP_WIDTH_VAL_L                  (1 - 2 * KP_X_VAL_L)
#define KP_HEIGHT_VAL_L                 (1 - 2 * KP_Y_VAL_L - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

/*
    --- Corner dialog components ---
    (X from 0.035 - 0.235, Y from 0.05 - 0.8)
*/

#define KP_X_VAL_C                      0.035
#define KP_Y_VAL_C                      0.05

#define KP_WIDTH_VAL_C                  0.2
#define KP_HEIGHT_VAL_C                 (0.75 - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

/*
    --- Left panel dialog components ---
*/

#define KP_X_VAL_LP                     0.0025
#define KP_Y_VAL_LP                     0.0025

#define KP_WIDTH_VAL_LP                 0.2
#define KP_HEIGHT_VAL_LP                (1 - 2 * KP_Y_VAL_LP - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)

// Classes include
#include "KPGUI_classes.hpp"
