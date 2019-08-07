use std::io::{self, Write};

fn pig(first: String, last: String) -> (String, String) {
    let (f, irst) = first.split_at(1);
    let (l, ast) = last.split_at(1);
    let lirst = l.to_string() + &irst.to_string();
    let fast = f.to_string() + &ast.to_string();
    return (lirst, fast);
}

fn is_quit(string: String) -> bool {
    return string == ":q" || string == ":quit";
}

fn main() {
    let mut wrong = 0;
    loop {

        print!("What is your full name? ");
        io::stdout().flush().unwrap();

        let mut first_last = String::new();
        io::stdin().read_line(&mut first_last).unwrap();

        if is_quit(first_last.trim().to_string()) {
            break;
        }

        let words: Vec<&str> = first_last.split_whitespace().collect();
        let word_count = words.len();

        if word_count == 2 {
            let first = words[0].to_string();
            let last = words[1].to_string();
            let (lirst, fast) = pig(first, last);
            println!("Your name is: {} {}", lirst, fast);
        } else {
            wrong = wrong + 1;
            println!(
                "{} has {} words instead of only 2: attempt {}",
                first_last,
                word_count,
                wrong
            );
        }
    }
}
