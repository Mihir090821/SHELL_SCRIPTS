#!/bin/bash

<<readme

Note : This script is created for the backup server Scripts

Usage : 
./backup_and_rotation.sh <source path>  <backup folder path>

readme

function display_usage {
    echo "Usage : ./backup_and_rotation.sh <source path>  <backup folder path>"
}


if [ $# -eq 0 ] ;then
    display_usage
fi


source_dir=$1;
backup_dir=$2;
timestamp=$(date '+%Y-%m-%d-%H-%M-%S');

function create_backup {
    echo "Creating backup of $source_dir"
    zip -r "${backup_dir}backup_${timestamp}.zip" "${source_dir}" > /dev/null
    
    if [ $? -eq 0 ]; then
        echo "Backup created successfully"
    fi

}

function perform_rotation {
    backups=($(ls -t "${backup_dir}"*.zip  2> backup.log))

    if [ "${#backups[@]}" -gt 5 ] ;then
        backup_to_remove=("${backups[@]:5}")
        for backup in "${backup_to_remove[@]}";
        do
            rm -f ${backup}
        done
    fi
}

create_backup
perform_rotation


