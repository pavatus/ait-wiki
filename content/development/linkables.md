---
title: Linkables
next: components
type: docs
--

Linkables are elements of the game which have the ability to be linked to a TARDIS.

Those can be items, blocks, entities (& more if you implement it yourself).

# Items
To make your item linkable just extend the `LinkableItem` class.

# Blocks 
Since blocks cannot contain NBT data on their own, it is impossible to save the TARDIS id the block belongs to in the block itself.

Therefore, this only works if your block has a block entity.

Make your block entity class extend the `LinkableBlockEntity` class.

The base `LinkableBlockEntity` class will not link on it's own, to forcefully link it use one of the `#link` method it provides.

To make it easier, we've also made an `InteriorLinkableBlockEntity` which will automatically link to the interior it gets placed in.