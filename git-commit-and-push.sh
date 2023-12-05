#!/bin/bash



#### start to doCheckAndCommitAndPush
git config user.name "example"
git config user.email "example@example.com"
export defaultGitCommitMessage="update project"
git status


needCommit=$(git status --porcelain)
if [ -z "$needCommit" ]; then
echo -e "\033[32m nothing to commit! \033[0m"
return
fi
echo -e "with user.name:\033[32m $(git config user.name) \033[0m "
echo -e "with user.email:\033[32m $(git config user.email) \033[0m "

echo -ne "git add? \033[32m [y/n] \033[0m"
#read -p"default [y]: " add
read add

if [ "$add" = "n" ]; then
        echo -e '\033[31m git add aborted! \033[0m'
        exit 0
fi
git add .

git status



echo -ne "git commit? \033[32m [y/n] \033[0m"
read commit

if [ "$commit" = "n" ]; then
        echo -e '\033[31mgit commit aborted! \033[0m'
        exit 0
fi

echo -ne "\033[32mgit commit message: \033[0m"
read cmsg
if [ "$cmsg" = "" ]; then
        cmsg=$defaultGitCommitMessage
fi

git commit -m\""$cmsg"\"
git status

echo -ne "git push? \033[32m [y/n] \033[0m"
read push
if [ "$push" = "n" ]; then
        echo -e '\033[31m git push aborted! \033[0m'
        exit 0
fi
git push
echo -e '\033[32m [ok] git push finished! \033[0m'