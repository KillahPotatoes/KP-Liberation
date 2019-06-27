/*
    This file handles the mission end.
    It contains everything which is needed the clearly end the mission, reward pay or penaltys etc.

    Example content:
    - Check the mission state (finished or failed)
    - Unit deletion
    - Marker deletion
    - Task deletion
*/

// Execute the end function via server event
// Replace "Your mission name" with the registered name of your mission to ensure that the mission will be deleted from the running misisons clearly
["KPLIB_missionEnd", ["Your mission name"]] call CBA_fnc_serverEvent;
