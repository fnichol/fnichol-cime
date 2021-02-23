# {{crate}}

|                  |                                                         |
| ---------------: | ------------------------------------------------------- |
|               CI | [![CI Status][badge-ci-overall]][ci]                    |
|   Latest Version | [![Latest version][badge-version]][crate]               |
|    Documentation | [![Documentation][badge-docs]][docs]                    |
|  Crate Downloads | [![Crate downloads][badge-crate-dl]][crate]             |
| GitHub Downloads | [![Github downloads][badge-github-dl]][github-releases] |
|     Docker Pulls | [![Docker pulls][badge-docker-pulls]][docker]           |
|          License | [![Crate license][badge-license]][github]               |

**Table of Contents**

<!-- toc -->

## CLI

## CLI Usage

There's not much to this program. To greet the currently logged in user, run:

```sh
> fnichol-cime "$USER"
Hello, jdoe!
```

For more help and full usage, use the `--help` or `-h` flags:

```sh
> fnichol-cime --help
```

## CLI Installation

### Pre-Built Binaries

There are pre-built binaries available for macOS, Windows, FreeBSD, and a
variety of Linux architectures available through the project's [GitHub
releases][github-releases].

### Docker Image

If a Docker image is more your speed, there is a minimal image published to
Docker Hub at [fnichol/fnichol-cime][docker]. The entrypoint invokes the binary
directly, so any arguments to `docker run` will be passed to the program. For
example, to display the full help usage:

```sh
> docker run fnichol/fnichol-cime --help
```

### Cargo Install

If [Rust](https://rustup.rs/) is installed, then installing with Cargo is
straight forward with:

```console
$ cargo install fnichol-cime
```

### Building From Source

To install from source, you can clone the Git repository, build with Cargo and
copy the binary into a destination directory. This will build the project from
the latest commit on the main branch, which may not correspond to the latest
stable release:

```console
$ git clone https://github.com/fnichol/fnichol-cime.git
$ cd fnichol-cime
$ cargo build --release
$ cp ./target/release/fnichol-cime /dest/path/
```

### Building from source

If you want (or need) to build the CLI from source, the following should not
take too long. Note that you'll need a version of Rust (and Cargo which ships
with the Rust distributions) before running:

```sh
> git clone https://github.com/fnichol/fnichol-cime.git
> cd fnichol-cime/cli
> cargo build --release
# test it out
> ./target/release/fnichol-cime
```

---

## Library

{{readme}}

## CI Status

### Build (main branch)

| Operating System | Target                        | Stable Rust                                                                  |
| ---------------: | ----------------------------- | ---------------------------------------------------------------------------- |
|          FreeBSD | `x86_64-unknown-freebsd`      | [![FreeBSD Build Status][badge-ci-build-x86_64-unknown-freebsd]][ci-main]    |
|            Linux | `arm-unknown-linux-gnueabihf` | [![Linux Build Status][badge-ci-build-arm-unknown-linux-gnueabihf]][ci-main] |
|            Linux | `aarch64-unknown-linux-gnu`   | [![Linux Build Status][badge-ci-build-aarch64-unknown-linux-gnu]][ci-main]   |
|            Linux | `i686-unknown-linux-gnu`      | [![Linux Build Status][badge-ci-build-i686-unknown-linux-gnu]][ci-main]      |
|            Linux | `i686-unknown-linux-musl`     | [![Linux Build Status][badge-ci-build-i686-unknown-linux-musl]][ci-main]     |
|            Linux | `x86_64-unknown-linux-gnu`    | [![Linux Build Status][badge-ci-build-x86_64-unknown-linux-gnu]][ci-main]    |
|            Linux | `x86_64-unknown-linux-musl`   | [![Linux Build Status][badge-ci-build-x86_64-unknown-linux-musl]][ci-main]   |
|            macOS | `x86_64-apple-darwin`         | [![macOS Build Status][badge-ci-build-x86_64-apple-darwin]][ci-main]         |
|          Windows | `x86_64-pc-windows-msvc`      | [![Windows Build Status][badge-ci-build-x86_64-pc-windows-msvc]][ci-main]    |

### Test (main branch)

| Operating System | Stable Rust                                                            | Nightly Rust                                                             |
| ---------------: | ---------------------------------------------------------------------- | ------------------------------------------------------------------------ |
|          FreeBSD | [![FreeBSD Stable Test Status][badge-ci-test-stable-freebsd]][ci-main] | [![FreeBSD Nightly Test Status][badge-ci-test-nightly-freebsd]][ci-main] |
|            Linux | [![Linux Stable Test Status][badge-ci-test-stable-linux]][ci-main]     | [![Linux Nightly Test Status][badge-ci-test-nightly-linux]][ci-main]     |
|            macOS | [![macOS Stable Test Status][badge-ci-test-stable-macos]][ci-main]     | [![macOS Nightly Test Status][badge-ci-test-nightly-macos]][ci-main]     |
|          Windows | [![Windows Stable Test Status][badge-ci-test-stable-windows]][ci-main] | [![Windows Nightly Test Status][badge-ci-test-nightly-windows]][ci-main] |

