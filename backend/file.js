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
		client.connect(err => {
			if(err) throw err;
			db = client.db("events");
			let x = db.listCollections().toArray();
			x.then((result)=>{
				resolve(result);
			}).catch((error)=>{
				reject(error);
			})
			console.log(x);
		});
	})
};

server.on('request',(request,response)=>{
	dbNames = [];
	const {method, url} = request;
	console.log(url);
	fetchDBCollectionNames().then((result)=>{
		console.log(result);
		for(x of result){
			dbNames.push(x.name);
		}
		response.setHeader('Content-Type','application/json');
		response.end(JSON.stringify(dbNames));
	}).catch((error)=>{
		console.log(error);
	});
});

server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});




