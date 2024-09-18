---
title: Folder Layout
type: docs
---

This page should be a guideline to AIT's package structure.

# `loqor.ait`
The base AIT package. Before 1.0.4 known as `mdteam.ait`.

## `core` (`loqor.ait.core`)
The core package containing the common side code.

### `tardis` (`loqor.ait.core.tardis`)
The TARDIS package containing all of the common TARDIS logic, components and utilities.

### `data` (`loqor.ait.data`)
Common data structures used everywhere.

### `util` (`loqor.ait.core.util`)
Common [utility](../utility) classes.

---

## `client` (`loqor.ait.client`)
Contains all of the client side code.

### `tardis` (`loqor.ait.client.tardis`)
The TARDIS package containing all of the client TARDIS logic and utilities.

### `util` (`loqor.ait.client.util`)
The client-side [utility](../utility) classes.

### `data` (`loqor.ait.client.data`)
Client specific data structures.

---

## `api` (`loqor.ait.api`)
The API package contains interfaces which addon devs can use to implement various features.

### `link` (`loqor.ait.api.link`)
Contains the standard [linkable](../linkables) classes.
