class liberation_repackage_fob {
	idd = 5755;
	movingEnable = false;
	controlsBackground[] = { "OuterBG", "RecycleBG", "OuterBG_F", "InnerBG", "InnerBG_F" };
	controls[] = { "Header", "ButtonClose", "Infotext","TruckButton","BoxButton","CancelButton"};
	objects[] = {};

	class RecycleBG : BgPicture {
		x = (0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.4 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.3 * safezoneW) + (4 * BORDERSIZE);
		h = (0.2 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.4 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.3 * safezoneW) + (4 * BORDERSIZE);
		h = (0.2 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.35 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = 0.45 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
		w = (0.3 * safezoneW) +  (2 * BORDERSIZE);
		h = 0.15 * safezoneH  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.35 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.39 * safezoneH + safezoneY;
		w = 0.3 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_FOB_REPACKAGE_TITLE;
	};
	class ButtonClose : StdButton{
		idc = 101;
		x = 0.632 * safezoneW + safezoneX;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		y = 0.402 * safezoneH + safezoneY;
		text = "X";
		action = "closeDialog 0";
	};
	class Infotext : StdText{
		idc = -1;
		style = ST_CENTER;
		x = (0.35 * safezoneW + safezoneX);
		w = (0.3 * safezoneW);
		h = (0.03 * safezoneH);
		y = (0.45 * safezoneH + safezoneY);
		colorText[] = {0.9, 0.9, 0.9, 1};
		text = $STR_FOB_REPACKAGE_CONFIRM;
	};

	class BoxButton : StdButton{
		idc = 120;
		x = (0.38 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.55 * safezoneH + safezoneY);
		w = (0.08 * safezoneW) - (BORDERSIZE);
		h = (0.045 * safezoneH);
		sizeEx = 0.023 * safezoneH;
		text = $STR_FOBBOX;
		action = "dorepackage = 1;";
	};
	class TruckButton : StdButton{
		idc = 120;
		x = (0.46 * safezoneW + safezoneX);
		y = (0.55 * safezoneH + safezoneY);
		w = (0.08 * safezoneW) - (BORDERSIZE);
		h = (0.045 * safezoneH);
		sizeEx = 0.023 * safezoneH;
		text = $STR_FOBTRUCK;
		action = "dorepackage = 2;";
	};
	class CancelButton : StdButton{
		idc = 121;
		x = (0.54 * safezoneW + safezoneX) + (BORDERSIZE);
		y = (0.55 * safezoneH + safezoneY);
		w = (0.08 * safezoneW);
		h = (0.045 * safezoneH);
		sizeEx = 0.023 * safezoneH;
		text = $STR_RECYCLING_CANCEL;
		action = "closeDialog 0";
	};

};