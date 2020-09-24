const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

module.exports = environment


// try JS from KIT Wagon
// const path = require("path");

// module.exports = {
//   entry: path.resolve(__dirname, "./spec/select_examiner.js"),
//   mode: "development",
//   output: {
//     path: path.resolve(__dirname, "dist"),
//     filename: "main.js"
//   },
//   devtool: "sourcemap"
// };
