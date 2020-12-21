_flist () {
  COMPREPLY=()
  k=0
  i="$HOME/Documents/codeworks"

  for entry in "$i"/*
  do
    COMPREPLY[k++]=${entry#$i/}
  done
  return null
}

complete -o nospace -F _flist cdd

