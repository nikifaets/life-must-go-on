const MongoClient = require('mongodb').MongoClient;
const http = require('http');

const uri = "mongodb+srv://life-must-go-on:KamenNikiDimo@cluster0.bf5oa.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true });
const port = 2704;
const hostname = '127.0.0.1';
const server = http.createServer();

let dbNames = [];
function fetchDBCollectionNames(){
	return new Promise((resolve, reject) => {
	    try{
		let data = 123;
		client.connect(err => {
			if(err) throw err;
			db = client.db("events");
			db.listCollections().toArray(function(err, collInfos) {
				// collInfos is an array of collection info objects that look like:
				// { name: 'test', options: {} }
				console.log(collInfos);
				for( x of collInfos){
					dbNames.push(x.name);
				}
				console.log(dbNames);
				console.log("names fetched");
			});
			client.close();	
		});
		resolve(data)
	    }
	    catch(error){
		reject(error)
	    }
	})
};

server.on('request',(request,response)=>{
	const {method, url} = request;
	console.log(url);
	fetchDBCollectionNames().then((result)=>{
		response.setHeader('Content-Type','application/json');
		response.end(JSON.stringify(dbNames));
	});
});

server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});




