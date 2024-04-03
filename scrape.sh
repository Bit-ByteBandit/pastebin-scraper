echo "$(tput setaf 1)        ____  ____          _____   __  ____    ____  ____   ___  ____  
        |    \|    \        / ___/  /  ]|    \  /    ||    \ /  _]|    \ 
        |  o  )  o  ) _____(   \_  /  / |  D  )|  o  ||  o  )  [_ |  D  )
        |   _/|     ||     |\__  |/  /  |    / |     ||   _/    _]|    / 
        |  |  |  O  ||_____|/  \ /   \_ |    \ |  _  ||  | |   [_ |    \ 
        |  |  |     |       \    \     ||  .  \|  |  ||  | |     ||  .  \ 
        |__|  |_____|        \___|\____||__|\_||__|__||__| |_____||__|\_|
$(tput sgr0)"

echo "\n\t\t\t\t By @Streaak"

if [ "$#" -eq 0 ] || [ "$1" = '-h' ]; then
  echo "$(tput setaf 2)\nUsage:$(tput sgr0)" 
  echo "General search     - ./script.sh -g foobar"
  exit 0
fi

scrape() {
        url="$1"
        dir="$2"
        echo "Searching pastebin...\n"
        response=$(curl -s -X GET $url)
        if [ "$response" = "[]" ]; then
            echo "Nothing found in response."
            exit 0
        fi
        curl -s -X GET $url | jq -r '.[] | .id' | awk '{print "https://psbdmp.ws/api/v3/dump/" $1 }' > ./output/$dir/urls.txt
        curl -s -X GET $url | jq -r '.[] | .text' > "./output/$dir/results.txt"
        line_count=$(wc -l < "./output/$dir/results.txt")

        if [ "$line_count" -le 100 ]; then
            cat "./output/$dir/results.txt"
        else
           
            echo "Output More than 100 lines\n Saving in ./output/$dir/results.txt"
        fi
}

if [ "$1" = '-g' ] && [ -n "$2" ]; then
    dir="general/$2"
    url="https://psbdmp.ws/api/v3/search/$2"
    mkdir -p "./output/$dir/"
    scrape "$url" "$dir"
else
    echo "Missing Value. Try to run ./script.sh -g <Term here>"
    exit 0
fi
