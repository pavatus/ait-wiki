---
title: Properties
type: docs
---

Properties exist as a way to sync data from server to client without having to send the entire TARDIS/its component to the client.

## PropertiesHolder (V1, DEPRECATED)
(Or as i call them, properties v1) were the original properties, only support primitive types, `String` and `Identifier`.

`PropertiesHolder` is a wrapper for a `Map<String, Object>`. Doesn't support nested data (technically it does, but it will sync the object containing the nested data as one whole, not partially).

They were deprecated as of 1.0.5

## Properties & Values (V2)
(Or as i call them, properties v2). Supports nested data. Instead of being bound to a single `PropertiesHolder`, any component that extends `KeyedTardisComponent` will be able to use them.

The API consists of 2 main classes, `Property` and `Value`.
- `Property` is a blueprint for all values. A schema if you will. Values refer to its defining property to serialize and deserialize data.
- `Value` is the container for any object. It tracks data, has a getter and a setter.

Example:
```java
class ExampleHandler extends KeyedTardisComponent {

    private static final Property<String> EX_STR = Property.of(Type.STRING, "ex_str", "default value");

    // Use implementations to get accurate properties for primitive types.
    private static final IntProperty EX_INT = new IntProperty("ex_int", component -> PropertiesHandler.get(component.tardis(), "ex_int")); // read the default value from v1

    private final Value<String> exStr = EX_STR.create(this);
    private final IntValue exInt = EX_INT.create(this);

    @Override
    public void onLoaded() { 
        // it is important to load the values in this method. It's ensured to be called on both sides when the component is loaded
        this.exStr.of(this, EX_STR);
        this.exInt.of(this, EX_INT);
    }

    // ...
}
```