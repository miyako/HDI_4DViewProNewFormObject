# HDI_4DViewProNewFormObject

A 4D **HDI** (How Do I) example demonstrating the **4D View Pro** spreadsheet area as a form object — creating a new spreadsheet, opening/saving `.4vp` documents on disk, loading bundled example workbooks, and persisting a workbook inside a database record instead of a file.

## Overview

The demo form (`HDI2`) has two `4D View Pro` view areas on separate tabs. **Demo 1** shows the "disk document" workflow: `ViewProArea` loads a bundled sample workbook on `On VP Ready`, and buttons let you create a blank workbook (`VP NEW DOCUMENT`), open any `.4vp` file (`VP IMPORT DOCUMENT`), save the current sheet to a chosen path (`VP EXPORT DOCUMENT`), or reload one of two bundled examples. **Demo 2** shows the "database document" workflow: `ViewProArea1` loads a workbook stored as an object-field attribute on a `VPWorkBooks` record (`VP IMPORT FROM OBJECT`), and a **Save** button writes the current sheet back into that same record (`VP Export to object`) — so the spreadsheet round-trips through the database instead of the filesystem. A third tab shows a localized information blurb read from the `Informations` table.

## Features

- **New / Open / Save As on disk** — `Button`, `Button1`, `Button2` wrap `VP NEW DOCUMENT`, `VP EXPORT DOCUMENT`, and `VP IMPORT DOCUMENT` around a standard `Select document` file picker restricted to `.4vp` files.
- **Bundled example workbooks** — `Button3`/`Button4` reload `sales.4vp`/`temperatures.4vp` from the resources folder (`Get 4D folder(Current resources folder)`) with `VP IMPORT DOCUMENT`; `ViewProArea`'s `On VP Ready` event loads `sales.4vp` automatically the first time the area is ready.
- **Workbook stored in a database record** — `Button5`/`Button6` and `ViewProArea1`'s `On VP Ready` event use `VP Export to object`/`VP IMPORT FROM OBJECT` to read and write a `4D View Pro` workbook as the `WorkBook` object-field attribute of a single `VPWorkBooks` record, instead of a file on disk.
- **Modern startup flow** — the splash screen (`00_Start`) uses `CALL WORKER`, a non-blocking `DIALOG(...;*)`, and window-reuse detection instead of spawning a new process or blocking on a modal dialog.
- **XLIFF localisation** — all user-facing menu, form, and message strings are externalised to `Resources/{lang}.lproj/*.xlf` (English and Japanese), grouped by purpose (menus, per-form, table forms, messages).
- **Dark mode & Liquid Glass** — `styleSheets.css` uses `"automatic"` colour values so text/controls adapt to light/dark mode; `styleSheets_mac.css` sizes buttons correctly for macOS Tahoe's Liquid Glass appearance as well as classic rendering.
- **Modern method declarations** — all methods use `#DECLARE`/`var` typing instead of legacy `C_*` directives, with subroutines and form-dependent methods marked `invisible` so only real entry points show up in the Run Method dialog.

## Points of Interest

| File | Why it's worth reading |
|------|-------------------------|
| `Project/Sources/Forms/HDI2/ObjectMethods/Button5.4dm`, `Button6.4dm` | The database-backed workbook pattern: `VP Export to object`/`VP IMPORT FROM OBJECT` against a record's object field, the alternative to file-based `VP EXPORT DOCUMENT`/`VP IMPORT DOCUMENT`. |
| `Project/Sources/Forms/HDI2/ObjectMethods/ViewProArea.4dm`, `ViewProArea1.4dm` | `On VP Ready` used to auto-load a workbook (from disk or from a record) as soon as each view area is ready to receive one. |
| `Project/Sources/Forms/HDI2/ObjectMethods/Button1.4dm`, `Button2.4dm` | `Select document` combined with `VP EXPORT DOCUMENT`/`VP IMPORT DOCUMENT` for a standard save-as/open file dialog restricted to `.4vp`. |
| `Project/Sources/Methods/00_Start.4dm` | The splash/startup pattern: worker dispatch, window reuse, non-blocking dialog. |
| `Project/Sources/Forms/HDI/method.4dm` | The version/license gate (`Is license available(4D View license)`) that disables the demo and swaps in a "Close" button when no valid 4D View Pro license is present — preserved as-is since it's the actual subject of the demo, not incidental legacy code. |
| `Project/Sources/styleSheets.css`, `styleSheets_mac.css` | Dark mode and Liquid Glass adaptation via colour-scheme/form-theme media queries. |
| `Resources/*.lproj/*.xlf` | XLIFF localisation structure (menus, per-form, table forms, messages), in English and Japanese. |

## Requirements

4D 21 or later (project mode, `.4DProject`), with a valid 4D View / 4D View Pro license — checked at startup via `Is license available` and enforced by the splash screen.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R4. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (syntax, localisation, dark mode) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/4d-view-pro-spreadsheet-is-there/
- **Original download:** https://download.4d.com/Demos/4D_v16_R4/HDI_4DViewProNewFormObject.zip

## References

- `VP NEW DOCUMENT`: https://developer.4d.com/docs/commands/vp-new-document
- `VP EXPORT DOCUMENT` / `VP IMPORT DOCUMENT`: https://developer.4d.com/docs/commands/vp-export-document / https://developer.4d.com/docs/commands/vp-import-document
- `VP Export to object` / `VP IMPORT FROM OBJECT`: https://developer.4d.com/docs/commands/vp-export-to-object / https://developer.4d.com/docs/commands/vp-import-from-object
- 4D View Pro overview: https://developer.4d.com/docs/ViewPro/viewProInterface
- CSS in 4D (dark mode, Liquid Glass): https://developer.4d.com/docs/FormEditor/stylesheets
- XLIFF localisation: https://developer.4d.com/docs/Notions/localization
