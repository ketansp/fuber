'use strict';

module.exports = function (connectionPool) {
	var o = {

		fetchAllCabs: function (req, res) {
			var queryString = ' select cab.id_cab as idCab, get_options_label(cab.id_colour, "colour") as colour, cab.current_latitude as currentLatitude, cab.current_longitude as currentLongitude ' +
				' from cab where cab.id_cab_status = 1 ; ';
			connectionPool.query(queryString, [],
				function (err, results) {
					// If query is a single query, then result is an object
					//If query consists of multiple queries, then result is an array
					if (err) {
						console.log(err);
						//res.sendStatus(500);
						res.json({
							errorFlag: true,
							errorMessage: "An error occured!"
						});
						throw err;
					}
					if (results.length > 0) {
						res.json(results)
					} else {
						res.json({
							errorFlag: true,
							errorMessage: "No cabs available right now!"
						});
					}


				});
		},

		fetchNearestCab: function (req, res) {
			if (req.body.userLatitude == undefined || req.body.userLatitude == null || isNaN(req.body.userLatitude) ||
				req.body.userLongitude == undefined || req.body.userLongitude == null || isNaN(req.body.userLongitude)
			) {
				//res.sendStatus(400);
				res.json({
					errorFlag: true,
					errorMessage: "Invalid request details!"
				});
				return false;
			}

			if (!(req.body.idColour == parseInt(req.body.idColour, 10))) {
				req.body.idColour = null;
			}

			var queryString = ' select cab.id_cab as idCab, get_options_label(cab.id_colour, "colour") as colour, cab.current_latitude as currentLatitude, cab.current_longitude as currentLongitude ' +
				' from cab where cab.id_cab_status = 1 and (case when ? is null then 1=1 else cab.id_colour = ? end) ' +
				' order by calculate_distance( ? , ?, cab.current_latitude, cab.current_longitude) asc limit 1 ; ';
			connectionPool.query(queryString, [req.body.idColour,
											  req.body.idColour,
											  req.body.userLatitude,
											  req.body.userLongitude],
				function (err, results) {
					// If query is a single query, then result is an object
					//If query consists of multiple queries, then result is an array
					if (err) {
						console.log(err);
						//res.sendStatus(500);
						res.json({
							errorFlag: true,
							errorMessage: "An error occured!"
						});
						throw err;
					}
					if (results.length > 0) {
						res.json(results)
					} else {
						res.json({
							errorFlag: true,
							errorMessage: "No cabs available right now!"
						});
					}

				});
		}

	};

	return o;
}