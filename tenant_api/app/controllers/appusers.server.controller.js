var AppUser = require('mongoose').model('AppUser');

exports.create = function(req, res, next) {
    var appUser = new AppUser(req.body);
    appUser.save(function(err) {
        if (err) {
            return next(err);
        }
        else {
            res.json(appUser);
        }
    });
};

exports.list = function(req, res, next) {
    AppUser.find({}, function(err, appUser) {
        if (err) {
            return next(err);
        }
        else {
            res.json(appUser);
        }
    });
};
