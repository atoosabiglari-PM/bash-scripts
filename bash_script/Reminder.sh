#!/bin/bash

#Declare arrays to hold  task details: name, priority, due date, and status
declare -a task_name
declare -a task_priority
declare -a task_due_date
declare -a task_status

#function to add a task
add_task() {
    read -p "Enter task name:" task_name
    read -p "Enter task priority (1 = High, 2 = Medium, 3 = Low):" task_priority
    read -p "Enter task due date (YYYY-MM-DD):" task_due_date
    read -p "Enter task status (Pending/Completed):" task_status

    # Add task to arrays in details 
    task_name+=("$task_name")
    task_priority+=("$task_priority")
    task_due_date+=("$task_due_date")
    task_status+=("$task_status")

    echo "Task  '$task_name' added successfully!"
}
#function to view all tasks
view_tasks() {
    if [ ${#task_name[@]} -eq 0 ]; then
        echo "No tasks available."
    else
        echo "Task List:"
        echo "-------------------------"
    for i in "${!task_name[@]}"; do
        echo "$((i+1)). ${task_name[$i]} | Priority: ${task_priority[$i]} | Due Date: ${task_due_date[$i]} | Status: ${task_status[$i]}"
        done
        echo "-------------------------"
    fi
    }

#function to update a task
update_task() {
    view_tasks
    read -p "Enter the task number to update:" task_number
    if [ $task_number -gt 0 ] && [ $task_number -le ${#task_name[@]} ]; then
        read -p "Enter new task name (leave blank to keep current):" new_task_name
        read -p "Enter new task priority (1 = High, 2 = Medium, 3 = Low, leave blank to keep current):" new_task_priority
        read -p "Enter new task due date (YYYY-MM-DD, leave blank to keep current):" new_task_due_date
        read -p "Enter new task status (Pending/Completed, leave blank to keep current):" new_task_status

        # Update task details in arrays
        if [ ! -z "$new_task_name" ]; then
            task_name[$((task_number-1))]="$new_task_name"
        fi
        if [ ! -z "$new_task_priority" ]; then
            task_priority[$((task_number-1))]="$new_task_priority"
        fi
        if [ ! -z "$new_task_due_date" ]; then
            task_due_date[$((task_number-1))]="$new_task_due_date"
        fi
        if [ ! -z "$new_task_status" ]; then
            task_status[$((task_number-1))]="$new_task_status"
        fi

        echo "Task '$task_name' updated successfully!"
    else
        echo "Invalid task number."
    fi
}


#function to delete a task
delete_task() {
    read -p "Enter the task index to delete:" task_number
      if (($task_index > 0 && $task_index <= ${#task_name[@]})); then
        task_index=$((task_number-1))
        unset 'task_name[task_index]'
        unset 'task_priority[task_index]'
        unset 'task_due_date[task_index]'
        unset 'task_status[task_index]'
        # Remove the task from the arrays

        echo "Task deleted successfully!"
    else
        echo "Invalid task index."
    fi
}
#function to search for a task
search_task() {
    read -p "Enter the task name or part of the name to search " search_term
    echo "Searching for tasks containing '$search_term'..."
    found=false
    for i in "${!task_name[@]}"; do
        if [[ "${task_name[$i]}" == *"$search_term"* ]]; then
            echo "$((i+1)). ${task_name[$i]} | Priority: ${task_priority[$i]} | Due Date: ${task_due_date[$i]} | Status: ${task_status[$i]}"
            found=true
        fi
    done

    if ! $found; then
        echo "No tasks found matching '$search_term'."
    fi
}
#Function to update task status
update_task_status() {
    read -p "Enter the task index to update status:" task_index
    if ((task_index > 0 && task_index <= ${#task_name[@]})); then
        task_index=$((task_number-1))
        read -p "Enter new task status (Pending/Completed):" new_status
        task_status[$task_index]="$new_status"
        echo "Task status updated '$new_status' successfully!"
    else
        echo "Invalid task index."
    fi
}

#Function to sort task by priority
sort_tasks_by_priority() {
    echo "Sorting tasks by priority..."
    for i in "${!task_priority[@]}"; do
        for j in $(seq $((i+1)) ${#task_priority[@]}); do
            if [ "${task_priority[$i]}" -gt "${task_priority[$j]}" ]; then
                # Swap tasks
                temp_name="${task_name[$i]}"
                task_name[$i]="${task_name[$j]}"
                task_name[$j]="$temp_name"

                temp_priority="${task_priority[$i]}"
                task_priority[$i]="${task_priority[$j]}"
                task_priority[$j]="$temp_priority"

                temp_due_date="${task_due_date[$i]}"
                task_due_date[$i]="${task_due_date[$j]}"
                task_due_date[$j]="$temp_due_date"

                temp_status="${task_status[$i]}"
                task_status[$i]="${task_status[$j]}"
                task_status[$j]="$temp_status"
            fi
        done
    done

    echo "Tasks sorted by priority!"
}
#Function to display menu
display_menu() {
    echo "Task Reminder Menu"
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Update Task"
    echo "4. Delete Task"
    echo "5. Search Task"
    echo "6. Update Task Status"
    echo "7. Sort Tasks by Priority"
    echo "8. Exit"
}
#Main Function to run the task reminder program
main() {
    while true; do
        display_menu
        read -p "Select an option (1-8):" choice
        case $choice in
            1) add_task ;;
            2) view_tasks ;;
            3) update_task ;;
            4) delete_task ;;
            5) search_task ;;
            6) update_task_status ;;
            7) sort_tasks_by_priority ;;
            8) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}
#Run the main function
main
#End of script
#This script is a simple task reminder program that allows users to add, view, update, delete, search, and sort tasks based on priority.
#It uses arrays to store task details and provides a menu-driven interface for user interaction.
#The script is designed to be user-friendly and provides feedback for each action taken.
#The script is a simple task reminder program that allows users to add, view, update, delete, search, and sort tasks based on priority.
#It uses arrays to store task details and provides a menu-driven interface for user interaction.
#The script is designed to be user-friendly and provides feedback for each action taken.
#The script is a simple task reminder program that allows users to add, view, update, delete, search, and sort tasks based on priority.
#It uses arrays to store task details and provides a menu-driven interface for user interaction.