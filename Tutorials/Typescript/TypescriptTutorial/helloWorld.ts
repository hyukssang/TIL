interface Person{
	firstname: string;
	lastname: string;
}

function helloWorld(person: Person){
	return "hello " + person.firstname + " " + person.lastname;
}

var user = {firstname: "Jane", lastname: "User"};
document.body.innerHTML = helloWorld(user);
