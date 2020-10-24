const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://life-must-go-on:KamenNikiDimo@cluster0.bf5oa.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true });
client.connect(err => {
	if(err) throw err;
	db = client.db("events");
	db.listCollections().toArray(function(err, collInfos) {
		// collInfos is an array of collection info objects that look like:
		// { name: 'test', options: {} }
		console.log(collInfos);
	});
	client.close();	
});

