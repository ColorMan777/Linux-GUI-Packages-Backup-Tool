#!/bin/bash


while true; do

    # Choose between Save / Restore and Exit GUI
    ans=$(zenity --info --title 'Linux GUI Packages Backup Tool' \
        --width=300 --height=100 --icon-name=preferences-system-backup \
        --text 'Choose an action to backup your packages :' \
        --ok-label Save\
        --extra-button Restore --extra-button Cancel )
    rc=$?

    if [ ${rc}-${ans} = '0-' ] ; then # Save Code

        SAVE_PATH=`zenity --file-selection --save --title="Choose a save path for the packages list"`

        case $? in
            0)
                echo "\"$SAVE_PATH\" is selected."
                dpkg -l | grep ^ii | awk '{print $2}' > $SAVE_PATH;; # Actual Action
            1)
                echo "No files selected.";;
            -1)
                echo "Unexpected error.";;
        esac


    elif [ ${rc}-${ans} = '1-Restore' ] ; then # Restore Code

        LOAD_PATH=`zenity --file-selection --title="Choose a packages list to restore"`

        case $? in
            0)
                echo "\"$LOAD_PATH\" is selected."
                function install_ignore_fail { echo "$*" | xargs -n 1 sudo apt-get install -y; }

                 while ! zenity --password | sudo -S install_ignore_fail $(cat $LOAD_PATH); do # Actual Action
                    if $(zenity --question --text="Wrong password, would you like to cancel the installation?"); then
                    echo "no app-entry made, returning"
                    return;
                    fi
                done
                    #zenity --password | sudo apt-get install $(cat $LOAD_PATH);; # Actual Action
            1)
                echo "No files selected.";;
            -1)
                echo "Unexpected error.";;
        esac


    else # Exit Code
        exit

    fi

    #echo "${rc}-${ans}"

done
