class liberation_logistic {
	idd = 75802;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {
		"OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "InnerBG2", "InnerBG_F2", "InnerBG3", "InnerBG_F3",
		"Header", "ButtonClose", "LogisticList", "ButtonCreateLogisticGroup", "ButtonDeleteLogisticGroup",
		"LogisticName", "StatusLabel", "Status", "TimeLabel", "Time", "DestinationLabel", "Destination",
		"LoadedTitle", "TruckCountLabel", "TruckCount", "LoadedSupplyLabel", "LoadedSupply", "LoadedAmmoLabel", "LoadedAmmo", "LoadedFuelLabel", "LoadedFuel", "ButtonBuyTruck", "ButtonSellTruck",
		"ATitle", "ACombo", "ASupp", "AAmmo", "AFuel",
		"BTitle", "BCombo", "BSupp", "BAmmo", "BFuel",
		"ALabel", "BLabel",
		"ButtonSaveLogistic", "ButtonAbortLogistic",
		"LogisticMap", "ButtonClose2"
	};

	objects[] = {};

	class OuterBG1 : StdBG {
		colorBackground[] = COLOR_BROWN;
		x = (0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE);
		y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.6 * safezoneW) + (4 * BORDERSIZE);
		h = (0.65 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F1 : OuterBG1 {
		style = ST_FRAME;
	};

	class InnerBG1 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.2 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.12 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F1 : InnerBG1 {
		style = ST_FRAME;
	};

	class InnerBG2 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.338 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.153 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F2 : InnerBG2 {
		style = ST_FRAME;
	};

	class InnerBG3 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.51 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.29 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F3 : InnerBG3 {
		style = ST_FRAME;
	};

	class Header : StdHeader {
		x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.14 * safezoneH + safezoneY;
		w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_LOGISTIC_HEADER;
	};

	class ButtonClose : StdButton {
		idc = 75801;
		x = 0.785 * safezoneW + safezoneX;
		y = 0.145 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		text = "X";
		action = "closeDialog 0";
	};

	class LogisticList : StdListBox {
		idc = 75802;
		x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.12 * safezoneW) + BORDERSIZE;
		h = (0.50 * safezoneH) + (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};

	class ButtonCreateLogisticGroup : StdButton {
	 	idc = 75803;
		sizeEx = 0.026 * safezoneH;
		x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.055 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_ADD;
		action = "addLogiGroup = 1";
	};

	class ButtonDeleteLogisticGroup : StdButton {
	 	idc = 75804;
		sizeEx = 0.026 * safezoneH;
		x = (0.265 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.055 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_DEL;
		action = "deleteLogiGroup = 1";
	};

	class LogisticName : StdText {
		idc = 75805;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = "";
	};

	class StatusLabel : StdText {
		idc = 75806;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.23 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_STATUS;
	};
	class Status : StatusLabel {
		idc = 75807;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class TimeLabel : StdText {
		idc = 75808;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.26 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_PRODUCTION_TIMER;
	};
	class Time : TimeLabel {
		idc = 75809;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class DestinationLabel : StdText {
		idc = 758010;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.29 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_DESTINATION;
	};
	class Destination : DestinationLabel {
		idc = 758011;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class LoadedTitle : StdText {
		idc = 758012;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.34 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_LOADEDDETAIL;
	};

	class TruckCountLabel : StdText {
		idc = 758013;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.37 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_TRUCKCOUNT;
	};
	class TruckCount : TruckCountLabel {
		idc = 758014;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class LoadedSupplyLabel : StdText {
		idc = 758015;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.4 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_MANPOWER;
	};
	class LoadedSupply : LoadedSupplyLabel {
		idc = 758016;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class LoadedAmmoLabel : StdText {
		idc = 758017;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.43 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_AMMO;
	};
	class LoadedAmmo : LoadedAmmoLabel {
		idc = 758018;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class LoadedFuelLabel : StdText {
		idc = 758019;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.46 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_FUEL;
	};
	class LoadedFuel : LoadedFuelLabel {
		idc = 758020;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class ButtonBuyTruck : StdButton {
	 	idc = 758021;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.49 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.0725 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = $STR_LOGSTIC_BUYTRUCK;
		tooltip = $STR_LOGISTIC_TT_BUYTRUCK;
		action = "buyLogiTruck = 1";
	};

	class ButtonSellTRuck : StdButton {
	 	idc = 758022;
		x = (0.4185 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.49 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.0725 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = $STR_LOGSTIC_SELLTRUCK;
		tooltip = $STR_LOGISTIC_TT_SELLTRUCK;
		action = "sellLogiTruck = 1";
	};

	class ATitle : StdText {
		idc = 758023;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.54 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_LABELA;
	};
	class ACombo : StdCombo {
		idc = 758024;
		sizeEx = 0.018 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.57 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
	};
	class ASupp : StdEdit {
		idc = 758025;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.6 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_SUPPLY;
		action = "";
		autocomplete = "";
	};
	class AAmmo : StdEdit {
		idc = 758026;
		x = (0.392 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.6 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_AMMO;
		action = "";
		autocomplete = "";
	};
	class AFuel : StdEdit {
		idc = 758027;
		x = (0.446 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.6 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_FUEL;
		action = "";
		autocomplete = "";
	};

	class BTitle : StdText {
		idc = 758028;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.63 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_LABELB;
	};
	class BCombo : StdCombo {
		idc = 758029;
		sizeEx = 0.018 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.66 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
	};
	class BSupp : StdEdit {
		idc = 758030;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.69 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_SUPPLY;
		action = "";
		autocomplete = "";
	};
	class BAmmo : StdEdit {
		idc = 758031;
		x = (0.392 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.69 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_AMMO;
		action = "";
		autocomplete = "";
	};
	class BFuel : StdEdit {
		idc = 758032;
		x = (0.446 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.69 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = 0.05 * safezoneW;
		text = "";
		tooltip = $STR_LOGISTIC_TT_FUEL;
		action = "";
		autocomplete = "";
	};

	class ALabel : StdText {
		idc = 758033;
		style = ST_CENTER;
		sizeEx = 0.018 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.57 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = "";
	};
	class BLabel : StdText {
		idc = 758034;
		style = ST_CENTER;
		sizeEx = 0.018 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.66 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = "";
	};

	class ButtonSaveLogistic : StdButton {
	 	idc = 758080;
		sizeEx = 0.02 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.021 * safezoneH);
		text = $STR_LOGISTIC_CONFIRM;
		action = "saveConvoySettings = 1";
	};
	class ButtonAbortLogistic : StdButton {
	 	idc = 758081;
		sizeEx = 0.02 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7368 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.021 * safezoneH);
		text = $STR_LOGISTIC_CANCEL;
		action = "convoyStandby = 1";
	};

	class LogisticMap : kndr_MapControl {
		idc = 758098;
		x = (0.51 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.29 * safezoneW) + BORDERSIZE;
		h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
	};

	 class ButtonClose2 : StdButton {
	 	idc = 758099;
		x = 0.455 * safezoneW + safezoneX;
		y = 0.77 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.035 * safezoneH;
		text = $STR_CLOSE;
		action = "closeDialog 0";
	};
};