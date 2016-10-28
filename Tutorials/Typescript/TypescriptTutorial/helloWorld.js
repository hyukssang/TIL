function helloWorld(person) {
    return "hello " + person.firstname + " " + person.lastname;
}
var user = { firstname: "Jane", lastname: "User" };
document.body.innerHTML = helloWorld(user);
