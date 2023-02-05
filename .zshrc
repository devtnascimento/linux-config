clear

export ZSH="$HOME/.oh-my-zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    spaceship-vi-mode
    spaceship-ember
)

source $ZSH/oh-my-zsh.sh


alias zsh-config="code ~/.zshrc"
alias zrc="source ~/.zshrc"
alias spaceship-config="code ~/.spaceshiprc.zsh"

alias i3-config="code ~/.i3/config"
alias i3-wclass="xprop | grep -e 'CLASS'"
alias ws-dir="cd ~/.i3/workspaces"
alias wdev-config="code ~/.i3/workspaces/wdev"

alias kobold-aws-ls-ec2="aws ec2 describe-instances --filters 'Name=tag:Name,Values=kobold-test-instance-1,kobold-test-instance-2'"

alias work-dir="code ~/projects"



# Terraform
alias tf="terraform"


WS_DEFAULT="wdev"
ws-list(){
    declare -a arrFiles
    work_dir=$(pwd)
    cd ~/.i3/workspaces
    for file in *
    do 
        arrFiles=("${Pics[@]}" "$file")
    done
    cd $work_dir
}

ws(){
    WS="$1"
    if [ $WS='' ];
    then
        i3-msg "workspace $WS_DEFAULT; append_layout /home/devtnascimento/.i3/workspaces/$WS_DEFAULT"
        work-dir
        terminator -p dev
        brave       
    else
        i3-msg "workspace $WS; append_layout /home/devtnascimento/.i3/workspaces/$WS"
        work-dir
        terminator -p dev
        i3-msg "workspace prev;kill;workspace next;exec brave"  
    fi
}





