#!/usr/bin/env sh
# shellcheck shell=sh disable=SC2039

print_usage() {
  local program="$1"

  echo "$program

    Builds a Docker image

    USAGE:
        $program [FLAGS] [--] <IMG> <REPO> <AUTHOR> <LICENSE> <BIN> <VERSION>

    FLAGS:
        -h, --help          Prints help information

    ARGS:
        <IMG>     Name of Docker Hub image [example: jdoe/myproject]
        <REPO>    Name of GitHub repository [example: jdoe/myproject-rs]
        <AUTHOR>  Author names [example: Jane Doe <jdoe@example.com]
        <LICENSE> License for project [example: MPL-2.0]
        <BIN>     Name of program
        <VERSION> Version to install and tag
    " | sed 's/^ \{1,4\}//g'
}

main() {
  set -eu
  if [ -n "${DEBUG:-}" ]; then set -v; fi
  if [ -n "${TRACE:-}" ]; then set -xv; fi

  local program img repo author license bin version
  program="$(basename "$0")"

  OPTIND=1
  while getopts "h-:" arg; do
    case "$arg" in
      h)
        print_usage "$program"
        return 0
        ;;
      -)
        case "$OPTARG" in
          help)
            print_usage "$program"
            return 0
            ;;
          '')
            # "--" terminates argument processing
            break
            ;;
          *)
            print_usage "$program" >&2
            die "invalid argument --$OPTARG"
            ;;
        esac
        ;;
      \?)
        print_usage "$program" >&2
        die "invalid argument; arg=$arg"
        ;;
    esac
  done
  shift "$((OPTIND - 1))"

  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <IMG> argument"
  fi
  img="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <REPO> argument"
  fi
  repo="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <AUTHOR> argument"
  fi
  author="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <LICENSE> argument"
  fi
  license="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <BIN> argument"
  fi
  bin="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" >&2
    die "missing <VERSION> argument"
  fi
  version="$1"
  shift

  build_docker_image "$img" "$repo" "$author" "$license" "$bin" "$version"
}

build_docker_image() {
  local img="$1"
  local repo="$2"
  local author="$3"
  local license="$4"
  local bin="$5"
  local version="$6"

  need_cmd curl
  need_cmd date
  need_cmd docker
  need_cmd git
  need_cmd shasum
  need_cmd tar

  echo "--- Building a Docker image $img:$version for '$bin'"

  local target="x86_64-unknown-linux-musl"

  local archive="$bin-$target.tar.gz"
  local github_url="https://github.com/$repo/releases/download"
  github_url="$github_url/v$version/$archive"

  local workdir
  workdir="$(mktemp -d 2>/dev/null || mktemp -d -t tmp)"
  setup_traps "cleanup $workdir"

  echo "  - Downloading $github_url to $archive"
  curl -sSfL "$github_url" -o "$workdir/$archive"
  echo "  - Downloading $github_url.sha256 to $archive.sha256"
  curl -sSfL "$github_url.sha256" -o "$workdir/$archive.sha256"

  local revision created
  revision="$(git show -s --format=%H)"
  created="$(date -u +%FT%TZ)"

  cd "$workdir"
  echo "  - Verifying $archive"
  shasum -a 256 -c "$archive.sha256"
  echo "  - Extracting $bin from $archive"
  tar xf "$archive"
  mv "$bin-$target" "$bin"
  echo "  - Cleaning up Docker context"
  rm -f "$archive" "$archive.sha256"

  echo "  - Generating image metadata"
  cat <<-END >image-metadata
	img="$img"
	version="$version"
	source="http://github.com/$repo.git"
	revision="$revision"
	created="$created"
	END

  echo "  - Generating Dockerfile"
  cat <<-END >Dockerfile
	FROM scratch
  LABEL \
    name="$img" \
    org.opencontainers.image.version="$version" \
    org.opencontainers.image.authors="$author" \
    org.opencontainers.image.licenses="$license" \
    org.opencontainers.image.source="http://github.com/$repo.git" \
    org.opencontainers.image.revision="$revision" \
    org.opencontainers.image.created="$created"
	ADD $bin /$bin
	ADD image-metadata /etc/image-metadata
	ENTRYPOINT ["/$bin"]
	END

  echo "  - Building image $img:$version"
  docker build -t "$img:$version" .
  docker tag "$img:$version" "$img:latest"
}

# See: https://git.io/JtdlJ
setup_traps() {
  local trap_fun
  trap_fun="$1"

  local sig
  for sig in HUP INT QUIT ALRM TERM; do
    trap "
      $trap_fun
      trap - $sig EXIT
      kill -s $sig "'"$$"' "$sig"
  done

  if [ -n "${ZSH_VERSION:-}" ]; then
    eval "zshexit() { eval '$trap_fun'; }"
  else
    # shellcheck disable=SC2064
    trap "$trap_fun" EXIT
  fi
}

cleanup() {
  local workdir="$1"

  if [ -d "$workdir" ]; then
    echo "  - Cleanup up Docker context $workdir"
    rm -rf "$workdir"
  fi
}

die() {
  echo "" >&2
  echo "xxx $1" >&2
  echo "" >&2
  exit 1
}

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    die "Required command '$1' not found on PATH"
  fi
}

main "$@"
