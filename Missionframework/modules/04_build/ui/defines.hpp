/*
    KP LIBERATION BUILD UI DEFINES

    File: defines.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-11-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Common defines for build module UI elements
*/

// General defines
#define KPLIB_BUILD_TAB_Y_OFFSET            0.02

// IDCs
#define KPLIB_IDC_MOUSEHANDLER              101
#define KPLIB_IDC_BUILD_TAB_INFANTRY        70100
#define KPLIB_IDC_BUILD_TAB_LIGHT           70101
#define KPLIB_IDC_BUILD_TAB_HEAVY           70102
#define KPLIB_IDC_BUILD_TAB_AIR             70103
#define KPLIB_IDC_BUILD_TAB_STATIC          70104
#define KPLIB_IDC_BUILD_TAB_BUILDING        70105
#define KPLIB_IDC_BUILD_TAB_SUPPORT         70106
#define KPLIB_IDC_BUILD_TAB_SQUAD           70107

#define KPLIB_IDC_BUILD_ITEM_LIST           70202

#define KPLIB_IDC_BUILD_CONFIRM             70301

// All tabs IDCs
#define KPLIB_BUILD_TABS_IDCS_ARRAY         [70100,70101,70102,70103,70104,70105,70106,70107]

/*
    Overwite default gui macros values
*/
#define KP_X_VAL_C                      0
#define KP_Y_VAL_C                      0

#define KP_WIDTH_VAL_C                  0.25
#define KP_HEIGHT_VAL_C                 (1 - KP_HEIGTH_TITLE - KP_HEIGTH_BUTTON - 2 * KP_SPACING_Y)
