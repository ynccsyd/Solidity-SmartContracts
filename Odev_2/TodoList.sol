// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;
//INSERT, UPDATE, READ from array of structs
contract TodoList {
    struct Todo{
        string text;
        bool completed;
    }
    Todo[] public todos;

    //creating new todo text with two parameters (_text,completed)
    function CREATE (string calldata _text) external{
        todos.push(Todo({
            text:_text,
            completed:false
        }));

    }

    //updating index and text
    function UPDATETEXT (uint _index, string calldata _text) external{
        todos[_index].text=_text;

    }

    //Check if the task is completed.
    function GET (uint _index) external view returns(string memory, bool) {
        Todo memory todo=todos[_index];
        return (todo.text, todo.completed); // show  the text and whether the text is completed

    }

    //The text is completed
    function toggleCompleted(uint _index) external {
        todos[_index].completed= !todos[_index].completed;
    }

}