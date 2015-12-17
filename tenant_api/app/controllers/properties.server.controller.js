 var Property = require('mongoose').model('Property');

  exports.create = function(req, res, next) {
    var property = new Property(req.body);
    property.save(function(err) {
      if (err) {
        return next(err);
      }
      else {
        res.json(property);
      }
    });
  };

  exports.list = function(req,res, next) {
    Property.find( {}, function(err, property) {
      if (err) {
        return next(err);
      }
      else {
        res.json(property);
      }
    });
  };
