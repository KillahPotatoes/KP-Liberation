/*
    KP Liberation redeploy dialog

    File: KPLIB_redeploy.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-08-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Redeploy dialog after respawn or select redeploy from a FOB or mobile spawn.
*/

// TODO: Switch from a variable change at the button to an event handler.

class KPLIB_redeploy {
    idd = 75801;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KP_DialogTitleC {
            text = "$STR_DEPLOY_TITLE";
        };

        class KPLIB_DialogArea: KP_DialogBackgroundC {};

        class KPLIB_LabelLoadout: KP_InlineTitle {
            text = "$STR_DEPLOY_LOADOUTLIST";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_TextLoadout: KP_Text {
            text = "$STR_DEPLOY_LOADOUTTEXT"
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_LabelDeploy: KPLIB_LabelLoadout {
            text = "$STR_DEPLOY_SPAWNLIST";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,7,48);
        };

        class KPLIB_LabelMap: KPLIB_LabelLoadout {
            text = "$STR_DEPLOY_MAPVIEW";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,2);
        };
    };

    class controls {

        class KPLIB_LoadoutsDropdown: KP_Combo {
            idc = 758011;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_DeployList: KP_ListBox {
            idc = 758012;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,24);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(24/7));
        };

        class KPLIB_DeployMap: RscMapControl {
            idc = 758013;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(16/7));
        };

        class KPLIB_DeployButton: KP_DialogButtonC {
            text = "$STR_DEPLOY_BUTTON";
            action = "KPLIB_dialog_deploy = 1";
        };
    };
};
