VAR_SCRIPT=""

for arg in "$@"; do
  case $arg in
    SCRIPT=*)
      VAR_SCRIPT="$(realpath "${arg#*=}")"
      shift
      ;;
    ARGUMENTS=*)
      VAR_ARGUMENTS="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.script"
echo "Path:        $(pwd)"
echo "SCRIPT:      $VAR_SCRIPT"
echo "ARGUMENTS:   $VAR_ARGUMENTS"
echo
$SHELL "$VAR_SCRIPT" "$VAR_ARGUMENTS"
