#!/bin/bash 

echo "Welcome to the User Managmant in KRM Web Server "
#read User input

a=$1
if [ -z "$1" ];then 
    echo "Please Tell Me How i can Help You " 

    echo "1.Create New User"
    echo "2.Change Password For User"
    echo "3.Create New User Group"
    echo "4.Add User into User Group"
    echo "5.Show User List"
    echo "6.Show Group List"

    read -p "Enter Your Choice :" choice
else 
    choice=$1
fi


case $choice in 
    1)
        echo -e "\nWelcome to New User Craeting Module...."
        echo -e "Please Enter User Name : "
        read username;
        echo -e "Please Enter User Password : "
        read password;
        sudo useradd -m "$username"
        echo "$username:$password" | sudo chpasswd
        echo "User $username has been created."
    ;;
    2)
        echo -e "\nWelcome to Password Changing Module...."
        echo -e "Please Enter User Name : "
        read username;
        echo -e "Please Enter User Password : "
        read password;
        echo "$username:$password" | sudo chpasswd
        echo "Password Changed For $username"
    ;;
    3)
        echo -e "\nWelcome to New Group Craeting Module....."
        echo -e "Please Enter User Name : "
        read group;
        sudo groupadd "$group"
    ;;
    4)
        echo -e "Add User in to group....."
        echo -e "Please Enter Group Name : "
        read group;
        echo -e "Please Enter User Name : "
        read username;
        sudo usermod -aG "$group" "$username"
    ;;
    5)
        echo -e "User List is Here....."
        cat /etc/passwd
    ;;
    6)
        echo -e "Group List is Here....."
        cat /etc/group
    ;;
    *)
        echo "This Service is Not Available"
    ;;
esac


echo "Thank You"