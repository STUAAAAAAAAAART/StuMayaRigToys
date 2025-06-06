# quick addAttr

just a short utility script to semi-manually add dynamic attributes to a node; executes on active selection

the `mc.addAttr()` command allows for a lot more types than the default `float`/`int`/`vector`/`string`/`boolean`/`enum` in the attribute editor UI, highly especially the `matrix` type to circumvent the need to create a `composeMatrix` node for a specific operation

script does not cover compound attributes, refer to the maya command documentation for more information (in short, the main attribute and its subattributes each have to be added by an addAttr call with more specific flags)
- possible implementation of a compound attribute utility would be to pass a list with `[name , type]` pairs, with the first item being the main compound attribute
- keep in mind a compound attribute can contain a subattribute that itself is a compound attribute, at that point consider addressing separately