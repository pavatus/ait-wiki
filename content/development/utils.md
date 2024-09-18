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

Allows to find save landing positions for a TARDIS
