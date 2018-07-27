/*
    KP Liberation intro menu defines

    File: KPLIB_introMenu.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-07-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    The intro menu which appears after joining the mission.
*/

// TODO: REWORK!

class KPLIB_introMenu {
    idd = 75802;
    movingEnable = false;
    controls[] = {"Splash", "Start", "Help"};
    objects[] = {};

    class Splash {
        idc = -1;
        type =  CT_STATIC;
        style = ST_PICTURE;
        colorText[] = COLOR_WHITE;
        colorBackground[] = COLOR_NOALPHA;
        font = "RobotoCondensed";
        sizeEx = 0.1 * safezoneH;
        x = 0.08 * safezoneW + safezoneX;
        w = 0.25 * safezoneW;
        y = 0.15 * safezoneH + safezoneY;
        h = 0.43 * safezoneH;
        text = "res\splash.paa";
    };

    class Start {
        idc = 758021;
        type = CT_SHORTCUTBUTTON;
        style = ST_CENTER;
        x = (0.137 * safezoneW + safezoneX) - (0.01);
        y = (0.53 * safezoneH + safezoneY);
        w = (0.15 * safezoneW) - (0.01);
        h = (0.07 * safezoneH);
        sizeEx = 0.025 * safezoneH;
        size = 0.025 * safezoneH;
        text = "";
        action = "KPLIB_intro_startGame = 1;";
        textureNoShortcut = "res\btn_join_spl_idl3.paa";
        animTextureNormal = "res\btn_join_spl_idl3.paa";
        animTextureDisabled = "res\btn_join_spl_idl3.paa";
        animTextureOver = "res\btn_join_spl_hov3.paa";
        animTextureFocused = "res\btn_join_spl_idl3.paa";
        animTexturePressed = "res\btn_join_spl_hov3.paa";
        animTextureDefault = "res\btn_join_spl_idl3.paa";
        color[] = COLOR_WHITE;
        color2[] = COLOR_WHITE;
        colorActiveBackground[] = COLOR_WHITE;
        colorBackground[] = COLOR_WHITE;
        colorBackgroundFocused[] = COLOR_WHITE;
        colorBackground2[] = COLOR_WHITE;
        colorDisabled[] = COLOR_WHITE;
        colorFocused[] = COLOR_WHITE;
        font = "RobotoCondensed";
        soundEnter[] = { "", 0, 1 };  // no sound
        soundPush[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.891251, 1};
        soundClick[] = { "", 0, 1 };  // no sound
        soundEscape[] = { "", 0, 1 };  // no sound
        class HitZone {
            Left = 0;
            Right = 0;
            Top = 0;
            Bottom = 0;
        };
        class ShortcutPos {
            Left = 0;
            Top = 0;
            w = 0;
            h = 0;
        };
        class TextPos {
            left = 0;
            top = 0;
            right = 0;
            bottom = 0;
        };
    };

    class Help : Start {
        idc = 758022;
        y = (0.62 * safezoneH + safezoneY);
        animTextureNormal = "res\btn_htp_spl_idl3.paa";
        animTextureDisabled = "res\btn_htp_spl_idl3.paa";
        animTextureOver = "res\btn_htp_spl_hov3.paa";
        animTextureFocused = "res\btn_htp_spl_idl3.paa";
        animTexturePressed = "res\btn_htp_spl_hov3.paa";
        animTextureDefault = "res\btn_htp_spl_idl3.paa";
        tooltipColorShade[] = COLOR_BROWN;
        tooltipColorText[] = COLOR_WHITE;
        tooltipColorBox[] = COLOR_GREEN;
        action = "KPLIB_intro_tutorial = 1;";
    };


};
