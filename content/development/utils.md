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
