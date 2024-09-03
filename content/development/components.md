---
title: Tardis Components
next: properties
type: docs
---

The TARDIS logic is split into components to avoid spaghetti. 

All components must have a unique ID and an empty constructor.

It's preferable to end the class name of a component class with "Handler".

```java
public class MyComponentHandler extends TardisComponent {

    public MyComponentHandler() {
        super(MY_ID);
    }

    @Override
    public void onLoaded() {
        // This event is executed each time the component is loaded, but not created.
        // A component can be loaded on the server if the TARDIS gets loaded.
        // On client - if the component gets an update.
    }

    @Override
    public void onCreate() {
        // This event is executed *only* serverside, when the component gets created.
        // This usually happens when someone grows or places down a TARDIS.
    }
}
```

It's important to not call any logic in the constructor, as that can lead to unexpected consequences.

You can use `#tardis` to get the TARDIS.

You can use the `#isServer` and `#isClient` methods to check the side the code gets executed at. Calling one of those methods is identical to getting a component's TARDIS and checking if it's a `ServerTardis` or a `ClientTardis`.

# IDs
IDs must be unique. AIT uses an enum to store all component IDs in the `TardisComponent.Id` class.

This approach is not practical, unless you have a lot of components.

You can create a custom ID like this:
```java
public static final IdLike MY_ID = new new AbstractId<>("MY_ID", MyComponentHandler::new, MyComponentHandler.class);
```

(It's highly recommended to use a full caps & snake case name for the ID)

It's also important to register it:
```java
TardisComponentRegistry.getInstance().register(MY_ID);
```

# Ticking
All components can receive a server tick event (serverside only).

To do that, you can just implement the `TardisTickable` interface and override the default `#tick(MinecraftServer)` method.

# Synching
It's recommended to use [V2 properties](properties) for this, but in case your data structure is too complex to be implemented using the properties API, you can use this method.

You can call `TardisComponent#sync` to force sync the full component data _from server to client_. It won't work the other way around.

The reason why this is not recommended to use, is that it syncs ALL of the component data, which is bad if you have a lot of fields in the handler.

# Storing data
If you don't need to sync data at all, you can just use plain fields, although it's recommended to use the `@Exclude` annotation on them.

To exclude something from getting saved or synced just apply the excluding annotation.

By default, the annotation stops the data of the field it gets applied to from being serialized for both networking and storing. 

You can change the strategy by supplying arguments to the annotation via an enum.

If you choose the `FILE` strategy, the data will not be persisted and will not be saved to the file, however it will sync.

If you choose the `NETWORK` strategy, the data will be saved to the data file, but it won't be sent over the network, meaning that the client will get the default values for the fields (`0` for numbers, `false` for booleans, `null` for objects, etc).