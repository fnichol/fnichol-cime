fn main() {
    println!("cargo:rerun-if-env-changed=NIGHTLY_BUILD");
    if let Ok(date) = std::env::var("NIGHTLY_BUILD") {
        println!(
            "cargo:rustc-env=CARGO_PKG_VERSION={}-nightly.{}",
            std::env::var("CARGO_PKG_VERSION")
                .unwrap()
                .split('-')
                .next()
                .unwrap(),
            date,
        );
    }
}
