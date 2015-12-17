var properties = require('../../app/controllers/properties.server.controller');

module.exports = function(app) {
    app.route('/properties').post(properties.create).get(properties.list);
};
