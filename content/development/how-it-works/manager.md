---
title: TARDIS Manager | How it works
type: docs
---

TARDIS Manager (TM) is a very important part of the TARDIS code. It makes sure that the TARDIS data stays synched between the server and the client.

There are 2 TM implementations: `ClientTardisManager` (CTM) and `ServerTardisManager` (STM).

#### Before 1.0.5 the usual workflow would go like this:
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


#### In 1.0.5 everything is a bit less convoluted:
1. The world gets loaded.
2. STM finds and loads all of saved TARDIS'.
3.1. Client joins.
OR
3.2. Client loads a linked element (e.g. exterior).


4. Server tries to send the data packet for a linkable.
5. STM detects that and sends a `SEND` packet to the player with full TARDIS data.

Updated TARDIS' get put in a buffer inside STM, which will iterate through it and clean it each tick, sending a full update to players inside the TARDIS and tracked players (e.g. who have the exterior chunk loaded).