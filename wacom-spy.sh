export XOURNAL_TRACE=""
while true; 
	do 
		export XOURNAL_TRACE_NEW=$(xprop -id $(xprop  -root _NET_ACTIVE_WINDOW |sed -rn "s/.* # (0x[0-9AF]+)/\1/p")|grep xournal); 
		if [ "$XOURNAL_TRACE_NEW" != "$XOURNAL_TRACE" ] && [ "$XOURNAL_TRACE_NEW" != "" ]
		then 
			~/wxournal.sh 
			export XOURNAL_TRACE=$XOURNAL_TRACE_NEW
		fi
		sleep 1
	done

