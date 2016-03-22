'use strict';

// set up ======================================================================

var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var methodOverride = require('method-override');

var mysql = require('mysql');


// configuration ===============================================================
// set our port
var port = process.env.PORT || 8080;


var connectionPool = require('./config/database.js')(mysql);
require('./config/express.js')(app, bodyParser, methodOverride, express);

// Authentication related ======================================================


// define model ================================================================
//Models are not included in server.js but in routes

// routes ======================================================================
require('./app/routes/cabRoutes.js')(app, connectionPool);
require('./app/routes/rideRoutes.js')(app, connectionPool);

// listen (start app with node server.js) ======================================
app.listen(port);
console.log("App listening on port " + port);

// expose app           
exports = module.exports = app;