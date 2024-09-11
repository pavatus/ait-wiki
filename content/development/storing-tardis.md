---
title: Storing the TARDIS
type: docs
---

Querying the TARDIS from a `TardisManager` each time even though the id doesn't change is highly irresponsible.

Therefore, if the TARDIS you query doesn't change (as in, you're asking for the TARDIS with the same id) it's better to cache it in a field. 

⚠️***Warning:*** _never_ cache the component. Component getters are extremely fast and have practically no overhead.

But caching the TARDIS in a field only works if the code that reads, caches and uses the cached TARDIS is executed purely server-side.

The reason for that is when the condition is met, the server will send a full data packet, forcing the client to overwrite it's entry.

Storing a TARDIS instance on client-side might lead to a memory leak, unexpected behaviour and a de-sync.

To fix this, in 1.0.5+ `TardisRef`s were introduced.

`TardisRef` are like linkables, but can't store the data on their own. They have a `#get` method to get the TARDIS instance.
To check if a ref is linked you can use the `#isLinked` method.

Each time you ask a ref for a TARDIS instance, it checks if:
1) the cached tardis instance is null
2) the cached tardis is outdated 
3) the ref has a non-null id to look up 

If those conditions are met then the ref will ask an appropriate `TardisManager` for the TARDIS instance.

For convenience, linkable block entities have a `#isLinked` method themselves, which also check if the ref instance is null.