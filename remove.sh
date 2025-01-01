VAR_DESTINATION=""
VAR_WHITELIST=""

for arg in "$@"; do
  case $arg in
    DESTINATION=*)
      VAR_DESTINATION="$(realpath ${arg#*=})"
      shift
      ;;
    WHITELIST=*)
      VAR_WHITELIST="$(realpath ${arg#*=})"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.remove"
echo "Path:        $(pwd)"
echo "DESTINATION: $VAR_DESTINATION"
echo "WHITELIST:   $VAR_WHITELIST"
echo
if [[ ! -f "$VAR_WHITELIST" ]]; then
  echo "ERROR: Whitelist file not found: $VAR_WHITELIST"
  exit 1
fi
if ! grep -Fxq "$VAR_DESTINATION" "$VAR_WHITELIST"; then
  echo "ERROR: Target $VAR_DESTINATION is not in the whitelist!"
  exit 1
fi
if [[ -d "$VAR_DESTINATION" ]]; then
  rm -rf "$VAR_DESTINATION"
elif [[ -f "$VAR_DESTINATION" ]]; then
  rm -f "$VAR_DESTINATION"
else
  echo "ERROR: Target does not exist: $VAR_DESTINATION"
  exit 1
fi
if [ $? -eq 0 ]; then
    echo "Seems like $VAR_DESTINATION was successfully removed (Exit code 0)"
fi
if [ -e "$VAR_DESTINATION" ]; then
    echo "WARNING: The path $VAR_DESTINATION does still exist"
else
    echo "As expected the path $VAR_DESTINATION could not be found anymore"
fi
