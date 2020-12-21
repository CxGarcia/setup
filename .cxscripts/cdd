#Get last argument
while getopts ":f:cn" opt; do
  case ${opt} in
    f)
      f=${OPTARG}
      printf "\t\e[93mOpening $f...\e[0m\n"
      cd $HOME/Documents/codeworks/$f
      sleep 1
      ;;
    c)
      printf "\t\e[93mOpening VS Code...\e[0m\n"
      sleep 1
      code .
      ;;
    n)
      printf "\t\e[93mStarting dev server in: \n"
      sleep 1

      i=10
      while [ $i -gt 0 ]; do
        printf "\t\e[93m$i...\n"
        sleep 1
        i=$[i-1]
      done
      npm start
      ;;
  esac
done