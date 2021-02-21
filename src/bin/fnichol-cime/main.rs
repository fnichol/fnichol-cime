// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

mod cli;

fn main() {
    let args = cli::parse();
    // In a real application, use the `log` framework or something similar. In this example case,
    // we'll do this which avoids more dependencies for one call.
    if args.verbose > 0 {
        eprintln!("[debug] parsed cli arguments; args={:?}", args);
    }

    let greeting = fnichol_cime::greeting(args.subject);
    println!("{}", greeting);
}
