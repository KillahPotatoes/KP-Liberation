class liberation_recycle {
	idd = 5751;
	movingEnable = false;
	controlsBackground[] = { "OuterBG", "RecycleBG", "OuterBG_F", "InnerBG", "InnerBG_F" };
	controls[] = { "Header", "ButtonClose",
		"ManpowerImageShadow","AmmoImageShadow","FuelImageShadow",
		"ManpowerImage","AmmoImage","FuelImage",
		"Infotext","LabelManpower","LabelAmmo","LabelFuel",
		"RecycleButton","CancelButton"
	};
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
		text = $STR_RECYCLING;
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
	class IconImage {
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {1, 1, 1, 1}; 
        colorBackground[] = {0, 0, 0, 1}; 
		font = FontM;
		sizeEx = 0.023;
		y = (0.5 * safezoneH + safezoneY);
		w = (0.015 * safezoneW);  
		h = (0.025 * safezoneH);
		moving = false;
	};
	class ManpowerImage : IconImage {
		idc = 1085;
		x = (0.42 * safezoneW + safezoneX);
		text = "res\ui_manpo.paa";
	};
	class AmmoImage : IconImage {
		idc = 1085;
		x = (0.48 * safezoneW + safezoneX);
		text = "res\ui_ammo.paa";
	};
	class FuelImage : IconImage {
		idc = 1085;
		x = (0.54 * safezoneW + safezoneX);
		text = "res\ui_fuel.paa";
	};
	class ManpowerImageShadow : IconImage {
		idc = 1085;
		x = (0.42 * safezoneW + safezoneX)  + 0.003;
		text = "res\ui_manpo.paa";
		colorText[] = {0, 0, 0, 1}; 
		y = (0.5 * safezoneH + safezoneY) + 0.005;
	};
	class AmmoImageShadow : IconImage {
		idc = 1085;
		x = (0.48 * safezoneW + safezoneX) + 0.003;
		text = "res\ui_ammo.paa";
		colorText[] = {0, 0, 0, 1}; 
		y = (0.5 * safezoneH + safezoneY) + 0.005;
	};
	class FuelImageShadow : IconImage {
		idc = 1085;
		x = (0.54 * safezoneW + safezoneX)  + 0.003;
		text = "res\ui_fuel.paa";
		colorText[] = {0, 0, 0, 1}; 
		y = (0.5 * safezoneH + safezoneY) + 0.005;
	};
	class Infotext : StdText{
		idc = 134;
		style = ST_CENTER;
		x = (0.35 * safezoneW + safezoneX);
		w = (0.3 * safezoneW);  
		h = (0.03 * safezoneH);	
		y = (0.45 * safezoneH + safezoneY);
		colorText[] = {0.9, 0.9, 0.9, 1};
	};
	class LabelNumber : StdText{
		y = (0.5 * safezoneH + safezoneY) - (0.5 * BORDERSIZE);
		w = (0.1 * safezoneW);  
		h = (0.03 * safezoneH);	
		sizeEx = 0.03 * safezoneH;
	};
	class LabelManpower : LabelNumber{
		idc = 131;
		x = (0.44 * safezoneW + safezoneX) - BORDERSIZE;
		colorText[] = {0, 0.75, 0, 1};
	};
	class LabelAmmo : LabelNumber{
		idc = 132;
		x = (0.5 * safezoneW + safezoneX) - BORDERSIZE;
		colorText[] = {0.75, 0, 0, 1};
	};
	class LabelFuel : LabelNumber{
		idc = 133;
		x = (0.56 * safezoneW + safezoneX) - BORDERSIZE;
		colorText[] = {0.75, 0.75, 0, 1};
	};
	class RecycleButton : StdButton{
		idc = 120;
		x = (0.4 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.55 * safezoneH + safezoneY);
		w = (0.1 * safezoneW) - (BORDERSIZE);  
		h = (0.045 * safezoneH);		
		sizeEx = 0.025 * safezoneH;
		text = $STR_RECYCLING_PROCEED;
		action = "dorecycle = 1;";
	};
	class CancelButton : StdButton{
		idc = 121;
		x = (0.5 * safezoneW + safezoneX) + (BORDERSIZE);
		y = (0.55 * safezoneH + safezoneY);
		w = (0.1 * safezoneW);  
		h = (0.045 * safezoneH);		
		sizeEx = 0.025 * safezoneH;
		text = $STR_RECYCLING_CANCEL;
		action = "closeDialog 0";
	};
	
};