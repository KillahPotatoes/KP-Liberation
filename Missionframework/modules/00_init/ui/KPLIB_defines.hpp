/*
    KP Liberation ui defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-01-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    The general ui defines for KP Liberation.
*/

// Control types
#define CT_STATIC               0
#define CT_BUTTON               1
#define CT_EDIT                 2
#define CT_SLIDER               3
#define CT_COMBO                4
#define CT_LISTBOX              5
#define CT_TOOLBOX              6
#define CT_CHECKBOXES           7
#define CT_PROGRESS             8
#define CT_HTML                 9
#define CT_STATIC_SKEW          10
#define CT_ACTIVETEXT           11
#define CT_TREE                 12
#define CT_STRUCTURED_TEXT      13
#define CT_CONTEXT_MENU         14
#define CT_CONTROLS_GROUP       15
#define CT_SHORTCUTBUTTON       16
#define CT_HITZONES             17
#define CT_XKEYDESC             40
#define CT_XBUTTON              41
#define CT_XLISTBOX             42
#define CT_XSLIDER              43
#define CT_XCOMBO               44
#define CT_ANIMATED_TEXTURE     45
#define CT_OBJECT               80
#define CT_OBJECT_ZOOM          81
#define CT_OBJECT_CONTAINER     82
#define CT_OBJECT_CONT_ANIM     83
#define CT_LINEBREAK            98
#define CT_USER                 99
#define CT_MAP                  100
#define CT_MAP_MAIN             101
#define CT_LISTNBOX             102
#define CT_ITEMSLOT             103
#define CT_CHECKBOX             77

// Static styles
#define ST_POS                  0x0F
#define ST_HPOS                 0x03
#define ST_VPOS                 0x0C
#define ST_LEFT                 0x00
#define ST_RIGHT                0x01
#define ST_CENTER               0x02
#define ST_DOWN                 0x04
#define ST_UP                   0x08
#define ST_VCENTER              0x0C

#define ST_TYPE                 0xF0
#define ST_SINGLE               0x00
#define ST_MULTI                0x10
#define ST_TITLE_BAR            0x20
#define ST_PICTURE              0x30
#define ST_FRAME                0x40
#define ST_BACKGROUND           0x50
#define ST_GROUP_BOX            0x60
#define ST_GROUP_BOX2           0x70
#define ST_HUD_BACKGROUND       0x80
#define ST_TILE_PICTURE         0x90
#define ST_WITH_RECT            0xA0
#define ST_LINE                 0xB0
#define ST_UPPERCASE            0xC0
#define ST_LOWERCASE            0xD0

#define ST_SHADOW               0x100
#define ST_NO_RECT              0x200
#define ST_KEEP_ASPECT_RATIO    0x800

// Slider styles
#define SL_DIR                  0x400
#define SL_VERT                 0
#define SL_HORZ                 0x400

#define SL_TEXTURES             0x10

// progress bar
#define ST_VERTICAL             0x01
#define ST_HORIZONTAL           0

// Listbox styles
#define LB_TEXTURES             0x10
#define LB_MULTI                0x20

// Tree styles
#define TR_SHOWROOT             1
#define TR_AUTOCOLLAPSE         2

// Default grid
#define GUI_GRID_WAbs           ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs           (GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W              (GUI_GRID_WAbs / 40)
#define GUI_GRID_H              (GUI_GRID_HAbs / 25)
#define GUI_GRID_X              (safezoneX)
#define GUI_GRID_Y              (safezoneY + safezoneH - GUI_GRID_HAbs)

// Default text sizes
#define GUI_TEXT_SIZE_SMALL     (GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM    (GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE     (GUI_GRID_H * 1.2)

/*
    --- OLD FRAMEWORK DEFINES ---
*/
#define FontM                   "puristaMedium"

#define COLOR_BROWN             {0.30, 0.25, 0.2, 0.75}
#define COLOR_GREEN             {0.2, 0.23, 0.18, 0.75}
#define COLOR_GREEN_ALPHA       {0.2, 0.23, 0.18, 0.4}
#define COLOR_GREEN_NOALPHA     {0.2, 0.23, 0.18, 1}
#define COLOR_LIGHTGREEN        {0.4, 0.55, 0.36, 0.4}
#define COLOR_LIGHTGRAY         {0.6, 0.6, 0.6, 0.8}
#define COLOR_LIGHTGRAY_ALPHA   {0.6, 0.6, 0.6, 0.55}
#define COLOR_WHITE             {1, 1, 1, 1}
#define COLOR_NOALPHA           {0, 0, 0, 0}
#define COLOR_BLUFOR            {0, 0.3, 1, 1}
#define COLOR_OPFOR             {1, 0, 0, 1}
#define COLOR_GUER              {0.5, 0.5, 0.5, 0.5}
#define COLOR_WHITE_TRANSP      {1, 1, 1, 0.5}
#define COLOR_BLACK             {0, 0, 0, 1}
#define COLOR_BLACK_ALPHA       {0, 0, 0, 0.85}
#define COLOR_BLUFOR_NOALPHA    {0, 0, 1, 1}
#define COLOR_OPFOR_NOALPHA     {1, 0, 0, 1}
#define COLOR_RED_DISABLED      {1, 0, 0, 0.4}
#define COLOR_BLEEDOUT          {0.66, 0, 0, 0.8}
#define COLOR_BRIGHTGREEN       {0.2, 1, 0.2, 1}
#define COLOR_BLUE              {0.2, 0.2, 1, 1}

#define SHADOW_X                0.0008
#define SHADOW_Y                0.0011
#define ICONE_SPACY             0.025

#define BORDERSIZE              0.01
