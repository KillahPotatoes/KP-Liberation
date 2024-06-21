////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by UNITnormal, v1.063, #Vurive)
////////////////////////////////////////////////////////
//missionConfigFile >> "VAM_GUI"
class VAM_GUI
{
	idd = 4900;
	OnLoad = "[] spawn fnc_VAM_GUI_check;";
	OnUnload = "[] spawn fnc_VAM_variable_cleaner;";
	movingEnable = false;
	controls[] = {"VAM_BG", "VAM_Title", "VAM_Text_Camo" ,"VAM_Text_Comp", "VAM_Confirm", "VAM_Reset", "VAM_List_Camo", "VAM_List_Comp", "VAM_Current_Vehicle_1", "VAM_Current_Vehicle_2"};
	objects[] = {};

	class VAM_BG: VAM_IGUIBack
	{
		idc = -1;
		x = 0.329375 * safezoneW + safezoneX;
		y = 0.318 * safezoneH + safezoneY;
		w = 0.34125 * safezoneW;
		h = 0.392 * safezoneH;
	};
	class VAM_Title: VAM_RscText
	{
		idc = -1;
		text = $STR_VAM_MAIN_MENU_NAME;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_Text_Camo: VAM_RscText
	{
		idc = -1;
		text = $STR_VAM_CAMOUFLAGE;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.374 * safezoneH + safezoneY;
		w = 0.065625 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_Text_Comp: VAM_RscText
	{
		idc = -1;
		text = $STR_VAM_COMPONENT;
		x = 0.506562 * safezoneW + safezoneX;
		y = 0.374 * safezoneH + safezoneY;
		w = 0.065625 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_Confirm: VAM_RscButton
	{
		idc = 4930;
		text = $STR_VAM_CONFIRM_MENU;
		action = "closeDialog 0;";
		x = 0.611562 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_List_Camo: VAM_RscListbox
	{
		idc = 4910;
		style = LB_TEXTURES;
		sizeEx = 0.035;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
	};
	class VAM_List_Comp: VAM_RscListbox
	{
		idc = 4920;
		style = LB_TEXTURES + LB_MULTI;
		sizeEx = 0.035;
		x = 0.506562 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
	};
	class VAM_Reset: VAM_RscButton
	{
		idc = 4940;
		text = $STR_VAM_RESET_VEHICLE;
		OnButtonClick = "[] spawn fnc_VAM_reset;";
		x = 0.559062 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_Current_Vehicle_1: VAM_RscText
	{
		idc = -1;
		text = $STR_VAM_CURRENT_VEHICLE;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.091875 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class VAM_Current_Vehicle_2: VAM_RscText
	{
		idc = 4950;
		sizeEx = 0.03;
		text = "<Placeholder>";
		x = 0.427812 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.124687 * safezoneW;
		h = 0.028 * safezoneH;
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////