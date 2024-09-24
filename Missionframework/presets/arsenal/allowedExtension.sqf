/*
    File: allowedExtension.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-05-11
    Last Update: 2020-05-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        List of classnames which will be always added to the allowed gear list.
        This is used to add let's name it "generic classnames".

        E.g. if you've an available weapon "myMod_weap_M16" and an available grip "myMod_acc_coolGrip"
        some mods transform this combination to a weapon "myMod_weap_M16_coolGrip".
        That classname is used internally and wouldn't be listed in the arsenal and can cause issues to be
        detected as not allowed weapon, even if the weapon and the grip is whitelisted.
        So add this "generic classname" here afterwards to avoid this.

        The classnames of blacklisted items on a player are logged in the server rpt for a later lookup.
*/

// Extension list of allowed arsenal gear
KPLIB_arsenalAllowedExtension = [
    "ACE_ReserveParachute",
    "ItemRadioAcreFlagged"
];
