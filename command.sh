VAR_COMMAND=""

for arg in "$@"; do
  case $arg in
    COMMAND=*)
      VAR_COMMAND="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.command"
echo "Path:        $(pwd)"
echo "COMMAND:     $VAR_COMMAND"
echo
$VAR_COMMAND
