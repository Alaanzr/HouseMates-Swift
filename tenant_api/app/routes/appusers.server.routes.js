var appUsers = require('../../app/controllers/appusers.server.controller');

module.exports = function(app) {
    app.route('/appusers').post(appUsers.create).get(appUsers.list);
};
