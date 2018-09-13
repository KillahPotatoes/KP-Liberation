/*
    Killah Potatoes GUI base classes

    File: KPGUI_classes.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-09-13
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Base UI classes for KPGUI.

*/

/*
    --- General Classes ---
*/

// Scrollbar
class KPGUI_PRE_ScrollBar
{
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
    access = 0;
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
    access = 0;
    type = 11;
    style = 48;
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

// General background for the dialog area
class KPGUI_PRE_Background {
    deletable = 0;
    fade = 0;
    access = 0;
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
    access = 0;
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
    access = 0;
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

// Picture which keeps aspect ratio
class KPGUI_PRE_PictureRatio: KPGUI_PRE_Picture {
    style = 48 + 2048;
};

// Button
class KPGUI_PRE_Button {
    deletable = 0;
    fade = 0;
    access = 0;
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

// Combo
class KPGUI_PRE_Combo {
    deletable = 0;
    fade = 0;
    access = 0;
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
    access = 0;
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
    access = 0;
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
    access = 0;
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
