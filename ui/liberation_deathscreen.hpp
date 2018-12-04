class blackscreen
{

  idd = 5651;
  movingEnable = false;
  controls[]=
  {
	"OuterBackground", "Skull", "GREUH_WoundedLabel"
  };
  class OuterBackground {
	idc = -1;
	type =  CT_STATIC; 
	style = ST_LEFT;
	colorText[] = COLOR_BLACK;
	colorBackground[] = COLOR_BLACK;
	font = FontM; 
	sizeEx = 0.023;
	x = -3; y = -3;
	w = 9;  h = 9;
	text = "";
  };
  class Skull {
		idc = 666;
		type =  CT_STATIC ; 
		style = ST_PICTURE;  
		colorText[] = { 1,1,1,0.15 };
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;  
		sizeEx = 0.1 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.6 * safezoneH;
		text = "res\skull.paa";
	  };
   class GREUH_WoundedLabel {
	idc = 4867;
	type =  CT_STATIC; 
	style = ST_CENTER;  
	colorText[] = COLOR_WHITE;
	colorBackground[] = COLOR_NOALPHA;
	font = FontM; 
	sizeEx = 0.07 * safezoneH;
	shadow = 1;
	x = 0.3 * safezoneW + safezoneX; y= 0.25 * safezoneH + safezoneY;
	w = 0.4 * safezoneW; h = 0.07 * safezoneH;
	text = $STR_REVIVE_LABEL;
  };
};