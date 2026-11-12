# TribeOS

> **README first, always.** This file is the template, the brief, the why, the
> outline and the skeleton of the whole project. Any change to TribeOS starts
> by updating it here, and the code follows.

## The Brief

TribeOS is a macOS-native foundation written 100% in Swift and AppleScript.
It lives in the terminal first: one Swift package, one command (`tribeos`),
built on eleven Apple open-source Swift packages. There is no GUI in the
foundation. The interface comes later, as a layer on top, and follows the
design law below.

## The Why

The first build was the stock Xcode app template: a window, a list of
timestamps, nothing underneath. It looked bad because there was nothing there
to look good. So the template GUI is stripped and the project starts again
from the ground: a foundation that builds, runs, installs and proves itself
in the terminal before anything is drawn on top of it.

## The Guide

*The Emerald Tablets of Thoth the Atlantean* (Doreal's translation) is the
guide to building right. These are the rules taken from it.

| Rule | From the Tablets | What it means here |
|---|---|---|
| **Order from chaos** | "Look in thy life for disorder. Balance and order thy life." (IX) | One root, one package, one source of truth. No duplicates, no dead files. |
| **Foundation first** | "The foundation in the material is the first step." (Introduction) | Core and terminal before any GUI. |
| **Curves, not angles** | "Seek ye to move not in angles but curves." (VIII) | Rounded corners on everything. No hard corners, anywhere. |
| **Balance, not symmetry** | "Order and balance are the Law of the Cosmos." (IV) | Layouts are asymmetrical and balanced by weight, never mirrored. |
| **Silence is of great profit** | "An abundance of speech profiteth nothing." (III) | Quiet output, little chrome, nothing decorative that doesn't carry meaning. |
| **Cause and effect** | "Be sure the effects that ye bring forth are ever causes of more perfect effects." (XII) | Every package is proven by a live check and a test. Dependencies are pinned. |
| **Keeper of records** | "Preserve my record, guide shall it be." (II) | The README is updated first, always. |

## Design Law

For anything TribeOS shows, in the terminal now and in a GUI later:

- **Everything has rounded corners.**
- **Everything is asymmetrical.** Weight sits off-centre; nothing is mirrored.

The `tribeos` panel already follows it: rounded box corners, title top-left,
summary bottom-right.

## The Foundation

| Package | Used for | Module |
|---|---|---|
| [swift-algorithms](https://github.com/apple/swift-algorithms) | Sequence and collection algorithms | `Algorithms` |
| [swift-argument-parser](https://github.com/apple/swift-argument-parser) | The `tribeos` command line | `ArgumentParser` |
| [swift-asn1](https://github.com/apple/swift-asn1) | ASN.1 / DER encoding | `SwiftASN1` |
| [swift-async-algorithms](https://github.com/apple/swift-async-algorithms) | Async sequence algorithms | `AsyncAlgorithms` |
| [swift-atomics](https://github.com/apple/swift-atomics) | Lock-free atomic values | `Atomics` |
| [swift-certificates](https://github.com/apple/swift-certificates) | X.509 certificates | `X509` |
| [swift-collections](https://github.com/apple/swift-collections) | Deque, OrderedSet and other data structures | `Collections` |
| [swift-crypto](https://github.com/apple/swift-crypto) | Hashing, signing, encryption | `Crypto` |
| [swift-nio](https://github.com/apple/swift-nio) | Event loops and networking | `NIOCore`, `NIOPosix` |
| [swift-numerics](https://github.com/apple/swift-numerics) | Complex and real number maths | `Numerics` |
| [swift-system](https://github.com/apple/swift-system) | File paths and system calls | `SystemPackage` |

Exact versions are pinned in `Package.resolved`. swift-crypto is held below
5.0 so the package builds on Swift 6.0 through 6.2 as well as newer compilers.

## The Skeleton

```
TribeOS/
├── README.md                 the brief; updated first, always
├── Package.swift             the package and its eleven dependencies
├── Package.resolved          pinned dependency versions
├── Sources/
│   ├── TribeOSCore/          the foundation library
│   │   ├── FoundationChecks.swift   one live check per package
│   │   └── AppleScript.swift        runs AppleScript through osascript
│   └── tribeos/              the terminal command
│       └── TribeOS.swift
├── Tests/
│   └── TribeOSCoreTests/     tests for every check and the AppleScript bridge
└── Scripts/
    ├── install.sh            build and install the tribeos command
    └── hello.applescript     smoke test for the AppleScript bridge
```

## Build, Run, Install

Requires macOS 15 or later and Swift 6.0 or later (Xcode 16+). All commands
run in Terminal from the project folder.

Build:

```bash
swift build
```

Run the foundation check:

```bash
swift run tribeos
```

Test:

```bash
swift test
```

Install the `tribeos` command into `~/.local/bin`:

```bash
Scripts/install.sh
```

To work in Xcode, open `Package.swift`.

## The Command

| Command | What it does |
|---|---|
| `tribeos` or `tribeos doctor` | Runs a live check of all eleven packages and prints the result. Exits non-zero if any fail. |
| `tribeos script <file>` | Runs an AppleScript file (macOS only). Try `tribeos script Scripts/hello.applescript`. |
| `tribeos --version` | Prints the version. |

## Outline

1. **Foundation** (this build): package, eleven dependencies, `tribeos doctor`, AppleScript bridge, install script.
2. **Core features**: what TribeOS actually does, built in `TribeOSCore` and exposed through the terminal first.
3. **Interface**: a GUI layer on top of `TribeOSCore`, built to the Design Law.
