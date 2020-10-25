const axios = require('axios')

axios.post('http://127.0.0.1:2704/toys', {
name:"Generic name of event",
description:"Write a description",
location:"Bulgaria, Sofia",
startDate:"2021-01-05T22:00:00.000+00:00",
endDate:"2021-01-07T22:00:00.000+00:00",
url:"yoururlhere.com"
});
