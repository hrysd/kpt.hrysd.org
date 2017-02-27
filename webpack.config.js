const path = require('path');

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
  devtool: '#eval-source-map'
}
