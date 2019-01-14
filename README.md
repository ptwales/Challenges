Challenges
==========

These challenges aim to help learn a new language, it's build tools, and
ecosystem.  They are not focused on increasing your skills as a programmer by
solving novel math problems but by solving common real-world problems.  You will
quickly be encouraged to use external libraries as soon as possible.

_These challenges develop your programming skills as a trade not as an academic
pursuit._ They are boring, frustrating, and painful. You will spend much time
reading manuals. **This is the anti-project euler.**

The Basics
----------

  1. print "Hello, World"
  1. _fizz buzz_: Print 1-100 replacing multiples of 3 with "fizz", multiples of
     5 with "buzz", and multiples of 15 with "fizz buzz".
  1. "Lrist Fast": Ask for first and last name and print the first letters of
     both swapped.
    - Exit on `:q` or `:quit`
    - Prompt again if more or less than two words were given.
      * Respond with how many words were given and what the words were.
      * Track how many wrong answers were given in a row.
  1. Produce executables that perform the following core utils:     
    2. `echo`
    2. `ls`
    2. `cat`
    2. `touch`
     _(option flags are optional. Wrapper scripts in `sh` are acceptable if
     needed)_
  1. **Something that accepts and parses mutliple argumnts**

Build Systems
-------------
_when C suddenly sucks_

If you weren't using a build system already, you'll need it for these. Any
dependencies you need may not be installed system wide.

  1. An executable that reads from an arbitrary json file and prints the
  translated data to stdout in yaml.
  1. Unit test a square root function.
    - BONUS: write a property check if such a library is available. _(e.g.
  Quickcheck or Scalacheck)_
  1. Auto generate documentation in HTML.
    - Pandoc can be used to convert other documentation formats to HTML.
  1. "Hello World" notification through `libnotify`.
    - `libnotify` should declared as a versioned dependency.

Web Development
---------------

Remember, external libraries are encouraged.

1. Write a server and a client:
  - The server opens an arbitrary port and echos all requests reversed.
  - The client connects via an arbitrary port
    + First argv is the port
    + Remaining argv is the text to send.

### Finale

Write a json REST API to an sqlite database.
  - There is only one table to the database.
    - There is an autoSeqNo for the table.
  - Any extraneous json fields cause an error response.
  - JSON PUT requests inseret or update.
    + Inserts must have all fields except the autoSeqNo field.
    + Updates must have the autoSeqNo field.  Other fields within schema a
      updated. 
  - JSON GET accepts a list of autoSeqNos to return with the matching records.
    + Respond with 404 if any autoSeqNos are not found.
  - JSON DELETE accepts a list of autoSeqNos to delete.
    + No records are deleted if any autoSeqNos are not found.

### Bonus

Write a `Dockerfile` that creates a working docker images for each challenge in
this section.
