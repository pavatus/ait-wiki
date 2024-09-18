---
title: Guidelines
type: docs
---

If you want to contribute to AIT it's recommended to read the [package structure](../layout) as well.

# Components
- All TARDIS component classes should end with `Handler`.

- All events (including networking) should be registered in the static constructor of related component:
```java
class MySecretHandler extends TardisComponent {

    // ...

    static {
        TardisEvents.DOOR_OPEN.register(tardis -> System.out.println("the door was opened!"));
    }

    // ...
}
```
(this ensures that the event registration doesn't duplicate and makes the logic separated in the components)


# Properties
- If you want to make a V2 property accessible to any other class to read or write to, make a getter method, that has the same name as the value field:
```java
private final Value<SomeClass> myValue = ...;

public Value<SomeClass> myValue() {
    return myValue;
}
```

- If you want to make a V2 property read-only for other classes, make a standard getter method:
```java
private final Value<SomeClass> myReadOnlyValue = ...;

public SomeClass getMyReadOnlyValue() {
    return myReadOnlyValue;
}
```

- If you want to adjust the value being set, or invoke something when the value changes, make a setter:
```java
private final Value<SomeClass> myValue = ...;

public void setMyValue(SomeClass some) {
    if (some == null)
        return;

    this.myValue.set(some);
    LOGGER.info("My value was set!");
}
```
(you'd probably want to make a getter for the raw value too, since otherwise you'd allow other classes to bypass the setter)

## IDs
TARDIS component ID names should be upper snake case in english without special symbols (except for underscores and colons). 

If you add a custom component in an addon it's recommended to prefix it with your mod id (in uppercase).

ID name shouldn't include "handler" or "component".

**Do**'s:
- `TRAVEL`
- `FLIGHT`
- `STATS`
- `AITE:ENERGY`

**Don't**'s:
- `MyComponent`
- `Some Handler`
- `idontlikespaces`
- `thisSucks`

## Getting your component
Since using `tardis.<MyComponentHandler>.handler(MyComponentHandler.ID)` is quite bothersome, it's recommended to either 
- make a getter in the `Tardis` class like this:
```java
public MyComponentHandler myComponent() {
    return this.handler(MyComponentHandler.ID);
}
```
This is the recommended way if you're *contributing* to AIT.

- or alternatively make a static method in your handler class like this:
```java
public static MyComponentHandler get(Tardis tardis) {
    return tardis.handler(ID);
}
```
Thus is the recommended way if you're making an addon.
