const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://life-must-go-on:KamenNikiDimo@cluster0.bf5oa.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true });
var dbNames = [];
client.connect(err => {
	if(err) throw err;
	db = client.db("events");
	db.listCollections().toArray(function(err, collInfos) {
		// collInfos is an array of collection info objects that look like:
		// { name: 'test', options: {} }
		for( x of collInfos){
			dbNames.push(x.name);
		}
		console.log(dbNames);
	});
	client.close();	
});


