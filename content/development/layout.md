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

---

## `client` (`loqor.ait.client`)
Contains all of the client side code.

### `tardis`
The TARDIS package containing all of the client TARDIS logic and utilities.

---

## `api`
The API package contains interfaces which addon devs can use to implement various features.

### `link` (`loqor.ait.api.link`)
Contains the standard [linkable](../linkables) classes.
