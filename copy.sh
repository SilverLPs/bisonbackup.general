VAR_SOURCE=""
VAR_DESTINATION=""

for arg in "$@"; do
  case $arg in
    SOURCE=*)
      VAR_SOURCE="$(realpath ${arg#*=})"
      shift
      ;;
    DESTINATION=*)
      VAR_DESTINATION="$(realpath ${arg#*=})"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.copy"
echo "Path:        $(pwd)"
echo "SOURCE:      $VAR_SOURCE"
echo "DESTINATION: $VAR_DESTINATION"
echo
escaped_source=$(printf '%q' "$VAR_SOURCE")
escaped_destination=$(printf '%q' "$VAR_DESTINATION")
cp -rv "$VAR_SOURCE" "$VAR_DESTINATION" | grep "^'$escaped_source' -> '$escaped_destination'$"
