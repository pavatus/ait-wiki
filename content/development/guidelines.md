---
title: Guidelines
type: docs
---

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

