const nodeExternals = require('webpack-node-externals');
module.exports = {
    // mode: 'development',
    entry: './index.js',
    output: {
      filename: 'bundle.js'
    },
    externals: [nodeExternals()],
    // module: {
    //     rules: [
    //         {
    //             test: /\.js$/,
    //             exclude: /node_modules/,
    //             use: {
    //                 loader: 'babel-loader',
    //                 options: {
    //                     presets: ['@babel/preset-env']
    //                 }
    //             }
    //         }
    //     ]
    // }
  };