# 🧰 bisonbackup.general
BisonBackup general-purpose modules for simple operations

This module package is a part of the BisonBackup project. For more information about the project and detailed usage instructions, please refer to the [project site](https://github.com/SilverLPs/BisonBackup).

---

## Requirements
This package relies solely on standard Linux utilities commonly available on most Linux systems. 
No additional dependencies should be required.  
However, please note that these modules have only been tested with the Bash shell, and compatibility with other shells cannot be guaranteed.

---

## Modules
Below is a list of all modules currently included in this package, along with their respective parameters:

**command** - Executes a command via the shell.
- COMMAND = The full command (including arguments) to be executed.

**script** - Executes a specified file via the shell.
- SCRIPT = Path to the script to be executed.
- ARGUMENTS = Additional arguments to pass to the script during execution (optional).

**copy** - Copies a file or directory, including all its contents.
- SOURCE = Path to the source file or directory.
- DESTINATION = Path to the destination file or directory.

**remove** - Deletes a file or directory, including all its contents.
- DESTINATION = Path to the file or directory to be deleted.
- WHITELIST = Path to a text file that must include the destination as an absolute path. This is a safety measure to prevent unintended deletions due to potential script errors.

**permissions** - Modifies UNIX permissions for a file or directory, including all its contents.
- DESTINATION = Path to the file or directory whose permissions will be modified.
- OWNER = The username to which the ownership of the destination should be assigned (optional).
- GROUP = The group to which the destination should be assigned (optional).
- FILE_MASK = Umask specifying the permissions for files within the destination (optional).
- DIR_MASK = Umask specifying the permissions for directories within the destination (optional).

**archive** - Archives a file or directory, including all its contents, as a tarball.
- SOURCE = Path to the file or directory to be archived.
- DESTINATION = Path to the resulting archive file.
- COMPRESS = Specify “yes” to compress the archive with gzip (optional).

**filelist** - Generates a list of all files and directories, including all subcontents, within a directory.
- SOURCE = Path to the directory to be listed.
- DESTINATION = Path to the text file where the list will be saved.
- TIMEINNAME = Specify “yes” to append the current date and time to the filename of the text file (optional).

---

## License and Disclaimer

This software is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

### Disclaimer of Warranty and Responsibility

BisonBackup is a private project developed in my spare time. It is provided "as is" without any warranty of any kind, either expressed or implied. I cannot offer any guarantees regarding its functionality, security, or suitability for a specific purpose. Anyone using the software does so entirely at their own risk.

### Use at Your Own Risk

Users are encouraged to thoroughly review the scripts and modules before using them. The software, including BisonBackup itself and all associated modules, is intended for technically proficient users who understand the potential risks and can assess whether the software meets their requirements. If you are not confident in your technical ability to understand or review the code, I strongly advise against using this software.

### Recommendations for Technical Users

- Carefully review the provided scripts and configurations before running them.
- Test the software in a safe environment before applying it to critical data or systems. 
- Use the software only if you are comfortable with its functionality and limitations.

This project is not intended for non-technical users, and I explicitly discourage anyone without a strong technical understanding from using this software.
