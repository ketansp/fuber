'use strict';

module.exports = function (mysql) {

	var pool = mysql.createPool({
		connectionLimit: 10,
		host: 'localhost',
		port: 3306,
		user: 'root',
		password: 'next@345',
		database: 'fubertransactional',
		waitForConnections: true,
		acquireTimeout: 30000,
		multipleStatements: true
	});

	return pool;

}