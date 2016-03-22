
'use strict';

module.exports = function (app, bodyParser, methodOverride, express) {

	var path = require('path');

	// parse application/x-www-form-urlenco1ded
	app.use(bodyParser.urlencoded({
		extended: true
	}));

	// override with the X-HTTP-Method-Override header in the request. simulate DELETE/PUT
	app.use(methodOverride('X-HTTP-Method-Override'));

	//Serving static content
	app.use(express.static(path.join(__dirname, '../public')));

	return app;

}
