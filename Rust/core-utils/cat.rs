use std::env;
use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader};

fn cat(file: File) {
    let reader = BufReader::new(file);
    for line in reader.lines() {
        println!("{}", line.unwrap())
    }
}

fn main() {
    for arg in env::args().skip(1) {
        let file = OpenOptions::new().read(true).open(arg).unwrap();
        cat(file);
    }
}
