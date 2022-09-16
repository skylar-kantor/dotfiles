if [ "$HOSTNAME" = "icarus" ]; then
    nitrogen --restore
    ./layout.sh
else if [ "$HOSTNAME" = "Cronus" ]; then
	 feh --bg-fill bg.jpg
     fi
fi
