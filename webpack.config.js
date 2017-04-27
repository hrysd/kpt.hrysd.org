const webpack = require('webpack');
const path    = require('path');

const {RAILS_ENV} = process.env;

module.exports = {
  entry: './frontend/src/javascripts/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, path.join('app', 'assets', 'javascripts'))
  },
  resolve: {
    extensions: ['.js', '.vue']
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/
      },
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify(RAILS_ENV)
      }
    }),
    ...(
      RAILS_ENV ? [
        new webpack.optimize.UglifyJsPlugin({})
      ] : []
    )
  ],
  devtool: 'inline-source-map'
}
