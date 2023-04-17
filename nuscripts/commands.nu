def fzh [x: string = ""] {
  fd --type f -H | fzf --query $x
}

def ll [path: string = ""] {
  ls $path | grid -c
}
