#!/bin/sh

set -eu

run_query() {
  local model="$1"
  local query="$2"
  local system_prompt
  system_prompt=$(cat <<EOF
/clear
System prompt:
- The output is being streamed to a markdown file.
- All output text must be in markdown format.
- The output text must be in the language of the query.

User prompt:
$query
EOF
)
  ollama run "$model" "$system_prompt"
}

main() {
  local model="deepseek-r1:1.5b"
  local query=""

  while [ $# -gt 0 ]; do
    case "$1" in
      -m)
        if [ $# -lt 2 ]; then
          echo "Usage: $0 [-m model] [query...]" >&2
          exit 1
        fi
        model="$2"
        shift 2
        ;;
      *)
        query="$*"
        break
        ;;
    esac
  done

  if [ -z "$query" ]; then
      query=$(cat)
  fi

  if [ -z "$query" ]; then
    echo "Error: query is empty" >&2
    echo "Usage: $0 [-m model] [query...]" >&2
    exit 1
  fi

  mkdir -p .prompts
  run_query "$model" "$query" | tee ".prompts/$query.md"
}

main "$@"
