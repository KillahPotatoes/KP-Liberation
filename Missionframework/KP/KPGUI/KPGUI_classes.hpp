/*
    Killah Potatoes GUI base classes

    File: KPGUI_classes.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-09-13
    Last Update: 2020-05-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Base UI classes for KPGUI.
*/

/*
    --- Default grid ---
*/

#define GUI_GRID_WAbs           ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs           (GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W              (GUI_GRID_WAbs / 40)
#define GUI_GRID_H              (GUI_GRID_HAbs / 25)
#define GUI_GRID_X              (safezoneX)
#define GUI_GRID_Y              (safezoneY + safezoneH - GUI_GRID_HAbs)

/*
    --- Default text sizes ---
*/

#define GUI_TEXT_SIZE_SMALL     (GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM    (GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE     (GUI_GRID_H * 1.2)

/*
    --- General Classes ---
*/

// Scrollbar
class KPGUI_PRE_ScrollBar {
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

// Title bar for dialogs
class KPGUI_PRE_Title {
    deletable = 0;
    fade = 0;
    type = 0;
    idc = -1;
    colorBackground[] = KP_COLOR_PLAYERDEFINE;
    colorText[] = {1, 1, 1, 1};
    text = "DIALOG TITLE";
    fixedWidth = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    x = 0;
    y = 0;
    w = 0;
    h = safeZoneH * KP_HEIGTH_TITLE;
    style = 0;
    shadow = 1;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_XL;
    linespacing = 1;
};

// Cross symbol for dialog close
class KPGUI_PRE_CloseCross {
    deletable = 0;
    fade = 0;
    type = 11;
    style = 48 + 2048;
    color[] = {1, 1, 1, 0.75};
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 0.75};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    soundEnter[] = {"", 0.1, 1};
    soundPush[] = {"", 0.1, 1};
    soundClick[] = {"", 0.1, 1};
    soundEscape[] = {"", 0.1, 1};
    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
    default = 0;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    tooltip = "$STR_DISP_CLOSE";
    idc = -1;
    x = 0;
    y = 0;
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = KP_TEXT_M;
    url = "";
    action = "closeDialog 0";
};

// Help or version info icon
class KPGUI_PRE_VersionIcon: KPGUI_PRE_CloseCross {
    text = "\A3\Ui_f\data\Map\Markers\Military\unknown_CA.paa";
    tooltip = "";
    action = "";
};

// General background for the dialog area
class KPGUI_PRE_Background {
    deletable = 0;
    fade = 0;
    type = 0;
    idc = -1;
    colorBackground[] = KP_COLOR_BACKGROUND;
    colorText[] = {1, 1, 1, 1};
    text = "";
    fixedWidth = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = 0;
    shadow = 1;
    font = "RobotoCondensed";
    SizeEx = KP_TEXT_M;
    linespacing = 1;
};

// Normal Text
class KPGUI_PRE_Text {
    deletable = 0;
    fade = 0;
    type = 0;
    idc = -1;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    text = "";
    fixedWidth = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = 0;
    shadow = 1;
    font = "RobotoCondensed";
    SizeEx = KP_TEXT_M;
    linespacing = 1;
};

// Inline Title
class KPGUI_PRE_InlineTitle: KPGUI_PRE_Text {
    style = 2;
    sizeEx = KP_TEXT_L;
};

