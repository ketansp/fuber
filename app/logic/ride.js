'use strict';

module.exports = function (connectionPool) {
	var o = {
		startRide: function (req, res) {
			if (req.body.idUser == undefined || req.body.idUser == null || !(req.body.idUser == parseInt(req.body.idUser, 10)) ||
				req.body.idCab == undefined || req.body.idCab == null || !(req.body.idCab == parseInt(req.body.idCab, 10)) ||
				req.body.startLatitude == undefined || req.body.startLatitude == null || isNaN(req.body.startLatitude) ||
				req.body.startLongitude == undefined || req.body.startLongitude == null || isNaN(req.body.startLongitude)
			) {
				//res.sendStatus(400);
				res.json({
					errorFlag: true,
					errorMessage: "Invalid request details!"
				});
				return false;
			}

			var queryString = ' call start_ride(? ,? ,? ,?);  ';
			connectionPool.query(queryString, [req.body.idUser,
											   req.body.idCab,
											   req.body.startLatitude,
											   req.body.startLongitude],
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
					if (results[0][0].errorFlag == true) {
						res.json(results[0][0]);
					} else {
						res.json({
							success: true,
							idRide: results[1][0].idRide
						});
					}

				});
		},

		finishRide: function (req, res) {
			if (req.body.idRide == undefined || req.body.idRide == null || !(req.body.idRide == parseInt(req.body.idRide, 10)) ||
				req.body.endLatitude == undefined || req.body.endLatitude == null || isNaN(req.body.endLatitude) ||
				req.body.endLongitude == undefined || req.body.endLongitude == null || isNaN(req.body.endLongitude)
			) {
				//res.sendStatus(400);
				res.json({
					errorFlag: true,
					errorMessage: "Invalid request details!"
				});
				return false;
			}
			var queryString = '';
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
					if (results[0][0].errorFlag == true) {
						res.json(results[0][0]);
					} else {
						res.json({
							success: true,
							idRide: results[1][0].amount
						});
					}

				});
		}
	};

	return o;
}