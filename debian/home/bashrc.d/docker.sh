alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcr="docker compose restart"
alias vdc="vi docker-compose.yml"
# BEGIN docker completion list

_docker_containers() {
  local cur
  cur="${COMP_WORDS[COMP_CWORD]}"

  COMPREPLY=(
    $(compgen -W "$(docker ps --format '{{.Names}}')" -- "$cur")
  )
}
# END docker completion list
# BEGIN docker exec alias
de() {
  docker exec -it "$1" sh
}
complete -F _docker_containers de
# END docker exec alias
# BEGIN docker logs alias
dl() {
  docker logs --follow --tail=100 $1
}
complete -F _docker_containers dl
# END docker logs alias
