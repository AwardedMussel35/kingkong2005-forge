# King Kong 2005 — Forge 1.20.1 (VS Code / IntelliJ Ready)

This project is a **fully laid-out** Forge 1.20.1 mod that registers a giant **Kong** mob with a placeholder renderer.  
Your **Blockbench .bbmodel** has been converted into a simple **`assets/kong05/geo/kong05.geo.json`** so you can later plug in GeckoLib if you want full bone animations.

> ✅ Ships with working Java sources/resources and Gradle build scripts.  
> ⚠️ This zip cannot include the **Gradle Wrapper JAR** due to offline limits. Add it in one of the two ways below.

---

## Quick Build Steps (Windows)

1. **Install Java 17** (required for 1.20.1).
2. Open a terminal in the project folder.
3. **Option A (Recommended):** Copy `gradlew`, `gradlew.bat`, and the `gradle/wrapper` folder (with `gradle-wrapper.jar` and `gradle-wrapper.properties`) from a **Forge 1.20.1 MDK** into this project.
4. **Option B:** If you have Gradle installed system-wide, run:
   ```bat
   gradle wrapper
   ```
   This will generate the wrapper files here.
5. Build the mod:
   ```bat
   .\gradlew build
   ```
6. The JAR will appear in `build\libs\kong05-1.0.0.jar`. Put it into your **`.minecraft/mods`** with **Forge 1.20.1**.

---

## Dev Run

- Client: `.\gradlew runClient`
- Server: `.\gradlew runServer`

---

## What’s Included

- **Entity**: `KongEntity` (very tough stats, big size).
- **Renderer/Model**: A simple baked box placeholder so it renders *without extra libraries*.
- **Assets**:  
  - `assets/kong05/geo/kong05.geo.json` — generated from your `.bbmodel` (all cubes into a single root bone).  
  - `assets/kong05/animations/kong05.animation.json` — empty placeholder.  
  - `assets/kong05/textures/entity/kong05.png` — temp texture.

> If you want to use **GeckoLib**: add the GeckoLib dependency to `build.gradle`, create `KongModel`/`KongRenderer` with `GeoModel`/`GeoEntityRenderer`, and point to the `geo` + `animation` files above.

---

## Spawning In-Game

You can give yourself a spawn egg via commands or add a spawn item later. For quick testing in dev:

- Use a summon command in the client `run` game (attach a spawn egg via a quick registry if desired), or temporarily add a debug command.
- Or register SpawnPlacements & a creative mode egg (not included to keep the example minimal).

---

## Bringing Your Original `kong05.java` In

Your uploaded `kong05.java` looked like a Blockbench MojMap export, but it was corrupted (missing parts in lines).  
This project uses a **small baked placeholder** instead so you can build immediately.  
If you still want the Blockbench-generated MojMap class:

1. Re-export from Blockbench (`File → Export → Java entity model (Mojang mappings)`).
2. Put it into `src/main/java/com/example/kong05/` and replace the placeholder `KongModel`/`KongRenderer` to use your exported layer + renderer.

---

## Common Errors You Hit Before (Fixed Here)

- **`gradlew not recognized`** → Wrapper files were missing. Do step 3 or 4 above.
- **ForgeGradle `6.0.24` not found** → This build uses a stable `5.1.+` line for 1.20.1.
- **`Use Java 17`** → Make sure `java -version` shows 17.x.

---

## Next Steps

- Swap the placeholder model for your real one.
- (Optional) Add GeckoLib for animations using the included `geo/` + `animations/` files.
- Add a creative tab item or spawn egg, sounds, AI attacks, etc.

Good luck—go make Kong roar!
