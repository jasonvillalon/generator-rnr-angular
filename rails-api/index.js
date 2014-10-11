'use strict';
var util = require('util'),
	inflections = require('underscore.inflections'),
	yeoman = require('yeoman-generator');


var APIGenerator = yeoman.generators.NamedBase.extend({
	init: function() {
		this.slugifiedName = this._.slugify(this._.humanize(this.name));
	},

	renderAPI: function() {
		// Create module folder
		this.mkdir('app/controllers/api/' + this.slugifiedName);
		
		this.slugifiedControllerName = this._.slugify(this._.humanize(this.name));
		this.classifiedControllerName = this._.classify(this.slugifiedControllerName);
		this.humanizedControllerName = this._.humanize(this.slugifiedControllerName);

		// Render angular module definition
		this.template('_api.rb', 'app/controllers/api/' + this.slugifiedName + '/' + this.slugifiedName + '_api.rb');
		this.template('base.rb', 'app/controllers/api/' + this.slugifiedName + '/' + 'base.rb');
		this.template('defaults.rb', 'app/controllers/api/' + this.slugifiedName + '/' + 'defaults.rb');
	}
});

module.exports = APIGenerator;
