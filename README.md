
# 🧾 Redey Customs Inspection (FiveM ESX)

This script allows players in the ESX framework to fill out and save a **customs inspection report** as an inventory **item** using `ox_inventory`. The completed form is also sent to a selected Discord channel via webhook.

---

## ✅ Features

* 📝 Fill out the inspection form using `lib.inputDialog`
* 🎒 Save the completed form as the `cskontrola` item in the inventory
* 📤 Send the submitted data to Discord as an embed message
* ♻️ Ability to reopen and view previously filled inspection reports

---

## 📦 Requirements

* [`ox_inventory`](https://github.com/overextended/ox_inventory)
* [`ox_lib`](https://github.com/overextended/ox_lib)
* [`es_extended` v1.9+](https://github.com/esx-framework/es_extended)
* `server.cfg` must include `ensure ox_lib` and `ensure ox_inventory` before this script

---

## ⚙️ Installation

1. **Add the script to resources:**
   Copy the folder `redey_cskontrola` into `resources/[local]/`

2. **Make sure the order in `server.cfg` is correct:**

   ```cfg
   ensure ox_lib
   ensure ox_inventory
   ensure es_extended
   ensure redey_cskontrola
   ```

3. **Register the item in `ox_inventory/data/items.lua`:**

   ```lua
   ["cskontrola"] = {
       label = "Inspection Report",
       weight = 100,
       stack = false,
       client = {
           export = "redey_cskontrola.useItem"
       }
   },
   ```

4. **Set up the Discord webhook:**
   In the file `server/main.lua`, update the webhook URL line:

   ```lua
   local webhookURL = 'https://discord.com/api/webhooks/YOUR_WEBHOOK'
   ```

---

## 🧪 Usage

* Add the `cskontrola` item to your inventory in-game via `ox_inventory`
* Use it (e.g., by pressing F2)
* Fill out and submit the report form
* Done!
  The item updates with a description and the message is sent to Discord

---

## ✍️ Author

Redey – \[Redey Scripts]

