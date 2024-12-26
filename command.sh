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
echo "Name:      command"
echo "Package:   bisonbackup.general"
echo "Path:      $(pwd)"
echo "Shell:     $SHELL"
echo "Time:      $(date +\%Y\%m\%d)-$(date +\%H\%M\%S)"
echo "User:      $(whoami)"
echo "COMMAND:   $VAR_COMMAND"
echo
$VAR_COMMAND
