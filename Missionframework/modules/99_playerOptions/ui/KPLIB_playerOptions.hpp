class KPLIB_playerOptions
{
    idd = -1;
    class ControlsBackground
    {
        class KPLIB_Title
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.29375;
            y = safeZoneY + safeZoneH * 0.22444445;
            w = safeZoneW * 0.4125;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "KPLIB Player Options";
            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
                1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            shadow = 1;
        };
        class KPLIB_MainWindow
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.29375;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.4125;
            h = safeZoneH * 0.42777778;
            style = 0;
            text = "";
            colorBackground[] = {0,0,0,0.5};
            colorText[] = {1,1,1,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };
    };
    class Controls
    {
        class KPLIB_ConfirmButton
        {
            type = CT_BUTTON;
            style = ST_CENTER + ST_FRAME + ST_HUD_BACKGROUND;
            x = safeZoneX + safeZoneW * 0.29375;
            y = safeZoneY + safeZoneH * 0.71333334;
            w = safeZoneW * 0.4125;
            h = safeZoneH * 0.06111112;
            colorBackground[] = {0,0,0,1};
            colorBackgroundDisabled[] = {0,0,0,0.5};
            colorBackgroundActive[] =
            {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
                1
            };
            colorFocused[] =
            {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
                1
            };
            font = "PuristaLight";
            text = "Confirm";
            colorText[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,0.25};
            borderSize = 0;
            colorBorder[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            offsetX = 0;
            offsetY = 0;
            offsetPressedX = "pixelW";
            offsetPressedY = "pixelH";
            period = 0;
            periodFocus = 2;
            periodOver = 0.5;
            class KeyHints
            {
                class A
                {
                    key = "0x00050000 + 0";
                    hint = "KEY_XBOX_A";
                };
            };
            onCanDestroy = "";
            onDestroy = "";
            onMouseEnter = "";
            onMouseExit = "";
            onSetFocus = "";
            onKillFocus = "";
            onKeyDown = "";
            onKeyUp = "";
            onMouseButtonDown = "";
            onMouseButtonUp = "";
            onMouseButtonClick = "";
            onMouseButtonDblClick = "";
            onMouseZChanged = "";
            onMouseMoving = "";
            onMouseHolding = "";
            onButtonClick = "";
            onButtonDown = "";
            onButtonUp = "";
            soundClick[] =
            {
                "\A3\ui_f\data\sound\RscButton\soundClick",
                0.09,
                1
            };
            soundEnter[] =
            {
                "\A3\ui_f\data\sound\RscButton\soundEnter",
                0.09,
                1
            };
            soundPush[] =
            {
                "\A3\ui_f\data\sound\RscButton\soundPush",
                0.09,
                1
            };
            soundEscape[] =
            {
                "\A3\ui_f\data\sound\RscButton\soundEscape",
                0.09,
                1
            };
        };
    };
};