**Note**: The
[Minimum Supported Rust Version (MSRV)](https://github.com/rust-lang/rfcs/pull/2495)
is also tested and can be viewed in the [CI dashboard][ci-main].

### Check (main branch)

|        | Status                                             |
| ------ | -------------------------------------------------- |
| Lint   | [![Lint Status][badge-ci-check-lint]][ci-main]     |
| Format | [![Format Status][badge-ci-check-format]][ci-main] |

## Code of Conduct

This project adheres to the Contributor Covenant [code of
conduct][code-of-conduct]. By participating, you are expected to uphold this
code. Please report unacceptable behavior to fnichol@nichol.ca.

## Issues

If you have any problems with or questions about this project, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Release History

See the [changelog] for a full release history.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

Licensed under the Mozilla Public License Version 2.0 ([LICENSE.txt][license]).

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the MIT license, shall be
licensed as above, without any additional terms or conditions.

[badge-ci-build-x86_64-unknown-freebsd]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-x86_64-unknown-freebsd.tar.gz
[badge-ci-build-arm-unknown-linux-gnueabihf]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-arm-unknown-linux-gnueabihf.tar.gz
[badge-ci-build-aarch64-unknown-linux-gnu]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-aarch64-unknown-linux-gnu.tar.gz
[badge-ci-build-i686-unknown-linux-gnu]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-i686-unknown-linux-gnu.tar.gz
[badge-ci-build-i686-unknown-linux-musl]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-i686-unknown-linux-musl.tar.gz
[badge-ci-build-x86_64-unknown-linux-gnu]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-x86_64-unknown-linux-gnu.tar.gz
[badge-ci-build-x86_64-unknown-linux-musl]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-x86_64-unknown-linux-musl.tar.gz
[badge-ci-build-x86_64-apple-darwin]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-x86_64-apple-darwin.zip
[badge-ci-build-x86_64-pc-windows-msvc]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=build-bin-fnichol-cime-x86_64-pc-windows-msvc.zip
[badge-ci-check-format]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=check&script=format
[badge-ci-check-lint]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=check&script=lint
[badge-ci-overall]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/main?style=flat-square
[badge-ci-test-nightly-freebsd]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-nightly-x86_64-unknown-freebsd
[badge-ci-test-nightly-linux]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-nightly-x86_64-unknown-linux-gnu
[badge-ci-test-nightly-macos]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-nightly-x86_64-apple-darwin
[badge-ci-test-nightly-windows]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-nightly-x86_64-pc-windows-msvc
[badge-ci-test-stable-freebsd]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-stable-x86_64-unknown-freebsd
[badge-ci-test-stable-linux]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-stable-x86_64-unknown-linux-gnu
[badge-ci-test-stable-macos]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-stable-x86_64-apple-darwin
[badge-ci-test-stable-windows]:
  https://img.shields.io/cirrus/github/fnichol/fnichol-cime/staging?style=flat-square&task=test-stable-x86_64-pc-windows-msvc
[badge-crate-dl]:
  https://img.shields.io/crates/d/fnichol-cime.svg?style=flat-square
[badge-docker-pulls]:
  https://img.shields.io/docker/pulls/fnichol/fnichol-cime.svg?style=flat-square
[badge-docs]: https://docs.rs/fnichol-cime/badge.svg?style=flat-square
[badge-github-dl]:
  https://img.shields.io/github/downloads/fnichol/fnichol-cime/total.svg
[badge-license]:
  https://img.shields.io/crates/l/fnichol-cime.svg?style=flat-square
[badge-version]:
  https://img.shields.io/crates/v/fnichol-cime.svg?style=flat-square
[changelog]:
  https://github.com/fnichol/fnichol-cime/blob/main/fnichol-cime/CHANGELOG.md
[ci]: https://cirrus-ci.com/github/fnichol/fnichol-cime
[ci-main]: https://cirrus-ci.com/github/fnichol/fnichol-cime/main
[code-of-conduct]:
  https://github.com/fnichol/fnichol-cime/blob/main/fnichol-cime/CODE_OF_CONDUCT.md
[crate]: https://crates.io/crates/fnichol-cime
[docker]: https://hub.docker.com/r/fnichol/fnichol-cime
[docs]: https://docs.rs/fnichol-cime
[fnichol]: https://github.com/fnichol
[github]: https://github.com/fnichol/fnichol-cime
[github-releases]: https://github.com/fnichol/fnichol-cime/releases
[issues]: https://github.com/fnichol/fnichol-cime/issues
[license]:
  https://github.com/fnichol/fnichol-cime/blob/main/fnichol-cime/LICENSE.txt
