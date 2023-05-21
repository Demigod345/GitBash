#!/usr/bin/bash

key=''

function prettyPrint () {
    echo "-------------------------------------------------------"
    echo "$1"
    echo "-------------------------------------------------------"
}

function gitSetup () {
    git config --global user.signingkey $1
    git config --global commit.gpgsign true
    gpg --export --armor $1 | cat
}

function create_New_Key(){
    gpg --full-generate-key
    prettyPrint "New key has been generated!
It is the key with the last index."
}

loop=1

function showOptions(){
    local choice

    prettyPrint "1. Use an existing GPG key
2. Create a new GPG key
3. Delete an existing GPG key
4. Exit
    
    Enter your choice: "
    read choice

    if [[ $choice -eq 4 ]]; then
        prettyPrint "Okay Exiting, Have a nice day!"
        loop=0
        return
    
    
    elif [[ $choice -eq 3 ]]; then
        delete_GPG_Key


    elif [[ $choice -eq 2 ]]; then
        create_New_Key


    elif [[ $choice -eq 1 ]]; then
        display_Existing_Keys
        prettyPrint "Setting up this key: $key"
        gitSetup $key

    else
        prettyPrint "Enter correct choice, you dumbfuck!"
        showOptions

    fi

}

function delete_GPG_Key(){
    display_Existing_Keys
    gpg --delete-secret-key $key
    gpg --delete-key $key
    prettyPrint "The key of your choice is no more."
}
    
function display_Existing_Keys(){

    keys=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/{print $2}' | awk -F/ '{print $2}')

    j=0
    k=0
    x=0
    index=0
    declare -a keyarr
    keylen=${#keys}
    number=$((($keylen)/16))
    i=0

    for ((z=0; z<$number;z++)); do
      keyarr[$j]=${keys:$i+0:16}
      j=$((j+1))
      i=$((i+17))
    done

    echo "------------------------------------------------------- "
    echo "Your Keys are:
Index    Key"
    for word in "${keyarr[@]}"; do
	echo "$x        $word"
	x=$((x+1))
    done

echo ""

    echo "Type the index of the GPG key required
Enter index: "
    echo "-------------------------------------------------------"

    read index

	key=${keyarr[index]}
    echo $key 

}

while [ $loop -eq 1 ] 
    do
        showOptions
done
