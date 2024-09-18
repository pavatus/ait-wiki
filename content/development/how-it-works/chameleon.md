---
title: Chameleon Exterior | How it works
type: docs
---

Introduced in 1.0.6 [Chameleon Exterior](../../../mechanics/tardis/chameleon) is a special exterior possessing a property of turning into a structure inherited from the biome it landed in.

This can be a tree, a desert well, a chorus tree, a cactus & more.

The approach used to make this possible allows it to camouflage even in modded (& datapack) biomes, as well as being fully invisible to people even with F3, WAILA or X-ray mods.

The idea is quite simple: 
1. Don't let the player know there's a TARDIS.
2. Find a structure (configured feature) in the landed biome.
3. Turn a structure into a list of blockstates and their coordinates.

## Step 1
Step 1 is the most interesting part, implemented by a few mixins and the `dev.drtheo.twitter` package.

To send a bulk update of blocks Minecraft sends a delta packet, containing a specially encoded list of block states and their local position in a chunk.

By replicating that it's possible to send fake block data, creating something called ghost blocks.

Since the server knows and expects ghost blocks to appear, it keeps track of them.

Ghost blocks have the property of disappearing when you interact with them, that's because when you interact with a block the server sends a singular block update packet.

Since the server knows which blocks are supposed to be fake, we can cancel that packet.

Voila, you get ghost blocks that dont go away.

If you send the fake delta packet each time the client asks for chunk data, you'll be able to create pretty convincing fake blocks, that exist on the client but do not exist on the server.


## Step 2
Step 2 is quite easy and uses only 2 for-loops to find a random configured feature that suits the requirements.

## Step 3
Now that its possible to create convincing fake blocks and we can get a structure we need to build, all thats left is to tie them up together.

Unfortunately there's no way to just get the positions and the blockstates from a configured feature, since it's more of a blueprint. 

Buuut you can place a structure! Meaning that if you record whatever it tries to place you'll get the positions and states which you can use to create the delta packet.

