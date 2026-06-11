#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/new-post.sh "Post title" [options]
  ./scripts/new-post.sh

Options:
  -d, --description TEXT   One-line post preview. Default: empty.
  -t, --tag TAG            ai, technical, or other. Default: other.
      --date YYYY-MM-DD    Post date. Default: today.
      --math               Set math: true. Default: false.
      --no-math            Set math: false.
      --draft              Set hidden: true.
      --publish            Set hidden: false. Default.
      --edit               Open the new post in $VISUAL or $EDITOR.
  -h, --help               Show this help.

Examples:
  ./scripts/new-post.sh "My New Post" -d "Short preview" -t ai --math
  ./scripts/new-post.sh "Private Notes" --draft
USAGE
}

die() {
  printf 'new-post: %s\n' "$*" >&2
  exit 1
}

require_value() {
  local flag="$1"
  local value="${2-}"
  [[ -n "$value" && "$value" != -* ]] || die "$flag requires a value"
}

yaml_quote() {
  local value="$1"
  value=${value//\\/\\\\}
  value=${value//\"/\\\"}
  printf '"%s"' "$value"
}

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E "s/[\'']//g; s/[^a-z0-9]+/-/g; s/^-+//; s/-+$//"
}

normalize_tag() {
  local value="$1"
  value=$(printf '%s' "$value" | tr '[:upper:]' '[:lower:]')
  case "$value" in
    ai) printf 'ai' ;;
    tech | technical) printf 'technical' ;;
    other | "everything else" | everything-else | misc | miscellaneous) printf 'other' ;;
    *) die "unsupported tag '$1' (use ai, technical, or other)" ;;
  esac
}

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"
posts_dir="$repo_root/_posts"

title=""
description=""
tag="other"
post_date="$(date +%F)"
math="false"
hidden="false"
edit_after_create="false"
interactive="false"

if [[ $# -eq 0 && -t 0 ]]; then
  interactive="true"
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h | --help)
      usage
      exit 0
      ;;
    --title)
      require_value "$1" "${2-}"
      title="$2"
      shift 2
      ;;
    -d | --description)
      require_value "$1" "${2-}"
      description="$2"
      shift 2
      ;;
    -t | --tag)
      require_value "$1" "${2-}"
      tag="$2"
      shift 2
      ;;
    --date)
      require_value "$1" "${2-}"
      post_date="$2"
      shift 2
      ;;
    --math)
      math="true"
      shift
      ;;
    --no-math)
      math="false"
      shift
      ;;
    --draft | --hidden)
      hidden="true"
      shift
      ;;
    --publish | --visible)
      hidden="false"
      shift
      ;;
    --edit)
      edit_after_create="true"
      shift
      ;;
    --)
      shift
      [[ $# -gt 0 ]] || die "-- must be followed by a title"
      title="$*"
      break
      ;;
    -*)
      die "unknown option '$1'"
      ;;
    *)
      if [[ -z "$title" ]]; then
        title="$1"
      else
        title="$title $1"
      fi
      shift
      ;;
  esac
done

if [[ "$interactive" == "true" ]]; then
  read -r -p "Title: " title
  read -r -p "Description (optional): " description
  read -r -p "Tag [ai/technical/other] (other): " entered_tag
  tag="${entered_tag:-$tag}"
  read -r -p "Enable math? [y/N]: " entered_math
  case "$entered_math" in
    y | Y | yes | YES) math="true" ;;
  esac
  read -r -p "Create as draft/hidden? [y/N]: " entered_hidden
  case "$entered_hidden" in
    y | Y | yes | YES) hidden="true" ;;
  esac
fi

[[ -d "$posts_dir" ]] || die "posts directory not found: $posts_dir"
[[ -n "$title" ]] || {
  usage >&2
  exit 1
}
[[ "$post_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || die "date must use YYYY-MM-DD"
tag="$(normalize_tag "$tag")"

slug="$(slugify "$title")"
[[ -n "$slug" ]] || die "title did not produce a usable slug"

post_path="$posts_dir/$post_date-$slug.md"
[[ ! -e "$post_path" ]] || die "post already exists: ${post_path#$repo_root/}"

{
  printf '%s\n' '---'
  printf 'layout: post\n'
  printf 'title: %s\n' "$(yaml_quote "$title")"
  printf 'description: %s\n' "$(yaml_quote "$description")"
  printf 'date: %s\n' "$post_date"
  printf 'tag: %s\n' "$tag"
  printf 'math: %s\n' "$math"
  printf 'hidden: %s\n' "$hidden"
  printf '%s\n\n' '---'
  printf '<!-- Start writing here. Use # headings for sections. -->\n'
} > "$post_path"

printf 'Created %s\n' "${post_path#$repo_root/}"

if [[ "$edit_after_create" == "true" ]]; then
  editor="${VISUAL:-${EDITOR:-}}"
  [[ -n "$editor" ]] || die "--edit requires VISUAL or EDITOR to be set"
  "$editor" "$post_path"
fi
