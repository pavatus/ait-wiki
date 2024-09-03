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
public static final IdLike MY_ID = new 
```

It's also important to register it:
```java
TardisComponentRegistry.register(MY_ID);
```