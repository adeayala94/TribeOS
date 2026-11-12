# TribeOS

> **README first, always.** This file is the project brief: the why, the
> outline and the skeleton of the whole project. Any change to TribeOS starts
> by updating it here, and the code follows.

**TribeOS is infrastructure, not an app.** It is the bottom of the iceberg:
the part nobody sees and everything rests on.

---

# PROJECT BRIEF

**Project:** TribeOS — infrastructure foundation

## Background

The next generation of AI is being built by product companies such as Notion,
Airtable and Claude. These are the **redwoods**: tall, visible, and only as
strong as the ground they grow in.

The ground is the platform companies: Apple, AWS, OCI, GCP, Azure, Red Hat/IBM
and Cisco. They are the **soil and the stewards**. Their job is not to be the
tree but to make trees possible.

Most tooling is built for the top of the iceberg: apps, dashboards, things
with a screen. Very little is built for the builders underneath. TribeOS is
built for them. It began as a stock Xcode app template, which was the wrong
shape entirely, so the GUI was stripped and the project restarted from the
ground as infrastructure.

## Key Objective / Problem to Solve

Give infrastructure builders a foundation they can trust on sight.

Measured by: a builder goes from a fresh clone to a passing foundation check
(`tribeos doctor`, every package proven live) with one command, and can read
the whole foundation, source and brief, in one sitting.

## Target

**Who:** builders at Apple, AWS, OCI, GCP, Azure, Red Hat/IBM and Cisco.
Platform, systems and infrastructure engineers and architects: the people who
build what others build on.

**Behavior:** They live in the terminal. They read source before they read
marketing. They pin versions, run the tests themselves, and judge a project
by whether it builds clean the first time. They are analytical and they
automate anything they do twice.

**Attitudes:** Infrastructure should be quiet, ordered and boring in the best
sense. Stewardship matters more than visibility: their success is measured by
what grows on top of their work, not by their own name on it. They distrust
anything that needs a GUI to operate.

**Misperceptions:**
- That a Swift project must be an app. TribeOS has no GUI in its foundation.
- That AI infrastructure means models and GPUs. It also means the plain,
  dependable layers underneath: concurrency, networking, cryptography,
  certificates, data structures.
- That the name "OS" means an operating system to install. It is a foundation
  to build on.

**Wants and needs:**
- *Physical:* a small, legible, dependency-pinned foundation that builds,
  tests and installs from the terminal with no ceremony.
- *Emotional:* confidence in what is underneath them, and pride in being the
  soil rather than the tree.

**Emotional state:** Wary. They have inherited too many foundations that
looked finished and were hollow. They are tired of chaos and are looking for
order.

## The Four Connections

Everything in TribeOS connects to these four, and only these four.

| Role | What it is | Connection |
|---|---|---|
| **Rails** | What the data runs on | Snowflake |
| **Governance** | Who is allowed to do what, and the record of it | Cisco |
| **Pipes** | What carries the work from place to place | Red Hat, IBM |

The list is closed. Nothing else gets wired in. Adding a fifth means changing
this brief first.

Status: the four are declared in code (`tribeos connections`) and guarded by a
test. None is wired to a live service yet.

## Promise of Brand

**Be the soil. Grow redwoods.**

## Proof of Promise

- **Every package is proven, not just listed.** `tribeos doctor` exercises all
  eleven foundation packages with a real call and fails loudly if any break.
- **Built only on Apple's open-source Swift packages**, the same ones used
  across the server-side Swift ecosystem. Versions are pinned in
  `Package.resolved`.
- **100% Swift and AppleScript.** One package, one command, no GUI.
- **Tested.** Every check is also a test.
- **Small enough to read.** The whole foundation is a handful of files.

## Mental Response

"This is solid ground. I can build on this, and what I build on it will
stand."

## Physical Response

They clone it, run `swift run tribeos`, see every package in order, and
install the command. Then they build their own layer on `TribeOSCore`.

## Brand Personality

Grounded. Quiet. Ordered. Patient. Exacting. A steward, not a star.

The guide to building right is *The Emerald Tablets of Thoth the Atlantean*
(Doreal's translation). These are the rules taken from it.

| Rule | From the Tablets | What it means here |
|---|---|---|
| **Order from chaos** | "Look in thy life for disorder. Balance and order thy life." (IX) | One root, one package, one source of truth. No duplicates, no dead files. |
| **Foundation first** | "The foundation in the material is the first step." (Introduction) | Infrastructure before anything visible. |
| **Curves, not angles** | "Seek ye to move not in angles but curves." (VIII) | Rounded corners on everything. No hard corners, anywhere. |
| **Balance, not symmetry** | "Order and balance are the Law of the Cosmos." (IV) | Layouts are asymmetrical and balanced by weight, never mirrored. |
| **Silence is of great profit** | "An abundance of speech profiteth nothing." (III) | Quiet output, nothing decorative that doesn't carry meaning. |
| **Cause and effect** | "Be sure the effects that ye bring forth are ever causes of more perfect effects." (XII) | Every package is proven by a live check and a test. Dependencies are pinned. |
| **Keeper of records** | "Preserve my record, guide shall it be." (II) | The README is updated first, always. |

**Design law**, for anything TribeOS shows: everything has rounded corners,
and everything is asymmetrical. The `tribeos` panel already follows it:
rounded box corners, title top-left, summary bottom-right.

---

# NEEDED INFORMATION

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

swift-crypto is held below 5.0 so the package builds on Swift 6.0 through 6.2
as well as newer compilers.

## The Skeleton

```
TribeOS/
├── README.md                 the brief; updated first, always
├── Package.swift             the package and its eleven dependencies
├── Package.resolved          pinned dependency versions
├── Sources/
│   ├── TribeOSCore/          the foundation library
│   │   ├── FoundationChecks.swift   one live check per package
│   │   ├── Connections.swift        the four connections and their roles
│   │   └── AppleScript.swift        runs AppleScript through osascript
│   └── tribeos/              the terminal command
│       └── TribeOS.swift
├── Tests/
│   └── TribeOSCoreTests/     tests for the checks, connections and AppleScript bridge
└── Scripts/
    ├── install.sh            build and install the tribeos command
    └── hello.applescript     smoke test for the AppleScript bridge
```

## Build, Run, Install

Requires Swift 6.0 or later, on macOS 15+ (Xcode 16+) or Linux. The
AppleScript bridge is macOS only. All commands run in a terminal from the
project folder.

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

## The Command

| Command | What it does |
|---|---|
| `tribeos` or `tribeos doctor` | Runs a live check of all eleven packages and prints the result. Exits non-zero if any fail. |
| `tribeos connections` | Lists the four connections by role. |
| `tribeos script <file>` | Runs an AppleScript file (macOS only). Try `tribeos script Scripts/hello.applescript`. |
| `tribeos --version` | Prints the version. |

## Outline

1. **Foundation** (this build): package, eleven dependencies, `tribeos doctor`, the four connections declared, AppleScript bridge, install script.
2. **Connections**: wire the four for real, one at a time: Snowflake (rails), Cisco (governance), Red Hat and IBM (pipes).
3. **Surface**: anything visible comes last, on top of `TribeOSCore`, built to the design law.
