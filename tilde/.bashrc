# default file protections
umask 022

# we like emacs
export EDITOR=emacs

# show file types
alias ls="ls -F"

# ssh-agent setup
SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# OS detection from bash: http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
if [[ "$OSTYPE" == "darwin"* ]]; then
    # jdk selection for OSX: http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
    function setjdk() {
	if [ $# -ne 0 ]; then
	    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
	    if [ -n "${JAVA_HOME+x}" ]; then
		removeFromPath $JAVA_HOME
	    fi
	    export JAVA_HOME=`/usr/libexec/java_home -v $@`
	    export PATH=$JAVA_HOME/bin:$PATH
	fi
    }

    function removeFromPath() {
	export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
    }

    setjdk 1.7
fi
