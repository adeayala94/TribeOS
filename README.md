# TribeOS

> **README first, always.** This file is the project brief: the why, the
> outline and the skeleton of the whole project. Any change to TribeOS starts
> by updating it here, and the code follows.

**TribeOS is infrastructure, not an app.** It is the bottom of the iceberg:
the foundation for business on the Mac.

> **Draft.** Only the foundation exists today. Everything described as growing
> on top of it is the vision, not a shipped product.

---

# PROJECT BRIEF

**Project:** TribeOS — the foundation for business on the Mac

## Background

Business software runs on Windows-first suites. A company that runs on Macs
has good machines and good documents (iWork) but no business stack of its
own: nowhere to buy and deploy business software built for the Mac, no
ERP-class suite that feels native, and a developer platform that has not kept
pace with how software is now built and shared.

Closing that gap is not one app. It is a forest. The products are the
**redwoods**: tall, visible, and only as strong as the ground they grow in.
The people who build for Apple platforms are the **soil and the stewards**.

TribeOS is the ground. It began as a stock Xcode app template, which was the
wrong shape entirely, so the GUI was stripped and the project restarted from
the bottom as infrastructure.

## What Grows on It

The top of the iceberg. TribeOS is the foundation for all five. None is built
yet.

| What | What it means | Status |
|---|---|---|
| **A B2B App Store for macOS** | One place for businesses to find, buy and deploy Mac business software | Vision |
| **A Dynamics 365-class suite for Mac** | TribeOS (the foundation) + SpiralERP (the business records) + iWork (the documents) | Vision. SpiralERP exists separately and is not yet connected. |
| **A GitHub for Apple** | Apple's developer platform as the home for code and collaboration, not only for certificates and submissions | Vision |
| **A revitalised Xcode** | The tool all of the above is built with, made worth living in again | Vision |
| **App Store Connect for iOS builders, Business Essentials for macOS** | The two ends of the same platform: publishing for the people who build, device and app management for the businesses that run | Vision |

## The Platform

Everything is cut and stripped for relaunch. Two platforms remain. AirPods,
Apple TV, Vision and Home are out until they relaunch.

| | **iOS** | **macOS** |
|---|---|---|
| **Market** | B2C | B2B |
| **Apps** | Apps that do not need to talk to each other (Pinterest and Uber do not have to talk) | Apps that do (Bill and HubSpot have to talk) |
| **Anchor** | App Store Connect | Business Essentials |
| **Devices** | iPhone, iPad, iMac (the touch version of the Mac) | Mac, MacPad (the new HomePod: a touch point of sale for coffee-shop baristas), MacPad Touch (a duo for bartenders and waiters) |

The device line-up is proposed. iMac as a touch Mac, MacPad and MacPad Touch
are not existing Apple products.

TribeOS sits under the macOS side, because that is where apps have to talk and
so where a shared foundation is needed.

## The Three Suites

- **Microsoft Office** holds the corporate half of the economy.
- **iWork** is for the other half: the roughly 35 million small and
  medium-sized businesses.
- **Google Workspace** sits between them as the middle layer, mediating
  between a business's internal and external stakeholders.

With those three in place and talking through one foundation, the layers
businesses bolt on today to make their software cooperate (Okta for identity,
Cloudflare for the edge, Zapier for glue) are no longer needed.

This is the thesis, not the current state. iWork does not hold that half of
the market today, and the figures are working estimates, not sourced numbers.

## The Thesis

Integration and processing move down into the data layer.

- **One rail.** Snowflake becomes for the database layer what MuleSoft is for
  application integration: the one place everything connects through. TribeOS
  therefore speaks to one system, through one SDK.
- **No GPU estate to run.** The long-term bet is that builders should not need
  to own and operate their own GPU infrastructure to do AI work. Processing is
  pushed down to the data layer and bought as a service.

This is a thesis, not a proven fact. Today Snowflake's own AI features run on
GPUs inside Snowflake, so the bet is about who has to own that hardware, not
about GPUs disappearing.

## Key Objective / Problem to Solve

Give Apple builders a foundation they can trust on sight, so that business
software for the Mac can be built on one base instead of many.

Measured by: a builder goes from a fresh clone to a passing foundation check
(`tribeos doctor`, every package proven live) with one command, and can read
the whole foundation, source and brief, in one sitting.

## Target

**Who:** Apple builders first. Mac and iOS developers, and the platform teams
who build what those developers build on.

**Behavior:** They work in Xcode and the terminal. They write Swift, read
source before marketing, and judge a project by whether it builds clean the
first time. They ship through App Store Connect and know its friction by
heart.

**Attitudes:** The Mac deserves first-class business software, not ports.
Native matters. Stewardship matters more than visibility: their success is
measured by what grows on top of their work.

**Misperceptions:**
- That a Swift project must be an app. TribeOS has no GUI in its foundation.
- That the Mac is for creative work and business runs elsewhere.
- That an "App Store" means consumer apps. The gap is business software.
- That iOS and macOS are the same market. iOS is B2C, apps that stand alone;
  macOS is B2B, apps that have to talk.
