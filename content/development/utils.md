---
title: Utils
type: docs
---

AIT provides and uses a lot of utility classes and methods. Here are some of them.

# Core Utils
Core utilities are common side utility classes which can be used on both client and server.

### `Scheduler`
Allows you to schedule tasks. Tasks do not persist between restarts.

### `ForcedChunkUntil`
Allows you to continuously force load a chunk.

### `ServerLifecycleHooks`
Allows you to get the `MinecraftServer` instance.

### `ShapeUtil`
Allows you to rotate a `VoxelShape`.

### `StackUtil`
Allows you to spawn items in a world, save items and item stacks to NBT, play break sounds & more.

### `TextUtil`
Used to get interactive shortened TARDIS id, translations for world names.

### `WorldUtil`
Allows you to get all not blacklisted worlds, where a TARDIS can travel to, as well as the overworld, tardis and time vortex worlds.

Allows to find save landing positions for a TARDIS.

## TARDIS
TARDIS utils are utility classes closely related to TARDIS code.

### `TardisUtil`
The behemoth of utility classes. Allows to find an interior spot, a list of all entities/players in a TARDIS, methods to teleport in and out of a TARDIS.

Allows to find a TARDIS by interior coordinates, give an effect/send a message to all players inside.

### `AsyncLocatorUtil`
Used to find structures asynchronously.

### `DesktopGenerator`
An utility class that can be instantiated. Used to clear an area for a desktop, as well as place it.

### `NetworkUtil`
Allows to easily send a packet to all players inside a TARDIS/all linked players.

Can find all tracked players and sens NBT packets.

# Client
Client utils are usually used for rendering purposes or handling client-side cache.

### `AngleInterpolator`
An utility class that can be instantiated. Used to interpolate angle/rotation for the [Rift Locator](../items/rift-locator).

### `ClientItemUtil`
Allows to render baked models without an item stack.

### `ClientLightUtil`
Allows to render compatible with shader mods emissives on block entities.

### `ClientShakeUtil`
Allows to shake player's screen.

### `ClientTardisUtil`
Allows to check if the player is inside a TARDIS, if so, allows to get that TARDIS' `ClientTardis` instance efficiently.

Use this to get the `ClientTardis`, in which the player is located in. Will be `null` if the player is not in a TARDIS.

> Tech note: instead of searching for the  TARDIS instance each frame it will do it once per tick if conditions are met.

### `FoggyUtils`
Do not call. Renders the custom fogs. Do not call. If you want to add your own fog for a condition - mixin into it.

### `ShaderUtils`
Do not call. Used internally to change game rendering.

### `SkyboxUtil`
Do not call. Used to render the TARDIS sky in the world. 
