const { environment } = require('@rails/webpacker')


// start new boostrap code
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))
// end bootstrap code

module.exports = environment
