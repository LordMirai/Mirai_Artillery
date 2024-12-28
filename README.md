# Mirai Artillery

Mirai Artillery is a **Garry's Mod** addon that introduces advanced artillery cannons and the capability to form fully customizable artillery batteries.
This addon aims to enhance the sandbox and combat experience by allowing players to strategically coordinate artillery strikes.

## Author

- **Name:** Lord Mirai (未来)
- **Contact:**
  - Discord: *lordmirai*
  - Email: [For professional inquiries](lordmiraithegod@gmail.com)
  - Youtube: [Lord Mirai](https://www.youtube.com/@LordMirai)
- **Website:** [GitHub](https://www.github.com/LordMirai)

---

## <span style="color: red;">WARNING! THESE INITIAL SPECIFICATIONS ARE CONSIDERED IDEAL AND MAY NOT REFLECT THE FINAL PRODUCT.</span>

## Features

### 1. Artillery Cannons

- A variety of artillery cannons with unique stats:
  - **Caliber:** Determines explosive power and range.
  - **Reload Time:** Affects the time between shots.
  - **Accuracy:** Determines the spread of artillery shells.
  - **Maximum Distance:** The furthest distance the cannon can fire.
  - **Health:** Cannons can be destroyed by enemy fire.
  - **Maximum Horizontal and Vertical Angles:** Limits the cannon's firing arc.

- Cannons can be spawned via the spawn menu and placed anywhere on the map.
- Fully interactive controls for aiming and firing.
- Visual effects, including:
  - Muzzle flash when firing.
  - Smoke trails for shells.
  - Ground explosion effects.
- Cannons may be fired manually without a battery configuration.

### 2. Artillery Batteries

- Ability to group cannons into batteries for synchronized operations.
- **Battery Customization:**
  - Set the number of cannons in the battery.
  - Define the firing order:
    - Sequential: One cannon fires after the other.
    - Simultaneous: All cannons fire together.
    - Randomized: Cannons fire in a random sequence.
  - Adjust the delay between shots for sequential firing.
  - Each cannon may have unique settings within the battery.

### 3. Targeting System

- **Manual Mode:**
  - Players manually aim and fire cannons using a crosshair or iron sights.
- **Automated Mode:**
  - Mark a target location on the map using a laser designator or coordinates.
  - Cannons automatically adjust their aim and fire at the marked location.

### 4. Ammunition Types

- Standard High-Explosive (HE) shells.
- Smoke shells for tactical cover.
- Incendiary shells for area denial.
- Cluster munitions for maximum area impact.
- Tracer/Training rounds for target marking.

### 5. Multiplayer Support

- Batteries can be operated by multiple players.
- Permission settings for controlling artillery access.

---

## User Interface (UI)

### Spawn Menu

- Accessible through the **Q menu** under the "Mirai Artillery" category in Entities.
- Displays a list of available artillery cannons and shells.

### Battery Management Panel

- A dedicated UI for configuring batteries:
  - Add or remove cannons.
  - Set firing orders and delays.
  - Test fire sequence.

### Targeting UI

- Interactive map overlay for selecting target zones.
- Laser pointer for manual targeting.

---

## Installation

1. Download the addon from the GitHub repository.
2. Extract the contents into your `addons` folder if downloading manually.
3. Launch Garry's Mod and ensure the addon is enabled in the Addons menu.

---

## Configuration Options

- **Config File:** Stored in `/lua/mirai_artillery/sh_config.lua`.
- Editable settings include:
  - Default cannon stats.
  - Maximum number of cannons per battery.
  - Friendly fire toggles.
  - Shell damage and blast radius multipliers.

---

## License

This addon is licensed under the Creative Commons Attribution-ShareAlike (CC BY-SA) license.
You are free to use, modify, and distribute this addon as long as you credit the author and share any derivative works under the same license.

### Additional Workshop Addons

[Models - CoD WaW Artillery pack (and its dependencies)](https://steamcommunity.com/sharedfiles/filedetails/?id=2471952707)
