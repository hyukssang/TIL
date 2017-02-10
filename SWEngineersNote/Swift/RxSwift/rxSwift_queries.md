# RxSwift Queries

## Note
Queries return a Results instance, which contains a collection of Objects. Results have an interface very similar to Array and objects contained in a Results can be accessed using indexed subscripting. Unlike Arrays, Results only hold Objects of a single subclass type.

All queries (including queries and property access) are **lazy** in Realm. Data is only read when the properties are accessed.

**Results to a query are not copies of your data**: modifying the results of a query (within a write transaction) will modify the data on disk directly. Similarly, you can traverse your graph of relationships directly from the Objects contained in a Results.

Execution of a query is deferred until the results are used. This means that chaining several temporary Results to sort and filter your data does not perform extra work processing the intermediate state.

Once the query has been executed, or a notification block has been added, the Results is kept up to date with changes made in the Realm, with the query execution performed on a background thread when possible.

## Querying

### Basic Method

```
// retrieves all Dogs from the default Realm
let dogs = realm.objects(Dog.self) 

var todoList: Results<TodoItem>{
	get{
		return realm.objects(TodoItem.self)
	}
}
```

Even if there is only one item in the database, `realm.objects` returns a collection of `Objects`.

## Reference
- [Realm Official Doc](https://realm.io/docs/swift/latest/#queries)