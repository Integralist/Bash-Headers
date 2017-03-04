function headers {
  if [[ "$1" =~ -(h|help) ]]; then
    printf "\n\t1st param: URL\n\t2nd param: regex\n\t3rd param: http request header"
    printf "\n\n\tif you have no need for a regex\n\tbut need a http header\n\tthen just use an empty string ''\n"
    return
  fi

  if [ -z "$1" ]; then
    printf "\n\tExamples:\n\t\theaders https://www.buzzfeed.com/?country=us 'x-cache|x-timer|device' '-H User-Agent:iphone'\n"
    printf "\t\theaders https://www.buzzfeed.com/?country=us '' '-H User-Agent:iphone -H X-Foo:bar'\n"
    printf "\n\tHelp:\theaders -h\n\t\theaders -help\n"
    return
  fi

  local url=$1
  local pattern=${2:-''}
  local header=${3:-}
  local response=$(curl -H Fastly-Debug:1 $header -D - -o /dev/null -s "$url") # -D - will dump to stdout
  local status=$(echo "$response" | head -n 1)

  printf "\n%s\n\n" "$status"
  echo "$response" | sort | tail -n +3 | egrep -i "$pattern"
}
