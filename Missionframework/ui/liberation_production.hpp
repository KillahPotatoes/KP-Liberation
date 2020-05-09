class liberation_production {
    idd = 75801;
    movingEnable = false;
    controlsBackground[] = {};

    controls[] = {
        "OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "InnerBG2", "InnerBG_F2", "InnerBG3", "InnerBG_F3",
        "Header", "ButtonClose", "ProductionList",
        "SectorName", "SectorTypeLabel", "SectorType", "SectorProdLabel", "SectorProd", "SectorStorageLabel", "SectorStorage", "SectorTimerLabel", "SectorTimer",
        "FacilitiesTitle", "FacilitiesSupply", "FacilitiesAmmo", "FacilitiesFuel",
        "StorageTitle", "StorageSupplyLabel", "StorageSupply", "StorageAmmoLabel", "StorageAmmo", "StorageFuelLabel", "StorageFuel",
        "ProduceTitle", "ProduceToolBox", "ButtonSaveSector",
        "SectorMap", "ButtonClose2"
    };

    objects[] = {};

    class OuterBG1: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = (0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE);
        y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.6 * safezoneW) + (4 * BORDERSIZE);
        h = (0.65 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F1: OuterBG1 {
        style = ST_FRAME;
    };
    class InnerBG1: OuterBG1 {
        colorBackground[] = COLOR_GREEN;
        x = (0.2 * safezoneW + safezoneX) - (BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
        w = (0.12 * safezoneW) + (2 * BORDERSIZE);
        h = (0.55 * safezoneH) + (3 * BORDERSIZE);
    };
    class InnerBG_F1: InnerBG1 {
        style = ST_FRAME;
    };
    class InnerBG2: OuterBG1 {
        colorBackground[] = COLOR_GREEN;
        x = (0.338 * safezoneW + safezoneX) - (BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
        w = (0.153 * safezoneW) + (2 * BORDERSIZE);
        h = (0.55 * safezoneH) + (3 * BORDERSIZE);
    };
    class InnerBG_F2: InnerBG2 {
        style = ST_FRAME;
    };
    class InnerBG3: OuterBG1 {
        colorBackground[] = COLOR_GREEN;
        x = (0.51 * safezoneW + safezoneX) - (BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
        w = (0.29 * safezoneW) + (2 * BORDERSIZE);
        h = (0.55 * safezoneH) + (3 * BORDERSIZE);
    };
    class InnerBG_F3: InnerBG3 {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
        y = 0.14 * safezoneH + safezoneY;
        w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
        h = 0.05 * safezoneH - (BORDERSIZE);
        text = $STR_PRODUCTION_HEADER;
    };
    class ButtonClose: StdButton {
        idc = 75801;
        x = 0.785 * safezoneW + safezoneX;
        y = 0.145 * safezoneH + safezoneY;
        w = 0.015 * safezoneW;
        h = 0.02 * safezoneH;
        text = "X";
        action = "closeDialog 0";
    };
    class ProductionList: StdListBox {
        idc = 75802;
        colorSelect[] = COLOR_BLUE;
        colorSelect2[] = COLOR_BLUE;
        x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.12 * safezoneW) + BORDERSIZE;
        h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
        shadow = 2;
        onLBSelChanged="";
    };
    class SectorName: StdText {
        idc = 75803;
        style = ST_CENTER;
        colorBackground[] = COLOR_BLACK_ALPHA;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = "";
    };
    class SectorTypeLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.23 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_TYPE;
    };
    class SectorType: SectorTypeLabel {
        idc = 75804;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class SectorProdLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.26 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_PRODUCING;
    };
    class SectorProd: SectorProdLabel {
        idc = 75805;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class SectorStorageLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.29 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_STORAGE;
    };
    class SectorStorage: SectorStorageLabel {
        idc = 75806;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class SectorTimerLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.32 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_TIMER;
    };
    class SectorTimer: SectorTimerLabel {
        idc = 75807;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class FacilitiesTitle: StdText {
        idc = -1;
        style = ST_CENTER;
        colorBackground[] = COLOR_BLACK_ALPHA;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.37 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_FACILITIES;
    };
    class FacilitiesSupply: StdText {
        idc = 75808;
        style = ST_CENTER;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.4 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_MANPOWER;
    };
    class FacilitiesAmmo: StdText {
        idc = 75809;
        style = ST_CENTER;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.43 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_AMMO;
    };
    class FacilitiesFuel: StdText {
        idc = 758010;
        style = ST_CENTER;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.46 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_FUEL;
    };
    class StorageTitle: StdText {
        idc = -1;
        style = ST_CENTER;
        colorBackground[] = COLOR_BLACK_ALPHA;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.51 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_STORAGEDETAIL;
    };
    class StorageSupplyLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.54 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_MANPOWER;
    };
    class StorageSupply: StorageSupplyLabel {
        idc = 758011;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class StorageAmmoLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.57 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_AMMO;
    };
    class StorageAmmo: StorageAmmoLabel {
        idc = 758012;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class StorageFuelLabel: StdText {
        idc = -1;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.6 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.07 * safezoneW);
        h = (0.02 * safezoneH);
        text = $STR_FUEL;
    };
    class StorageFuel: StorageFuelLabel {
        idc = 758013;
        style = ST_RIGHT;
        x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        w = (0.08 * safezoneW);
        text = "";
    };
    class ProduceTitle: StdText {
        idc = -1;
        style = ST_CENTER;
        colorBackground[] = COLOR_BLACK_ALPHA;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.65 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.02 * safezoneH);
        text = $STR_PRODUCTION_PRODUCE;
    };
    class ProduceToolBox {
        idc = 758014;
        type = CT_TOOLBOX;
        style = ST_CENTER;
        font = FontM;
        sizeEx = 0.02 * safezoneH;
        color[] = {0, 0, 0, 1};
        colorText[] = COLOR_WHITE;
        colorTextSelect[] = {0, 0.9, 0, 1};
        colorSelect[] = {0, 0, 1, 1};
        colorTextDisable[] = {0, 1, 0, 1};
        colorDisable[] = {1, 0, 0, 1};
        colorSelectedBg[] = COLOR_LIGHTGRAY_ALPHA;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.68 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.03 * safezoneH);
        rows = 1;
        columns = 3;
        strings[] = {$STR_MANPOWER,$STR_AMMO,$STR_FUEL};
        values[] = {0,1,2};
        onToolBoxSelChanged = "new_production = (_this select 1)";
    };
    class ButtonSaveSector: StdButton {
         idc = 758015;
        sizeEx = 0.026 * safezoneH;
        x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.153 * safezoneW) + BORDERSIZE;
        h = (0.045 * safezoneH);
        text = $STR_CONFIRM;
        action = "saveSectorSetting = 1";
    };
    class SectorMap: kndr_MapControl {
        idc = 758016;
        x = (0.51 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
        w = (0.29 * safezoneW) + BORDERSIZE;
        h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
    };
     class ButtonClose2: StdButton {
         idc = 758017;
        x = 0.455 * safezoneW + safezoneX;
        y = 0.77 * safezoneH + safezoneY;
        w = 0.09 * safezoneW;
        h = 0.035 * safezoneH;
        text = $STR_CLOSE;
        action = "closeDialog 0";
    };
};
