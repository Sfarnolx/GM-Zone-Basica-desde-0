//GM echa por Farnolx
//cualquier pregunta o duda contactar a mi discord: farnolx_ 
//gm Zone Roleplay / Montevideo Zone



//sistema de login / register.
public OnGameModeInit() {
    print("Game mode initialized.");
    return 1;
}

public OnPlayserConnect(playerid) {
    print("Player connected: " + playerid);
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Login/Register", "Enter your password:", "Login", "Register");
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    print("Player disconnected: " + playerid);
    PlayerLogged[playerid] = 0;
    return 1;
}

//..

new PlayerLogged[MAX_PLAYERS];
new PlayerPassword[MAX_PLAYERS][129];

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if(dialogid == 1) {
        if(response) {
            if(strlen(PlayerPassword[playerid]) == 0) {
                // Register
                format(PlayerPassword[playerid], sizeof(PlayerPassword[playerid]), "%s", inputtext);
                PlayerLogged[playerid] = 1;
                SendClientMessage(playerid, -1, "You have successfully registered and logged in.");
            } else {
                // Login
                if(strcmp(PlayerPassword[playerid], inputtext, false) == 0) {
                    PlayerLogged[playerid] = 1;
                    SendClientMessage(playerid, -1, "You have successfully logged in.");
                } else {
                    SendClientMessage(playerid, -1, "Incorrect password. Please try again.");
                    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Login/Register", "Enter your password:", "Login", "Register");
                }
            }
        } else {
            Kick(playerid);
        }
    }
    return 1;
}
public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/me", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    } else if (strcmp("/do", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    }
    return 0;
}

public GetPlayerName(playerid) {
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}
// id de armas
new WeaponNames[][] = {
    "colt45", "silenced", "deagle", "shotgun", "sawed-off", "combatshotgun",
    "uzi", "mp5", "ak47", "m4", "tec9", "rifle", "sniper", "rocketlauncher",
    "heatseeker", "flamethrower", "minigun"
};

new WeaponIDs[] = {
    22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38
};

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/me", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    } else if (strcmp("/do", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    } else if (strcmp("/creararma", cmdtext, true, 10) == 0) {
        new weaponName[32], ammo;
        if (sscanf(cmdtext, "s[32]d", weaponName, ammo)) {
            new weaponid = -1;
            for (new i = 0; i < sizeof(WeaponNames); i++) {
                if (strcmp(WeaponNames[i], weaponName, true) == 0) {
                    weaponid = WeaponIDs[i];
                    break;
                }
            }
            if (weaponid != -1) {
                GivePlayerWeapon(playerid, weaponid, ammo);
                new message[128];
                format(message, sizeof(message), "You have created a %s with %d ammo.", weaponName, ammo);
                SendClientMessage(playerid, -1, message);
            } else {
                SendClientMessage(playerid, -1, "Invalid weapon name.");
            }
        } else {
            SendClientMessage(playerid, -1, "Usage: /creararma [weaponname] [ammo]");
        }
        return 1;
    }
    return 0;
}

public GetPlayerName(playerid) {
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}

//referido 
public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/me", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    } else if (strcmp("/do", cmdtext, true, 3) == 0) {
        new message[128];
        format(message, sizeof(message), "* %s %s", GetPlayerName(playerid), cmdtext[4]);
        SendClientMessageToAll(-1, message);
        return 1;
    } else if (strcmp("/creararma", cmdtext, true, 10) == 0) {
        new weaponName[32], ammo;
        if (sscanf(cmdtext, "s[32]d", weaponName, ammo)) {
            new weaponid = -1;
            for (new i = 0; i < sizeof(WeaponNames); i++) {
                if (strcmp(WeaponNames[i], weaponName, true) == 0) {
                    weaponid = WeaponIDs[i];
                    break;
                }
            }
            if (weaponid != -1) {
                GivePlayerWeapon(playerid, weaponid, ammo);
                new message[128];
                format(message, sizeof(message), "You have created a %s with %d ammo.", weaponName, ammo);
                SendClientMessage(playerid, -1, message);
            } else {
                SendClientMessage(playerid, -1, "Invalid weapon name.");
            }
        } else {
            SendClientMessage(playerid, -1, "Usage: /creararma [weaponname] [ammo]");
        }
        return 1;
    } else if (strcmp("/referido", cmdtext, true, 9) == 0) {
        ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "Referido", "Ingresa el código de referido:", "Aceptar", "Cancelar");
        return 1;
    }
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 2) {
        if (response) {
            if (strcmp(inputtext, "farnolx", true) == 0) {
                GivePlayerMoney(playerid, 10000);
                CreateVehicle(462, GetPlayerPosX(playerid), GetPlayerPosY(playerid), GetPlayerPosZ(playerid), 0.0, -1, -1, 100);
                SendClientMessage(playerid, -1, "Has recibido una Faggio y $10,000 por usar el código de referido 'farnolx'.");
            } else {
                SendClientMessage(playerid, -1, "Código de referido incorrecto.");
            }
        }
        return 1;
    }
    return 0;
}

public GetPlayerName(playerid) {
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}

