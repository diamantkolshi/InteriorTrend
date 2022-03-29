require('react-svg-loader');

module.exports = {
  test: /\.svg$/,
  use: [
    {
      loader: "babel-loader"
    },
    {
      loader: "react-svg-loader",
      options: {
        jsx: false // true outputs JSX tags
      }
    },
  ]
}
