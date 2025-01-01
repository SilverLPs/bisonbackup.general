VAR_SOURCE=""
VAR_DESTINATION=""
VAR_TIMEINNAME=""
VAR_FILEPATH=""

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
    TIMEINNAME=*)
      VAR_TIMEINNAME="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.filelist"
echo "Path:        $(pwd)"
echo "SOURCE:      $VAR_SOURCE"
echo "DESTINATION: $VAR_DESTINATION"
if [ "$VAR_TIMEINNAME" = "yes" ]; then
    echo "TIMEINNAME:  yes"
    VAR_FILEPATH="$VAR_DESTINATION"-"$(date +\%Y\%m\%d)-$(date +\%H\%M\%S)".txt
else
    echo "TIMEINNAME:  no"
    VAR_FILEPATH="$VAR_DESTINATION".txt
fi
echo
ls -lAhR --group-directories-first "$VAR_SOURCE/" &> "$VAR_FILEPATH"
if [ $? -eq 0 ]; then
    echo "Seems like filelist $VAR_FILEPATH was successfully created (Exit code 0)"
fi
if [ -f "$VAR_FILEPATH" ]; then
    echo "The file $VAR_FILEPATH does exist"
else
    echo "The file $VAR_FILEPATH could not be found"
fi
