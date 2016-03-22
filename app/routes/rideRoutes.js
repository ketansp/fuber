'use strict';

module.exports = function (app, connectionPool) {
	var path = require('path');
	var ride = require(path.join(__dirname, '../logic/ride.js'))(connectionPool);

	app.post('/api/rides', function (req, res) {
		ride.startRide(req, res);
	});

	app.put('/api/rides/:idRide', function (req, res) {
		ride.finishRide(req, res);
	});

};