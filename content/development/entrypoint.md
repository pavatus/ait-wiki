Some of AITs registries get frozen or create caches after initialization. If you try to register, for example, a custom component in a default fabric `ModInitializer`, it's not guaranteed to work.

Since it's not guaranteed your mod initializer will run before AIT (even if it will, a lot of stuff will not be initialized, causing trouble).

To fix this use an `AITInitializer` entrypoint interface, it's id is `ait`.

In the `entrypoints` field in your `fabric.mod.json` add a new element like this:
```json
"ait": [
    "package.name.of.your.CustomAITInitializer"
]
```

Then create your initializer class by implementing the `AITInitializer` class.