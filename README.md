# jx-fps

Simple FPS boost menu for FiveM, powered by [ox_lib](https://github.com/overextended/ox_lib).  
Open the menu with `/fps`. Choose between **High**, **Med**, **Low** or **Reset**.  
Your selected mode is **automatically saved** (local cache) and restored every time you connect – right after your character loads.  
Click **Reset** to wipe the saved mode and return to default graphics & weather.

## Installation
- Make sure `ox_lib` is installed and running on your server.
- Copy the `jx-fps` folder into your server's `resources` directory.
- Add `ensure jx-fps` to your `server.cfg`.

## Configuration
All settings are in `config.lua`:
- `Config.Locale` – `'en'` (English) or `'fr'` (French). Default: `'en'`.
- `Config.Framework` – `'auto'` (QBCore/QBox + ESX), `'qb'` (QBCore/QBox only), `'esx'` (ESX only), or `'none'` (no auto‑restore). Default: `'auto'`.

## Compatibility
- QBCore
- QBox
- ESX

The script listens to `QBCore:Client:OnPlayerLoaded` and `esx:playerLoaded` to know exactly when to restore your mode. No other configuration needed.

## Credits
- Original concept by **Egypt Studio & KH Dev Team**.
- Completely recreated from scratch with ox_lib by **JamX Scripts**, adding local KVP persistence, multi‑framework auto‑restore, and the rain/wind fix that was missing in the original.
- *Fait par un Québécois ⚜️ avec ❤️*  
  — JamX

## License
This project is licensed under the GNU General Public License v3.0.  
You can find the full license text in the [LICENSE](LICENSE) file.

## Community
Got a question, an idea, or just want to chat?  
Join the **JamX Scripts** Discord: https://discord.gg/xqP5GXupUT

- #FR‑français
- #EN‑english

*The server is brand new – thanks for your patience while we build it!*