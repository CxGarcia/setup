
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  k=0
  i="$HOME/Documents/codeworks"
  for entry in "$i"/*
  do
    echo COMPREPLY[k++]=${entry#$i/}
  done



  # for j in $( compgen -f "$i/$cur" ); do # loop trough the possible completions
  #   echo ${j#$i}
  #   [ -d "$j" ] && j="${j}/" || j="${j} " # if its a dir add a shlash, else a space
  #   COMPREPLY[k++]=${j#$i/} # remove the directory prefix from the array
  # done

  # echo $COMPREPLY





  # COMPREPLY=()
  # cur=${COMP_WORDS[COMP_CWORD]}
  # k=0
  # i="$HOME/Documents/codeworks/" # the directory from where to start
  # for j in $( compgen -f "$i/" ); do # loop trough the possible completions
  #   [ -d "$j" ] && j="${j}/" || j="${j} " # if its a dir add a shlash, else a space
  #   COMPREPLY[k++]=${j#$i} # remove the directory prefix from the array
  # done

  # echo $COMPREPLY