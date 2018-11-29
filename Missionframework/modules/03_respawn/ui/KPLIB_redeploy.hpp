#include "defines.hpp"
/*
    KP Liberation redeploy dialog

    File: KPLIB_redeploy.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Splendid Redeploy dialog after respawn or select redeploy from a FOB or mobile spawn.
*/

class KPLIB_redeploy {
    idd = KPLIB_IDC_RESPAWN_DISPLAY;
    movingEnable = 0;

    onLoad = "call KPLIB_fnc_respawn_displayLoad";
    onUnload = "call KPLIB_fnc_respawn_displayUnload";

    class controlsBackground {

        class KPLIB_LogoRightCorner: KPGUI_PRE_LogoRightCorner {};

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_DEPLOY_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

        class KPLIB_LabelLoadout: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_DEPLOY_LOADOUTLIST";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_TextLoadout: KPGUI_PRE_Text {
            text = "$STR_KPLIB_DIALOG_DEPLOY_LOADOUTTEXT";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_LabelDeploy: KPLIB_LabelLoadout {
            text = "$STR_KPLIB_DIALOG_DEPLOY_SPAWNLIST";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,7,48);
        };

        class KPLIB_LabelMap: KPLIB_LabelLoadout {
            text = "$STR_KPLIB_DIALOG_DEPLOY_MAPVIEW";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,2);
        };
    };

    class controls {

        class KPLIB_LoadoutsDropdown: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_RESPAWN_LOADOUTS;
            onLBSelChanged = "call KPLIB_fnc_respawn_displayLoadoutSelChanged";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_DeployList: KPGUI_PRE_ListBox {
            idc = KPLIB_IDC_RESPAWN_SPAWNS;
            onLBSelChanged = "call KPLIB_fnc_respawn_displaySpawnSelChanged";
            onMouseButtonDblClick = "[ctrlParent (_this select 0)] call KPLIB_fnc_respawn_displayConfirm";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,24);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(24/7));
        };

        class KPLIB_DeployMap: KPGUI_PRE_MapControl {
            idc = KPLIB_IDC_RESPAWN_MAP;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(16/7));
        };

        class KPLIB_DeployButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPLIB_DIALOG_BUTTON_DEPLOY";
            onButtonClick = "[ctrlParent (_this select 0)] call KPLIB_fnc_respawn_displayConfirm";
        };
    };
};
