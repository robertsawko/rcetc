# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE="(ls|task *)"
setopt appendhistory nomatch hist_ignore_all_dups
unsetopt beep extendedglob notify
#Vi keys
bindkey -v
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/c111269/.zshrc'

autoload -Uz compinit 
compinit
# End of lines added by compinstall
#

#Prompt configureation
autoload colors; colors
PROMPT="%{$fg[red]%}%U%n% @% %m%u %{$reset_color%}% %D %T
[%c]%#"

#Various key bindings
#Increamental backward search
#bindkey -M viins '^r' history-incremental-search-backward
#bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
#
typeset -A key

#Begginning history search with Vi arrows
bindkey -M viins "^k"    history-beginning-search-backward
bindkey -M viins "^j"    history-beginning-search-forward
bindkey -M viins "^h"    beginning-of-history
bindkey -M viins "^l"    end-of-history



#Direcotry stack auto setting
setopt auto_cd auto_pushd
export PATH=$PATH:~/bin

#History setup
setopt HIST_IGNORE_SPACE
#HIST_IGNOORE_SPACE
#
#Config for urlscan
export BROWSER=firefox

export EDITOR=vim


#Experimental feature spawn a new tmux session and reconnect to any accidentally unattached
#sessions...
#if [ "${HOST}" = "valencia" ]; then
  #if [ -z "${TMUX}" ] && which tmux >/dev/null ; then
    #TMUX_FIRST_UNATTACHED=$(tmux ls | grep -v "(attached)" | cut -d: -f1)
    #if [ -n "${TMUX_FIRST_UNATTACHED}" ]; then
      #exec tmux attach -t ${TMUX_FIRST_UNATTACHED}
    #else
      #exec tmux
    #fi
  #fi
#fi

#Useful(?) aliases
alias grep='grep --color=auto'
alias r='ranger'
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

alias of41='\
        source ${HOME}/OpenFOAM/OpenFOAM-4.1/etc/bashrc;\
        export ParaView_DIR=/home/rsa/OpenFOAM/ThirdParty-4.1/platforms/linux64Gcc/ParaView-5.0.1;\
        export PATH=$ParaView_DIR/bin:$PATH;\
        export PV_PLUGIN_PATH=$FOAM_LIBBIN/paraview-4.4'

alias of50='\
        source ${HOME}/OpenFOAM/OpenFOAM-5.0/etc/bashrc;\
        export ParaView_DIR=/home/rsa/OpenFOAM/ThirdParty-5.0/platforms/linux64Gcc/ParaView-5.0.1;\
        export PATH=$ParaView_DIR/bin:$PATH;\
        export PV_PLUGIN_PATH=$FOAM_LIBBIN/paraview-4.4'

alias foam_extend='\
        export FOAM_INST_DIR=~/OpenFOAM;\
        export QT_BIN_DIR=/usr/lib/qt4/bin;\
        export SCOTCH_INCLUDE_DIR=/usr/include/scotch;\
        export METIS_INCLUDE_DIR=/usr/include/;\
        source ${FOAM_INST_DIR}/foam-extend-3.0/etc/bashrc;'


#export PYTHONPATH=/usr/lib/paraview-4.1/site-packages:/usr/lib/paraview-4.1:/usr/lib/paraview-4.1/site-packages/paraview/vtk

export PYTHONSTARTUP=${HOME}/.pythonrc

alias emacs='emacs -nw'

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
            '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
            '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn


# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
        vcs_info
        if [ -n "$vcs_info_msg_0_"  ]; then
                echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
        fi
}
RPROMPT=$'$(vcs_info_wrapper)'

alias gnuplot='rlwrap -a -c gnuplot'
alias setproteus='export PATH=/home/robert/projects/proteus/linux2/bin:${PATH}'
alias esyson='\
        export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH;\
        export LIBRARY_PATH=/usr/local/lib/:$LIBRARY_PATH;\
        export PYTHONPATH=/usr/local/lib/python3.4/site-packages/:$PYTHONPATH;\
        export PATH=/usr/local/bin/:$PATH'

alias setdlproxy='\
        export http_proxy=http://wwwcache.dl.ac.uk:8080;\
        export ftp_proxy=http://wwwcache.dl.ac.uk:8080;\
        export https_proxy=http://wwwcache.dl.ac.uk:8080;'

alias firedrake='source ~/projects/firedrake/bin/activate'

alias printcolors='(\
        x=`tput op` y=`printf %76s`;\
        for i in {0..256};\
        do\
                o=00$i;\
                echo -e ${o:${#o}-3:3} `tput setaf $i;\
                tput setab $i`${y// /=}$x;\
        done)'

alias smv='rsync --remove-source-files'
