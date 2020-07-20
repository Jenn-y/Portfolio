const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const webpack = require("webpack")

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
        JQuery: 'jquery',
        jquery: 'jquery',
        Popper: ['popper.js', 'default'], // for Bootstrap 4
  })
)

const aliasConfig = {
    'jquery': 'jquery/src/jquery',
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);
environment.loaders.prepend('coffee', coffee)
module.exports = environment