![Smart Logo](smart-logo.png)

##Ruby Developer Test

The application parse a log file and filtering pages by most views, unique views. We also decided to add the possibility to filter by website visitor activity because it can be helpful for marketing. The application:

* Use OOP principles;
* Use Rspec for testing;
* (100.0%) covered with specs;

## Getting started

Parser 1.0 was tested with ruby 2.7.1.

* Clone or [download](https://github.com/frywer/parser/archive/main.zip) this repo
```
$ git clone https://github.com/frywer/parser.git
```

Move to the project root
```
$ cd parser
```

Make sure you have installed all necessary gems and then
```
$ bundle install
```

Run the script by passing in the path of the server logs you would like to parse

```
$ ruby ./parser.rb webserver.log
```

The first argument is optional and you can skip it. Default path is APP/ROOT/webserver.log
```
$ ruby ./parser.rb
```
Alternative way running script is using `$ rake` command:

```
$ rake parse path=webserver.log
```

Output of valid file:

```
---MOST VIEWS---
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits

---UNIQ VIEWS---
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views

---VISITOR ACTIVITIES---
158.577.775.616 31 activities
722.247.931.582 31 activities
451.106.204.921 29 activities
184.123.665.067 29 activities
```

Output with some invalid rows:

```
---MOST VIEWS---
/about/2 90 visits
/contact 89 visits
/index 81 visits
/help_page/1 80 visits
/about 79 visits
/home 77 visits

---UNIQ VIEWS---
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views

---VISITOR ACTIVITIES---
158.577.775.616 31 activities
722.247.931.582 31 activities
451.106.204.921 29 activities
184.123.665.067 29 activities

---Found 4 Errors---
Invalid row: /about invalid 722.247.931.582
Invalid row: /index
Invalid row: /about / / /  802.683.925.780
Invalid row: /home  ___ 451.106.204.921
```
The output by default is ordered from most pages views to less page views.

## Running tests
Parser Application uses [Rspec](https://github.com/rspec/rspec) as test framework, and [Rubocop](https://github.com/rubocop-hq/rubocop) as a code analyzer.

Run `$ bundle install` before testing to make sure you have installed all necessary gems. 

* Running all tests:
```bash
$ rspec
```

* Running tests for an specific file:
```bash
$ rspec spec/parser/log_file_spec.rb
```

* Running a specific test:
```bash
$ rspec spec/parser/log_file_spec.rb:20
```

* Running linter:
```bash
$ rubocop
```
* running all together (rspec&rubocop)
```bash
$ rake tests
```

## Developer notes

* `LogFile` parse logs, initialize pages and visitors objects, stores errors.
* `View` parse the row from the log file, splits the ip and page to a separate methods, validates rows
* `Page` stores all and uniq views of the page
* `Visitor` Stores all activities of the ip address
* `Print` Prints the result
