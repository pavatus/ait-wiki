---
title: TARDIS Manager | How it works
type: docs
---

TARDIS Manager (TM) is a very important part of the TARDIS code. It makes sure that the TARDIS data stays synched between the server and the client.

There are 2 TM implementations: `ClientTardisManager` (CTM) and `ServerTardisManager` (STM).

#### <1.0.5
1. The world gets loaded.
2. STM finds and loads all of the saved TARDIS'.
3.1. Client joins.
OR
3.2. Client loads a linked element (e.g. exterior).


4. Client gets references to a TARDIS it doesn't know, and puts all the lambdas that want the TARDIS instance on wait.
5. CTM sends an `ASK` packet for a specified TARDIS UUID.
6. STM receives the `ASK` packet.
7. STM serializes the TARDIS asked into a json string and sends a `SEND` packet.
8. CTM receives the `SEND` packet.
9. CTM deserializes the json string, puts it into a map as cache.
10. CTM gets all of the lambdas it put on-hold and gives them the TARDIS instance.

Then each minute or two STM would fully re-send the TARDIS data.

STM also has methods to send partial data, in which case the `UPDATE` (for updating components) and `UPDATE_PROPERTY` (for updating properties) packets were used.

> How it failed: a singular TARDIS could produce multiple update packets per tick. Sending full TARDIS data every few minutes was a hack.


#### 1.0.5:
1. The world gets loaded.
2. STM finds and loads all of the saved TARDIS'.
3.1. Client joins.
OR
3.2. Client loads a linked element (e.g. exterior).


4. Server tries to send the data packet for a linkable.
5.1. STM detects that and sends a `SEND` packet to the player with full TARDIS data.
5.2. If there was more than a specified amount of TARDIS' in a single chunk, instead of sending each packet individually it'd send a singular `SEND_BULK` packet instead.


Updated TARDIS' get put in a buffer inside STM, which will iterate through it and clean it each tick, sending a full update to players inside the TARDIS and tracked players (e.g. who have the exterior chunk loaded).

This version had no partial updates implemented serverside.

> Why it failed: no partial updates meant that there was much more serialization going on than needed.

> How it improved: no more `ASK` packet, server defined what to send and what not. One packet per tick made sure there was as less of packet spam as possible.

#### 1.0.6+
1. The world gets loaded.
2. STM finds and loads all of the saved TARDIS'.
3.1. Client starts tracking a chunk with a linkable.
4. Server tries to send the data packet for a linkable.
5.1. STM detects that and sends a `SEND` packet to the player with full TARDIS data.
5.2. If there was more than a specified amount of TARDIS' in a single chunk, instead of sending each packet individually it'd send a singular `SEND_BULK` packet instead.


Updated TARDIS' get put in a buffer inside STM, which will iterate through it and clean it each tick. A `ServerTardis` has a delta buffer, which contains all of the elements (components & properties) marked for update. When iterating, STM sends an update packet for the delta, cleaning the delta queue.

Partial updates became possible once again. Because the STM knows the difference between a player loading a chunk and a player staying in a chunk, it can send a full packet to a player who just loaded the chunk and a partial update to a player who tracked the chunk.

> How it improved: partial updates.

> How it failed: multiple packets per TARDIS update are back. Property deltas update their holder component instead of just the property.

#### Future?
In future the following optimisations may be applies:
1. Lazy TARDIS loading. Why load every single TARDIS file if they might not even get used?
2. Delta packets. Send a bulk update packet, which contains data to update both components and properties on the client.
3. Property deltas. The current implementation just adds the property's holder component to the delta list.