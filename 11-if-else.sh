#!/bin/bash 

#  [ -z "$var" ]
# [ -n "$var" ]

ACTION=$1 

# Demo On If Else 
# if [ "$ACTION" = "start" ] ; then 
#     echo "Selected choice is start"

# else 
#     echo "Only valid option is start"
# fi 


# Demo on Else If 

if [ "$ACTION" = "start" -o "$ACTION" = "Start" -o "$ACTION" = "START"] ; then 

    echo "Starting XYZ Service"

    elif [ "$ACTION" = "stop" ] ; then 
        if []
        echo "Stopping XYZ Service" 

    elif [ "$ACTION" = "restart" ] ; then 
        echo "Restarting XYZ Service" 

    else 
        echo -e "Valid options are \e[31m start or stop or restart only \e[0m"
fi 