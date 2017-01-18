# Aliases/Shortcuts for Vim

function previm
{
   file="$1"
   echo

   if [ $# -gt 1 ]; then
      echo "Cannot open multiple files."
      echo; return
   fi

   if [[ $file == *" "* ]]; then
      echo "Cannot handle spaces in file names.";
      echo; return
   fi

   echo "Opening ($file)...";
   echo

   if [ -z "$file" ]; then
      echo "No file given.";
      echo; return
   fi

   if [ -d $file ]; then
      echo "Cannot open directory.";
      echo; return
   fi

   if [ ! -e $file ]; then
      echo "($file) does not exist.";
      echo; return
   fi

   if [ ! -w $file ]; then
      echo "($file) is not writable by ($USER)";
      echo; return
   fi

   echo; /usr/bin/vim $file
}
alias vim="previm"
