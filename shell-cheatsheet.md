# Shell CheatSheet


## Process JSON

[`jq`](https://stedolan.github.io/jq/manual/) is best I know of.

<details><summary>How to install</summary><p>

```shell script
brew install jq # MacOS
apt install jq  # Debian family
apk add jq      # Alpine
```

</p></details>

```shell script
# Get raw `url`s from curl returning a list of objects
curl ... | jq -r '.[].url'

# Print formatted file
jq . < ./file.json

# Create JSON object
jq -n \
  --arg     simple 'some-value' \
  --argjson json   '["one", "two", 3]' \
  '{$simple, $json}'
```


## Strip prefix- `#`, `##`

Remove from beginning

```shell script
var="abc abc"

echo "${var#*b}" # non-greedy
# -> "c abc"

echo "${var##*b}" # greedy
# -> "c"
```


## Strip -suffix `%`, `%%`

Remove from end

```shell script
var="abc abc"

echo "${var%b*}" # non-greedy
# -> "abc a"

echo "${var%%b*}" # greedy
# -> "a"
```

