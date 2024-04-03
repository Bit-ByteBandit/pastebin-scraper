# pastebin-scraper

A tool that leverages the API of https://psbdmp.ws/ to find any text dumped in pastebin which could lead to finding some juicy information.

## Usage

```
$ ./scrape.sh 
Usage:
General search	   - ./script.sh -g foobar
```

## Example 

``` 
$ ./scrape.sh -g foobar
Searching pastebin...
Saving in ./output/general/foobar/results.txt
```

## Installation

```
$ git clone https://github.com/streaak/pastebin-scraper.git
$ cd pastebin-scraper
$ sudo chmod +x ./scrape.sh
$ sudo apt-get install jq
$ mkdir output/general/
```

## Output


Outputs will be stored in `./output/general`. The output will contain 2 files, `results.json` and `urls.txt`. `results.json` will contain the dumped text value returned by the API and `urls.txt` will contain the URLs returned by the API.

## TODO

* Add more features

## Acknowledgments

* [Tomnomnom](https://twitter.com/tomnomnom)
* [Ed](https://twitter.com/edoverflow)
* [CaptainFreak](https://twitter.com/0xcaptainfreak)
