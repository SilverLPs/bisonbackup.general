VAR_SOURCE=""
VAR_DESTINATION=""
VAR_COMPRESS=""

for arg in "$@"; do
  case $arg in
    SOURCE=*)
      VAR_SOURCE="${arg#*=}"
      shift
      ;;
    DESTINATION=*)
      VAR_DESTINATION="$(realpath "${arg#*=}")"
      shift
      ;;
    COMPRESS=*)
      VAR_COMPRESS="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.archive"
echo "Path:        $(pwd)"
echo "SOURCE:      $VAR_SOURCE"
echo "DESTINATION: $VAR_DESTINATION"
if [ "$VAR_COMPRESS" = "yes" ]; then
    echo "COMPRESS:    yes"
else
    echo "COMPRESS:    no"
fi
echo
if [ "$VAR_COMPRESS" = "yes" ]; then
    tar -czf "$VAR_DESTINATION" "$VAR_SOURCE"
else
    tar -cf "$VAR_DESTINATION" "$VAR_SOURCE"
fi
if [ $? -eq 0 ]; then
    echo "Seems like $VAR_DESTINATION was successfully archived (Exit code 0)"
fi
if [ -f "$VAR_DESTINATION" ]; then
    echo "The file $VAR_DESTINATION does exist"
else
    echo "The file $VAR_DESTINATION could not be found"
fi
