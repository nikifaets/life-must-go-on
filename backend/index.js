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
function fetchAllEventsOfCategory(eventCategory){
	return new Promise((resolve,reject)=>{
		client.connect(err => {
			if(err) throw err;
			db = client.db("events");
			let collection = db.collection(eventCategory);
			let query = {};
			let x = collection.find(query).toArray((err, res) => {
				if (err) {	
					reject(err);
				} else {
					resolve(res);
				}
			});
		});
	});
}
function insertEventIntoCategory(eventObj, eventCategory){
	client.connect(err => {
		if(err) throw err;
		db = client.db("events");
		let collection = db.collection(eventCategory);
		collection.insertOne(eventObj).then((result)=>{
			console.log(result);
		}).catch((error)=>{
			console.log(error);
		});
	});
}
//Example usage:
//insertEventIntoCategory({name:'Pesho'},'toys');
server.on('request',(request,response)=>{
	dbNames = [];
	const {method, url} = request;
	console.log(url);
	if(url=='/'){
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
	}else{
		let eventCategory = url.substring(1);
		//read new event if supplied in the http req body as JSON	
		let data = '';
		
		request.on('data', chunk => {
			data += chunk;
		})
		request.on('end', () => {
			if(data){
				console.log(JSON.parse(data)); 
				insertEventIntoCategory(JSON.parse(data),eventCategory);
			}
		})

		fetchAllEventsOfCategory(eventCategory).then((result)=>{
			console.log(result);
			response.setHeader('Content-Type','application/json');
			response.end(JSON.stringify(result));
		}).catch((error)=>{
			console.log(error);
		});	
	}
});

server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});




