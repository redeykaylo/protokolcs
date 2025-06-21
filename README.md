# 🧾 Redey Celní Kontrola (FiveM ESX)

Tento script umožňuje hráčům v ESX frameworku vyplnit a uložit **protokol o celní kontrole** jako předmět (`item`) v inventáři pomocí `ox_inventory`. Vyplněný formulář se zároveň odešle do vybraného Discord kanálu pomocí webhooku.

---

## ✅ Funkce

- 📝 Vyplnění formuláře kontroly přes `lib.inputDialog`
- 🎒 Uložení vyplněného formuláře jako item `cskontrola` do inventáře
- 📤 Odeslání vyplněných údajů na Discord jako embed zpráva
- ♻️ Možnost opětovného otevření a zobrazení dříve vyplněného protokolu

---

## 📦 Požadavky

- [`ox_inventory`](https://github.com/overextended/ox_inventory)
- [`ox_lib`](https://github.com/overextended/ox_lib)
- [`es_extended` v1.9+](https://github.com/esx-framework/es_extended)
- `server.cfg` musí mít `ensure ox_lib` a `ensure ox_inventory` před tímto scriptem

---

## ⚙️ Instalace

1. **Vlož script do resources:**  
   Nakopíruj složku `redey_cskontrola` do `resources/[local]/`

2. **Zajisti správné pořadí v `server.cfg`:**
   ```cfg
   ensure ox_lib
   ensure ox_inventory
   ensure es_extended
   ensure redey_cskontrola
