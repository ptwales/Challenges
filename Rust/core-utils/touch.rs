use std::env;
use std::fs::OpenOptions;
use std::io::prelude::*;

fn main() {
    for arg in env::args().skip(1) {
        let mut file = OpenOptions::new()
            .write(true)
            .append(true)
            .create(true)
            .open(arg)
            .unwrap();
        write!(file, "").unwrap();
    }
}
