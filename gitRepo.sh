#!/usr/bin/bash

storePAT='y'

function prettyPrint () {
    echo "-------------------------------------------------------"
    echo "$1"
    echo "-------------------------------------------------------"
}

function getCredentials(){    
    touch credentials.env
    chmod 700 credentials.env

    prettyPrint "Before we get started!
We wanna know you a little better"
prettyPrint "Kindly enter your GitHub username: "
    read USERNAME
prettyPrint "Kindly enter your GitHub Personal Access Token: "
    read -s PAT
prettyPrint "Do you want to store your Personal Access Token in credentials.env file? (y/n)"
    read storePAT

echo "USERNAME=$USERNAME" > credentials.env
    if [[ $storePAT == 'y' ]]; then
        echo "PAT=$PAT" >> credentials.env
    fi
}

function getRepoDetails(){
    prettyPrint "Name of the GitHUb repository: "
    read name
}

function createNewRepo(){
    curl -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $PAT" \
    -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/user/repos \
    -d "{\"name\":\"$name\"}"
}

function createLocalDirectory(){
    link="git@github.com:$USERNAME/$name.git"
    mkdir $name
    cp ./credentials.env ./$name
    cp ./gitRepo.sh ./$name
    rm ./credentials.env
    cd $name
    git init
    echo 'gitRepo.sh' > .gitignore
    echo 'credentials.env' >> .gitignore
    echo "# $name" > README.md
    git add .
    git commit -m "initial commit"
    git branch -M main
    git remote add origin $link
    git push -u origin main
}

function main(){
    prettyPrint "
    Welcome to Git Automator
    "
    getCredentials
    getRepoDetails
    createNewRepo
    createLocalDirectory
}

main