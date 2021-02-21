// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

use clap::{AppSettings, Clap};

const AFTER_HELP: &str =
    "Note: Use `-h` for a short and concise overview and `--help` for full usage.";

/// An examples section at the end of the help message.
const AFTER_LONG_HELP: &str = concat!(
    include_str!("cli_examples.txt"),
    "\n",
    "Note: Use `-h` for a short and concise overview and `--help` for full usage."
);

/// Parse, validate, and return the CLI arguments as a typed struct.
pub(crate) fn parse() -> Args {
    Args::parse()
}

/// Generates a personalized greeting.
///
/// This program uses a sophisticated algorithm to generate an appropriate english greeting.
///
/// Project home page: https://github.com/fnichol/fnichol-cime
#[derive(Clap, Debug)]
#[clap(
    global_setting(AppSettings::UnifiedHelpMessage),
    max_term_width = 100,
    author = concat!("\nAuthor: ", env!("CARGO_PKG_AUTHORS"), "\n\n"),
    version = env!("CARGO_PKG_VERSION"),
    long_version = env!("CARGO_PKG_VERSION"),
    after_help = AFTER_HELP,
    after_long_help = AFTER_LONG_HELP,
)]
pub(crate) struct Args {
    /// A subject to be greeted. [example: jane]
    #[clap(rename_all = "screaming-snake")]
    pub(crate) subject: String,

    /// Sets the verbosity mode.
    ///
    /// Multiple -v options increase verbosity. The maximum is 3.
    #[clap(short = 'v', long = "verbose", parse(from_occurrences))]
    pub(crate) verbose: usize,
}
