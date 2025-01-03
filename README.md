# SA-MP Server Project

## Overview
This project is a basic structure for a SA-MP (San Andreas Multiplayer) server using Pawno programming. It includes essential files for game mode, filterscripts, includes, and configuration.

## Project Structure
```
samp-server
├── gamemodes
│   └── mygamemode.pwn
├── filterscripts
│   └── example.pwn
├── includes
│   └── example.inc
├── pawno
│   └── pawno.exe
├── scriptfiles
│   └── example.txt
├── server.cfg
└── README.md
```

## Files Description

- **gamemodes/mygamemode.pwn**: Main game mode script that initializes the server, manages players, and contains game logic.
  
- **filterscripts/example.pwn**: Filter script for additional functionalities like custom commands or events without altering the main game mode.
  
- **includes/example.inc**: Include file for reusable functions, constants, or variables shared across multiple scripts.
  
- **pawno/pawno.exe**: Pawno compiler executable for compiling .pwn files into .amx files for the server.
  
- **scriptfiles/example.txt**: Data or configuration settings file for runtime access by the server or scripts.
  
- **server.cfg**: Configuration settings for the SA-MP server, including server name, max players, and other parameters.

## Setup Instructions
1. Ensure you have the SA-MP server files and Pawno compiler.
2. Place the project files in the appropriate directories as outlined in the project structure.
3. Compile the .pwn files using the Pawno compiler.
4. Configure the `server.cfg` file to your preferences.
5. Start the SA-MP server and connect to it using the SA-MP client.

## Features
- Customizable game mode and filter scripts.
- Reusable functions through include files.
- Easy configuration via the server.cfg file.

## Contribution
Feel free to modify and expand upon this project to suit your needs. Contributions are welcome!
