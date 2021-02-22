// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

//! This crate executes a highly specialized algorithm to dynamically generate a greeting in
//! english to a given subject. It is serious business.
//!
//! # Library Usage
//!
//! This crate is on [crates.io](https://crates.io/crates/fnichol-cime) and can be used by adding
//! the crate to your dependencies in your project's `Cargo.toml` file:
//!
//! ```toml
//! [dependencies]
//! fnichol-cime = { version = "0.1.0", default-features = false }
//! ```
//!
//! Note that the default features include dependencies which are required to build a CLI and are
//! not needed for the library.
//!
//! # Library Examples
//!
//! ## Example: greeting a human
//!
//! Assuming we have a human named `Jane`:
//!
//! ```
//! let greeting = fnichol_cime::greeting("Jane");
//! // #=> "Hello, Jane!"
//! ```

#![doc(html_root_url = "https://docs.rs/fnichol-cime/0.1.0")]
#![deny(missing_docs)]

/// Generates a greeting for a given subject.
pub fn greeting(subject: impl AsRef<str>) -> String {
    format!("Hello, {}!", subject.as_ref())
}
