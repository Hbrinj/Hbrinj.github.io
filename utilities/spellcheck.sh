MAIN_BRANCH=develop
ROOT_FOLDER=content
PREFIX=$(git rev-parse --show-toplevel)
CHANGED=$(git diff --name-only --line-prefix=$PREFIX/ $MAIN_BRANCH | grep "$ROOT_FOLDER")

function spellcheck() {
  for file in $@
  do
    if [[ -f "$file" ]]
    then
      ERRORS=$(cat $file | aspell --personal=$PREFIX/utilities/aspell.en.pws list)
      if [[ ${#ERRORS} -gt 0 ]]
      then
        tput setaf 2; echo $file; tput sgr0
        tput setaf 1; echo "$ERRORS"; tput sgr0
        echo ""
      fi
    fi
  done
}

spellcheck $CHANGED
