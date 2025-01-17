VAR_DESTINATION=""
VAR_OWNER=""
VAR_GROUP=""
VAR_FILE_MASK=""
VAR_DIR_MASK=""

for arg in "$@"; do
  case $arg in
    DESTINATION=*)
      VAR_DESTINATION="$(realpath "${arg#*=}")"
      shift
      ;;
    OWNER=*)
      VAR_OWNER="${arg#*=}"
      shift
      ;;
    GROUP=*)
      VAR_GROUP="${arg#*=}"
      shift
      ;;
    FILE_MASK=*)
      VAR_FILE_MASK="${arg#*=}"
      shift
      ;;
    DIR_MASK=*)
      VAR_DIR_MASK="${arg#*=}"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      bisonbackup.general.permissions"
echo "Path:        $(pwd)"
echo "DESTINATION: $VAR_DESTINATION"
echo "OWNER:       $VAR_OWNER"
echo "GROUP:       $VAR_GROUP"
echo "FILE_MASK:   $VAR_FILE_MASK"
echo "DIR_MASK:    $VAR_DIR_MASK"
echo
VAR_ANYCHANGESMADE=2
if [[ -n "$VAR_OWNER" ]]; then
  chown -R "$VAR_OWNER" "$VAR_DESTINATION"
  if [ $? -eq 0 ]; then
    echo "Seems like the owner permission $VAR_OWNER was successfully applied (Exit code 0)"
  fi
  VAR_ANYCHANGESMADE=1
fi
if [[ -n "$VAR_GROUP" ]]; then
  chown -R :"$VAR_GROUP" "$VAR_DESTINATION"
  if [ $? -eq 0 ]; then
    echo "Seems like the group permission $VAR_GROUP was successfully applied (Exit code 0)"
  fi
  VAR_ANYCHANGESMADE=1
fi
if [[ -n "$VAR_DIR_MASK" ]]; then
  find "$VAR_DESTINATION" -type d -exec chmod "$VAR_DIR_MASK" {} \;
  if [ $? -eq 0 ]; then
    echo "Seems like the directory permissions $VAR_DIR_MASK were successfully applied (Exit code 0)"
  fi
  VAR_ANYCHANGESMADE=1
fi
if [[ -n "$VAR_FILE_MASK" ]]; then
  find "$VAR_DESTINATION" -type f -exec chmod "$VAR_FILE_MASK" {} \;
  if [ $? -eq 0 ]; then
    echo "Seems like the file permissions $VAR_FILE_MASK were successfully applied (Exit code 0)"
  fi
  VAR_ANYCHANGESMADE=1
fi
if [ $VAR_ANYCHANGESMADE -eq 2 ]; then
  echo "Looks like no operations were run this time"
  echo "Maybe you didn't specify any of the parameters?"
fi