// Active Text
class KPGUI_PRE_ActiveText {
    deletable = 0;
    fade = 0;
    type = 11;
    style = 2;
    color[] = {0, 0, 0, 1};
    colorActive[] = {0.3, 0.4, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    soundEnter[] = {"", 0.1, 1};
    soundPush[] = {"", 0.1, 1};
    soundClick[] = {"", 0.1, 1};
    soundEscape[] = {"", 0.1, 1};
    text = "";
    default = 0;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = KP_TEXT_M;
    url = "";
};

// Picture
class KPGUI_PRE_Picture: KPGUI_PRE_Text {
    style = 48;
};

// Active Picture
class KPGUI_PRE_ActivePicture: KPGUI_PRE_ActiveText {
    color[] = {1, 1, 1, 0.5};
    colorActive[] = {1, 1, 1, 1};
    style = 48;
};

// Active Picture which keeps aspect ratio
class KPGUI_PRE_ActivePictureRatio: KPGUI_PRE_ActivePicture {
    style = 48 + 2048;
};

// Picture which keeps aspect ratio
class KPGUI_PRE_PictureRatio: KPGUI_PRE_Picture {
    style = 48 + 2048;
};

// Button
class KPGUI_PRE_Button {
    deletable = 0;
    fade = 0;
    type = 1;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorBackground[] = KP_COLOR_BACKGROUND;
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {0, 0, 0, 1};
    colorFocused[] = KP_COLOR_BACKGROUND;
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
    idc = -1;
    style = 2;
    x = 0;
    y = 0;
    w = 0;
    h = safeZoneH * KP_HEIGTH_BUTTON;
    shadow = 2;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_M;
    url = "";
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    borderSize = 0;
};

// Inline Button
class KPGUI_PRE_InlineButton: KPGUI_PRE_Button {
    colorBackground[] = {0.25, 0.25, 0.25, 1};
    colorBackgroundDisabled[] = {0, 1, 0, 1};
    colorBackgroundActive[] = {0.3, 0.3, 0.3, 1};
    colorFocused[] = {0.25, 0.25, 0.25, 1};
    offsetPressedX = safeZoneW * 0.0005;
    offsetPressedY = safeZoneH * 0.001;
};

// Controls group
class KPGUI_PRE_ControlsGroup {
    deletable = 0;
    fade = 0;
    class VScrollbar: KPGUI_PRE_ScrollBar {
        color[] = {1, 1, 1, 1};
        width = 0.021;
        autoScrollEnabled = 1;
    };
    class HScrollbar: KPGUI_PRE_ScrollBar {
        color[] = {1, 1, 1, 1};
        height = 0.028;
    };
    class Controls {};
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    shadow = 0;
    style = 16;
};

// Controls group no scrollbars
class KPGUI_PRE_ControlsGroupNoScrollbars: KPGUI_PRE_ControlsGroup {
    class VScrollbar: VScrollbar {
        width = 0;
    };
    class HScrollbar: HScrollbar {
        height = 0;
    };
};

// Combo
class KPGUI_PRE_Combo {
    deletable = 0;
    fade = 0;
    type = 4;
    colorSelect[] = {0, 0, 0, 1};
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = KP_COLOR_BACKGROUND;
    colorScrollbar[] = {1, 0, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    colorTextRight[] = {1, 1, 1, 1};
    colorSelectRight[] = {0, 0, 0, 1};
    colorSelect2Right[] = {0, 0, 0, 1};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect", 0.1, 1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand", 0.1, 1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse", 0.1, 1};
    maxHistoryDelay = 1;
    class ComboScrollBar: KPGUI_PRE_ScrollBar {
        color[] = {1, 1, 1, 1};
    };
    colorSelectBackground[] = {1, 1, 1, 0.7};
    colorActive[] = {1, 0, 0, 1};
    style = 16 + 512;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_M;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45;
};

// Checkbox
class KPGUI_PRE_CheckBox {
    color[] = {1, 1, 1, 0.7};
    colorFocused[] = {1, 1, 1, 1};
    colorHover[] = {1, 1, 1, 1};
    colorPressed[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.2};
    colorBackground[] = {0, 0, 0, 0};
    colorBackgroundFocused[] = {0, 0, 0, 0};
    colorBackgroundHover[] = {0, 0, 0, 0};
    colorBackgroundPressed[] = {0, 0, 0, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    soundEnter[] = {"", 0.1, 1};
    soundPush[] = {"", 0.1, 1};
    soundClick[] = {"", 0.1, 1};
    soundEscape[] = {"", 0.1, 1};
    idc = -1;
    type = 77;
    deletable = 0;
    style = 2;
    checked = 0;
    x = 0;
    y = 0;
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
    textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
};

// ListBox
class KPGUI_PRE_ListBox {
    deletable = 0;
    fade = 0;
    type = 5;
    rowHeight = 0;
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorScrollbar[] = {1, 0, 0, 0};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorBackground[] = {0, 0, 0, 0.3};
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    colorTextRight[] = {1, 1, 1, 1};
    colorSelectRight[] = {0, 0, 0, 1};
    colorSelect2Right[] = {0, 0, 0, 1};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    class ListScrollBar: KPGUI_PRE_ScrollBar {
        color[] = {1, 1, 1, 1};
        autoScrollEnabled = 1;
    };
    colorShadow[] = {0, 0, 0, 0.5};
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = 16;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_M;
    shadow = 0;
    period = 1.2;
    maxHistoryDelay = 1;
};

class KPGUI_PRE_ListNBox {
    deletable = 0;
    fade = 0;
    type = 102;
    rowHeight = 0;
    colorText[] = {1, 1, 1, 1};
    colorScrollbar[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorBackground[] = {0, 0, 0, 1};
    maxHistoryDelay = 1;
    soundSelect[] = {"", 0.1, 1};
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    drawSideArrows = 0;
    columns[] = {0.3, 0.6, 0.7};
    idcLeft = -1;
    idcRight = -1;
    class ListScrollBar: KPGUI_PRE_ScrollBar {};
    color[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 1};
    class ScrollBar: KPGUI_PRE_ScrollBar {};
    style = 16;
    shadow = 0;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_M;
    period = 1.2;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

// XListBox
class KPGUI_PRE_XListBox {
    deletable = 0;
    fade = 0;
    idc = -1;
    type = 42;
    x = 0.1;
    y = 0.1;
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = KP_COLOR_BACKGROUND;
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = 2 + 16 + 1024;
    shadow = 2;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    w = 0;
    h = 0;
    font = "RobotoCondensed";
    sizeEx = KP_TEXT_M;
};

// Slider
class KPGUI_PRE_Slider {
    deletable = 0;
    fade = 0;
    type = 43;
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 0.6};
    colorDisable[] = {1, 1, 1, 0.4};
    colorDisabled[] = {1, 1, 1, 0.2};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = 16 + 1024;
    shadow = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

// Editbox
class KPGUI_PRE_EditBox {
    deletable = 0;
    fade = 0;
    type = 2;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.04;
    colorBackground[] = {0, 0, 0, 0.3};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSelection[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = 64;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = KP_TEXT_M;
    canModify = 1;
};

// MapControl
class KPGUI_PRE_MapControl {
    deletable = 0;
    fade = 0;
    type = 101;
    idc = 51;
    style = 16 + 32;
    colorBackground[] = {0.969, 0.957, 0.949,1};
    colorOutside[] = {0, 0, 0, 1};
    colorText[] = {0, 0, 0, 1};
    font = "TahomaB";
    sizeEx = 0.04;
    colorSea[] = {0.467, 0.631, 0.851, 0.5};
    colorForest[] = {0.624, 0.78, 0.388, 0.5};
    colorRocks[] = {0, 0, 0, 0.3};
    colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
    colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
    colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
    colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
    colorForestBorder[] = {0, 0, 0, 0};
    colorRocksBorder[] = {0, 0, 0, 0};
    colorPowerLines[] = {0.1, 0.1, 0.1, 1};
    colorRailWay[] = {0.8, 0.2, 0, 1};
    colorNames[] = {0.1, 0.1, 0.1, 0.9};
    colorInactive[] = {1, 1, 1, 0.5};
    colorLevels[] = {0.286, 0.177, 0.094, 0.5};
    colorTracks[] = {0.84, 0.76, 0.65, 0.15};
    colorRoads[] = {0.7, 0.7, 0.7, 1};
    colorMainRoads[] = {0.9, 0.5, 0.3, 1};
    colorTracksFill[] = {0.84, 0.76, 0.65, 1};
    colorRoadsFill[] = {1, 1, 1, 1};
    colorMainRoadsFill[] = {1, 0.6, 0.4, 1};
    colorGrid[] = {0.1, 0.1, 0.1, 0.6};
    colorGridMap[] = {0.1, 0.1, 0.1, 0.6};
    stickX[] = {0.2, {"Gamma", 1, 1.5}};
    stickY[] = {0.2, {"Gamma", 1, 1.5}};
    class Legend {
        colorBackground[] = {1, 1, 1, 0.5};
        color[] = {0, 0, 0, 1};
        x = SafeZoneX + GUI_GRID_W;
        y = SafeZoneY + safezoneH - 4.5 * GUI_GRID_H;
        w = 10 * GUI_GRID_W;
        h = 3.5 * GUI_GRID_H;
        font = "RobotoCondensed";
        sizeEx = GUI_TEXT_SIZE_SMALL;
    };
    class ActiveMarker {
        color[] = {0.3, 0.1, 0.9, 1};
        size = 50;
    };
    class Command {
        color[] = {1, 1, 1, 1};
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Task {
        taskNone = "#(argb,8,8,3)color(0,0,0,0)";
        taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
        taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
        taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
        taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
        taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
        colorCreated[] = {1, 1, 1, 1};
        colorCanceled[] = {0.7, 0.7, 0.7, 1};
        colorDone[] = {0.7, 1, 0.3, 1};
        colorFailed[] = {1, 0.3, 0.2, 1};
        color[] = {
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
        };
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark {
        color[] = {1, 1, 1, 1};
        icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Tree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Church {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Chapel {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Cross {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Rock {
        color[] = {0.1, 0.1, 0.1, 0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bunker {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fountain {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class ViewTower {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Lighthouse {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Quay {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Fuelstation {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Hospital {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class BusStop {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class LineMarker {
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
        lineWidthThin = 0.008;
        lineWidthThick = 0.014;
        lineDistanceMin = 3e-005;
        lineLengthMin = 5;
    };
    class Transmitter {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Stack {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.4;
        coefMax = 2;
    };
    class Ruin {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class Tourism {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
    };
    class Watertower {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Waypoint {
        color[] = {1, 1, 1, 1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
    };
    class WaypointCompleted {
        color[] = {1, 1, 1, 1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
        size = 18;
    };
    colorTrails[] = {0.84, 0.76, 0.65, 0.15};
    colorTrailsFill[] = {0.84, 0.76, 0.65, 0.65};
    class power {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powersolar {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powerwave {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powerwind {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Shipwreck {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    moveOnEdges = 1;
    x = "SafeZoneXAbs";
    y = SafeZoneY + 1.5 * GUI_GRID_H;
    w = "SafeZoneWAbs";
    h = SafeZoneH - 1.5 * GUI_GRID_H;
    shadow = 0;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 2;
    alphaFadeEndScale = 2;
    fontLabel = "RobotoCondensed";
    sizeExLabel = GUI_TEXT_SIZE_SMALL;
    fontGrid = "TahomaB";
    sizeExGrid = 0.02;
    fontUnits = "TahomaB";
    sizeExUnits = GUI_TEXT_SIZE_SMALL;
    fontNames = "EtelkaNarrowMediumPro";
    sizeExNames = GUI_TEXT_SIZE_SMALL * 2;
    fontInfo = "RobotoCondensed";
    sizeExInfo = GUI_TEXT_SIZE_SMALL;
    fontLevel = "TahomaB";
    sizeExLevel = 0.02;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    idcMarkerColor = -1;
    idcMarkerIcon = -1;
    textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    showMarkers = 1;
};

/*
    --- Standard sized classes ---
*/

// Title bar
class KPGUI_PRE_DialogTitle: KPGUI_PRE_Title {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL;
    w = KP_GETWPLAIN(KP_WIDTH_VAL,1);
};

// Cross symbol
class KPGUI_PRE_DialogCross: KPGUI_PRE_CloseCross {
    x = KP_GETX_CROSS(KP_X_VAL);
    y = KP_GETY_CROSS(KP_Y_VAL);
};

// Version info
class KPGUI_PRE_DialogVersionIcon: KPGUI_PRE_VersionIcon {
    x = safeZoneX + safeZoneW * (KP_X_VAL + KP_WIDTH_VAL - 0.04);
    y = KP_GETY_CROSS(KP_Y_VAL);
};

// Background
class KPGUI_PRE_DialogBackground: KPGUI_PRE_Background {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,1);
    y = KP_GETY_AREA(KP_Y_VAL);
    w = KP_GETWPLAIN(KP_WIDTH_VAL,1);
    h = safeZoneH * KP_HEIGHT_VAL;
};

// Button pos 1 in 4 button row
class KPGUI_PRE_DialogButton: KPGUI_PRE_Button {
    x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,0,4);
    y = KP_GETY_BELOW(KP_Y_VAL,KP_HEIGHT_VAL);
    w = KP_GETWPLAIN(KP_WIDTH_VAL,4);
};

/*
    --- Large sized classes ---
*/

// Title bar
class KPGUI_PRE_DialogTitleL: KPGUI_PRE_Title {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_L;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,1);
};

// Cross symbol
class KPGUI_PRE_DialogCrossL: KPGUI_PRE_CloseCross {
    x = KP_GETX_CROSS(KP_X_VAL_L);
    y = KP_GETY_CROSS(KP_Y_VAL_L);
};

// Version info
class KPGUI_PRE_DialogVersionIconL: KPGUI_PRE_VersionIcon {
    x = safeZoneX + safeZoneW * (KP_X_VAL_L + KP_WIDTH_VAL_L - 0.04);
    y = KP_GETY_CROSS(KP_Y_VAL_L);
};

// Background
class KPGUI_PRE_DialogBackgroundL: KPGUI_PRE_Background {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_L);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,1);
    h = safeZoneH * KP_HEIGHT_VAL_L;
};

// Button pos 1 in 4 button row
class KPGUI_PRE_DialogButtonL: KPGUI_PRE_Button {
    x = KP_GETX(KP_X_VAL_L,KP_WIDTH_VAL_L,0,4);
    y = KP_GETY_BELOW(KP_Y_VAL_L,KP_HEIGHT_VAL_L);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_L,4);
};

/*
    --- Corner sized classes ---
*/

// Title bar
class KPGUI_PRE_DialogTitleC: KPGUI_PRE_Title {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_C;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};

// Cross symbol
class KPGUI_PRE_DialogCrossC: KPGUI_PRE_CloseCross {
    x = safeZoneX + safeZoneW * (KP_X_VAL_C + KP_WIDTH_VAL_C - 0.02);
    y = KP_GETY_CROSS(KP_Y_VAL_C);
};

// Version info
class KPGUI_PRE_DialogVersionIconC: KPGUI_PRE_VersionIcon {
    x = safeZoneX + safeZoneW * (KP_X_VAL_C + KP_WIDTH_VAL_C - 0.04);
    y = KP_GETY_CROSS(KP_Y_VAL_C);
};

// Background
class KPGUI_PRE_DialogBackgroundC: KPGUI_PRE_Background {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
    h = safeZoneH * KP_HEIGHT_VAL_C;
};

// Button
class KPGUI_PRE_DialogButtonC: KPGUI_PRE_Button {
    x = KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
    y = KP_GETY_BELOW(KP_Y_VAL_C,KP_HEIGHT_VAL_C);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_C,1);
};

/*
    --- Left panel sized classes ---
*/

// Title bar
class KPGUI_PRE_DialogTitle_LeftPanel: KPGUI_PRE_Title {
    x = KP_GETX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
    y = safeZoneY + safeZoneH * KP_Y_VAL_LP;
    w = KP_GETWPLAIN(KP_WIDTH_VAL_LP,1);
};

// Cross symbol
class KPGUI_PRE_DialogCross_LeftPanel: KPGUI_PRE_CloseCross {
    x = safeZoneX + safeZoneW * (KP_X_VAL_LP + KP_WIDTH_VAL_LP - 0.02);
    y = KP_GETY_CROSS(KP_Y_VAL_LP);
};

// Version info
class KPGUI_PRE_DialogVersionIcon_LeftPanel: KPGUI_PRE_VersionIcon {
    x = safeZoneX + safeZoneW * (KP_X_VAL_LP + KP_WIDTH_VAL_LP - 0.04);
    y = KP_GETY_CROSS(KP_Y_VAL_LP);
};

// Background
class KPGUI_PRE_DialogBackground_LeftPanel: KPGUI_PRE_Background {
    x = KP_GETX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
    y = KP_GETY_AREA(KP_Y_VAL_LP);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_LP,1);
    h = safeZoneH * KP_HEIGHT_VAL_LP;
};

// Button
class KPGUI_PRE_DialogButton_LeftPanel: KPGUI_PRE_Button {
    x = KP_GETX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
    y = KP_GETY_BELOW(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP);
    w = KP_GETWPLAIN(KP_WIDTH_VAL_LP,1);
};

/*
    --- Other classes ---
*/

class KPGUI_PRE_LogoRightCorner: KPGUI_PRE_PictureRatio {
    text = "KPGUI\res\kp512_CA.paa";
    x = "safezoneX + safezoneW - 5.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
    y = "safezoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};
