const path = require('path');

module.exports = {
  // normally included in app/assets/javascripts for rails
  entry: "./index.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },

  // transpiling mess
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },

  // maintain line numbers of original source code!
  devtool: 'source-map',

  // processes the following file extensions without explicitly naming them
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};