- That the name "OS" means an operating system to install. It is a foundation
  to build on.

**Wants and needs:**
- *Physical:* a small, legible, dependency-pinned Swift foundation that
  builds, tests and installs from the terminal with no ceremony.
- *Emotional:* confidence in what is underneath them, and pride in being the
  soil rather than the tree.

**Emotional state:** Loyal and impatient. They believe in the platform and
are tired of waiting for its business and developer tooling to catch up.
They are wary of foundations that look finished and are hollow.

## The Four Connections

Everything in TribeOS connects to these four, and only these four, and all of
it runs through Snowflake. There is one SDK. These are what the business
software on top runs on.

| Role | What it is | Connection | How TribeOS reaches it |
|---|---|---|---|
| **Rails** | What the data runs on | Snowflake | Directly |
| **Governance** | Who is allowed to do what, and the record of it | Cisco | Through Snowflake |
| **Pipes** | What carries the work from place to place | Red Hat, IBM | Through Snowflake |

The list is closed. Nothing else gets wired in, and nothing bypasses the
rails. Adding a fifth, or a second direct connection, means changing this
brief first.

The one SDK is TribeOS's own Snowflake client, to be written in Swift on the
foundation packages against Snowflake's SQL REST API (Snowflake publishes no
Swift SDK).

Status: the four and their paths are declared in code (`tribeos connections`)
and guarded by tests. Nothing is wired to a live service yet, and how Cisco,
Red Hat and IBM are bridged into Snowflake is still to be designed.

## The Value Case

How TribeOS is qualified with a buyer, following the ValueSelling formula:
**Differentiated VisionMatch × Value × Power × Plan**. If any one is missing,
the whole thing equals zero.

| Element | The question | Where TribeOS stands |
|---|---|---|
| **Business Issue** | What time-bound, financial metric is the buyer measured on? | Hypothesis only: the cost of running a Mac-based business on software built for another platform, and of integrating many systems through many SDKs. Not yet confirmed by any buyer, and not yet a number. |
| **Problems** | What stops them resolving it? | No business suite native to the Mac. No single place to buy and deploy Mac business software. Every product connects to many systems through many SDKs. |
| **Solution** (differentiated) | What do they believe will fix it, that only we do well? | One foundation under the whole stack. One rail, one SDK. A closed list of four connections. Every part proven live. |
| **Value** | Is it worth it, to the business and to the person? | Business value: not quantified. It needs a real buyer's numbers. Personal value: being the steward whose ground the redwoods grow in. |
| **Power** | Who can approve or veto? | Not identified. The brief's target is the builders, who are users and possible sponsors, not necessarily the people who sign. |
| **Plan** | What are the agreed steps to value realized? | None. Nothing has been agreed with any buyer. |

**Status: unqualified.** The VisionMatch is drafted but unconfirmed, and Value,
Power and Plan are open, so the formula currently equals zero.

Open questions to take to a buyer:

- What is your number one priority this year, and what stands in its way?
- What does running your business on Macs cost you in software that was not built for them?
- How many systems does a new product have to integrate with, and through how many SDKs?
- Who else is involved in a decision like this, and can anyone override it?
- When this is solved, what changes for you personally?

## Promise of Brand

**Be the soil. Grow redwoods.**

## Proof of Promise

The proof is only what exists today.

- **Every package is proven, not just listed.** `tribeos doctor` exercises all
  eleven foundation packages with a real call and fails loudly if any break.
- **Built only on Apple's open-source Swift packages.** Versions are pinned in
  `Package.resolved`.
- **100% Swift and AppleScript.** One package, one command, no GUI.
- **Tested.** Every check is also a test.
- **Small enough to read.** The whole foundation is a handful of files.

## Mental Response

"This is solid ground, and it is native. I can build business software for
the Mac on this, and it will stand."

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
| `tribeos connections` | Lists the four connections by role and how each is reached. |
| `tribeos script <file>` | Runs an AppleScript file (macOS only). Try `tribeos script Scripts/hello.applescript`. |
| `tribeos --version` | Prints the version. |

## Outline

1. **Foundation** (this build): package, eleven dependencies, `tribeos doctor`, the four connections declared, AppleScript bridge, install script.
2. **The one SDK**: a Swift Snowflake client in `TribeOSCore`, proven against a live account from the terminal.
3. **Through the rails**: bring governance (Cisco) and pipes (Red Hat, IBM) in through Snowflake.
4. **The suite**: connect SpiralERP and iWork on top of `TribeOSCore`.
5. **The surface**: the B2B store and the developer platform, built last and to the design law.

## Names and Affiliation

TribeOS is an independent project. It is not affiliated with, sponsored by or
endorsed by Apple, Microsoft, Google, GitHub, Snowflake, Cisco, Red Hat, IBM
or any other company named here. Their
product names are used here only to describe a category ("Dynamics 365-class",
"a GitHub for Apple") or a system TribeOS intends to connect to. All
trademarks belong to their owners.
