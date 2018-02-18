import "phoenix_html"

function fieldCounter() {
    var currentCount = 1;
    return function() {
        return currentCount++;
    };
}

var count = fieldCounter();

function addFields() {
    var field_number = count();
    var field_name = "field_" + field_number;
    var div = document.createElement("div");
    div.className = "formField";
    var deleteMe = document.createElement("a");
    deleteMe.className = "deleteMe";
    deleteMe.innerHTML = "X";
    deleteMe.href = "javascript:;";
    deleteMe.onclick = removeFields;
    var label = document.createElement("label");
    label.htmlFor = field_name;
    label.innerHTML = field_name;
    var container = document.getElementById("form_container");
    var submit = container.lastChild;
    var input = document.createElement("input");
    input.type = "text";
    input.name = "data["+field_name+"]";
    input.id = field_name;
    div.appendChild(label);
    div.appendChild(input);
    div.appendChild(deleteMe);
    container.insertBefore(div, submit);
}

function removeFields(e) {
    var target =  e.target;
    var field_div = target.parentNode;
    var parent = field_div.parentNode;
    parent.removeChild(field_div);
}

var addButton = document.getElementById("addField");
(addButton !== null)? addButtonListener() : null;

function addButtonListener() {
    addButton.addEventListener("click", function(){
        addFields();
    })
}
