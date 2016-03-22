'use strict';

module.exports = function (app, connectionPool) {
	var path = require('path');
	var cab = require(path.join(__dirname, '../logic/cab.js'))(connectionPool);

	app.get('/api/cabs', function (req, res) {
		cab.fetchAllCabs(req, res);
	});

	app.get('/api/cabs/nearest/:userLatitude/:userLongitude/:idColour', function (req, res) {
		cab.fetchNearestCab(req, res);
	});

};