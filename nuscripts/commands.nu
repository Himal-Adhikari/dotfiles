def fzh [x: string = ""] {
  (fd --type f -H | fzf --query $x)
}

def ll [
  path: string = "" # The path of the directory
  --all(-a) # Show hidden files and directories 
] {
  if $all {
    ls -a $path | sort-by type name -i | grid -c --separator "   " | str trim
  } else {
    ls $path | sort-by type name -i | grid -c --separator "   " | str trim
  }
}
