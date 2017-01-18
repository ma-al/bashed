# Aliases/Shortcuts for Vim

function previm
{
   file="$1"
   echo

   if [ $# -gt 1 ]; then
      echo "Augh! I can only handle one argument!";
      echo
      echo "If you wanted vim to open up multiple files..."
      echo "... do $(which vim) file1 file2 instead.";
      echo; return
   fi

   if [[ $file == *" "* ]]; then
      echo "Augh! Please sir, I cannot handle spaces in file names.";
      echo; return
   fi

   echo "Opening ($file)...";
   echo

   if [ -z "$file" ]; then
      echo "Nein! Nein! Nein! No file was given!";
      echo; return
   fi

   if [ -d $file ]; then
      echo "Sacre blue! ($file) es un directory monsieur!";
      echo; return
   fi

   if [ ! -e $file ]; then
      echo "($file) is having existential issues.";
      echo -n "Create it? (y/n): ";
      read yesno

      if [ "$yesno" == "y" ]; then
         echo
         touch $file || return

         echo "($file) has materialized from the warp!"
         echo; /usr/bin/vim $file
      fi

      echo; return
   fi

   if [ ! -w $file ]; then
      echo "Deus mio! ($file) is not writable by ($USER)";
      echo; return
   fi

   echo; /usr/bin/vim $file
}
alias vim="previm"
