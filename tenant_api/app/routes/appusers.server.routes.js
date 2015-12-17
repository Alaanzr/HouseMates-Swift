var appUsers = require('../../app/controllers/appusers.server.controller');

module.exports = function(app) {
    app.route('/appusers').post(appUsers.create).get(appUsers.list);

    app.route('/appusers/:appuser_id').get(appUsers.read)
    app.param('appuser_id', appUsers.appuser_id);
};
