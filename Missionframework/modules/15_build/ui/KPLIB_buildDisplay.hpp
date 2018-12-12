/*
    KP Liberation build display defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-12-12
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

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitle_LeftPanel {
            text = "$STR_KPLIB_DIALOG_BUILD_TITLE";
        };

        class KP_DialogArea: KPGUI_PRE_DialogBackground_LeftPanel {
            idc = KPLIB_IDC_BUILD_DIALOG_AREA;
        };

    };

    class Controls {

        class KPLIB_BuildCategoryList: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_BUILD_CATEGORY_LIST;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,2,40);
            w = KP_GETW(KP_WIDTH_VAL_LP,1);
            h = KP_GETH(KP_HEIGHT_VAL_LP,40);

            onMouseZChanged = "['onMouseZChanged_BuildCategoryList', _this] call KPLIB_fnc_build_handleMouse";
        };

        class KPLIB_BuildSearch: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_BUILD_SEARCH;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,12);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,3,40);
            w = KP_GETW(KP_WIDTH_VAL_LP,(12/11));
            h = KP_GETH(KP_HEIGHT_VAL_LP,40);
        };

        class KPLIB_BuildSearchButton: KPGUI_PRE_ActivePictureRatio {
            idc = KPLIB_IDC_BUILD_SEARCH_BUTTON;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,11,12);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,3,40);
            w = KP_GETW(KP_WIDTH_VAL_LP,(12/1));
            h = KP_GETH(KP_HEIGHT_VAL_LP,40);

            text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
        }

        class KPLIB_BuildList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_BUILD_ITEM_LIST;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,2,20);
            w = KP_GETW(KP_WIDTH_VAL_LP,1);
            h = KP_GETH(KP_HEIGHT_VAL_LP,(20/18));

            columns[] = { 0, 0.65, 0.75, 0.85 };

            onMouseZChanged = "['onMouseZChanged_BuildList', _this] call KPLIB_fnc_build_handleMouse";
        };

        class KPLIB_ToolboxContainer: KPGUI_PRE_ControlsGroup {
            class VScrollbar: KPGUI_PRE_ScrollBar {
                width = 0;
            };
            class HScrollbar: KPGUI_PRE_ScrollBar {
                color[] = {1, 1, 1, 0.5};
                height = 0.02;
            };

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,0,20);
            w = KP_GETW(KP_WIDTH_VAL_LP,1);
            h = KP_GETH(KP_HEIGHT_VAL_LP,20);

            // Toolbox Controls
            class Controls {
                // TODO move toolbox items creation to script
                class KPLIB_Toolbox_MoveItems: KPGUI_PRE_ActiveText {
                    text = "Build mode";
                    idc = KPLIB_IDC_BUILD_TOOLBOX_MOVEITEMS;

                    colorActive[] = {1, 1, 1, 1};
                    colorText[] = {1, 1, 1, 0.75};
                    colorDisabled[] = {1, 1, 1, 0.25};
                    color[] = {1, 1, 1, 0.55};

                    x = 0;
                    y = 0;
                    w = KP_GETW(KP_WIDTH_VAL_LP,4);
                    h = KP_GETH(KP_HEIGHT_VAL_LP,20) - 0.02;

                    onButtonClick = "_this call KPLIB_fnc_build_changeQueueMode";
                };
            };
        };

        class KP_ApplyButton: KPGUI_PRE_DialogButton_LeftPanel {
            idc = KPLIB_IDC_BUILD_CONFIRM;
            text = "$STR_KPLIB_DIALOG_BUTTON_BUILD";

            w = KP_GETWPLAIN(KP_WIDTH_VAL_LP,1);
            onButtonClick = "_this call KPLIB_fnc_build_confirmAll";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCross_LeftPanel {
            action = "call KPLIB_fnc_build_stop";
        };

    };
};
