# ADD A TASK
#   1. Within the already created add_task function, there is a variable named task_text which is the result of the input() function which prompts the user to type in something.
#       This input() function is a new function that you haven't seen before. It is essentially the opposite of the print() function. This allows for the user to input text when called.
#   2. Create a dictionary that uses the task_text variable as the name and sets completed to False.
#   3. Add the dictionary to the tasks list.
#   4. Within the while loop, add an elif statement that checks if the variable decision (defined within the while loop that allows the user to input a number) is 2, call the add_task function.

# REMOVE A TASK
#   1. You will need a function to handle this.
#   2. When this function is run, list out the tasks.
#       Hint! There is already a function that handles the listing of tasks.
#   3. Create a variable that uses input(). The user should be able to input the index number of the task to be removed.
#       Hint! You will need to wrap the input() function within the int() function so the user's input is read as a number.
#   4. Write the functionality to be able to delete the task in the list tasks based on the variable you created above.
#   5. Within the while loop, add an elif statement that allows your new function to be run when the correct menu option is chosen.

# Mark a task complete
#   1. You will need a function to handle this.
#   2. When this function is run, list out the tasks.
#       Hint! There is already a function that handles the listing of tasks.
#   3. Create a variable that uses input. The user should be able to input the index number of the task to be marked complete.
#       Hint! You will need to wrap the input() function within the int() function so the user's input is read as a number.
#   4. Mark the task as complete in the list tasks based on the variable you created above.
#       Hint! you will need to use two sets of square brackets to find the index and set the appropriate key to True.
#   5. Within the while loop, add an elif statement that allows your new function to be run when the correct menu option is chosen.


tasks = [
    {'name' : 'Write email to Jan', 'completed' : True},
    {'name' : 'Sweep front porch', 'completed' : True},
    {'name' : 'Call mom', 'completed' : False}
]


def list_tasks():
    for index, task in enumerate(tasks):
        print(str.format('{}: {} (Completed: {})', index, task['name'], task['completed']))


def add_task():
    task_text = input('Please add a task: ')
    new_task = {'name' : task_text, 'completed': False}
    tasks.append(new_task)


def remove_task():
    list_tasks()
    remove_task = int(input('Please enter the number of the task to be removed:'))
    tasks.remove(tasks[remove_task])


def complete_task():
    list_tasks()
    complete_text = int(input('Please enter the number of the task you completed:'))
    tasks[complete_text]['completed'] = True


menu_text = """
====================
1. List the tasks
2. Add a task
3. Remove a task
4. Mark task complete
5. Quit

What would you like to do? """


program_is_running = True


while program_is_running:
    decision = input(menu_text)
    
    if decision == '1':
        list_tasks()
        
    elif decision == '2':
        add_task()
        
    elif decision == '3':
        remove_task()
        
    elif decision == '4':
        complete_task()
        
    elif decision == '5':
        program_is_running = False
        
    else:
        print('please choose a valid option')