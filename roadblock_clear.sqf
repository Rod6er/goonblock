// if (!isServer) exitWith{};

RBD_CLEAR = 1;
publicVariable "RBD_CLEAR";

sleep 3;

RBD_CLEAR = 0;
publicVariable "RBD_CLEAR";

if (true) exitWith{};