const { environment } = require('@rails/webpacker')
const typescript = require('./loaders/typescript')
// const svg = require('./loaders/svg')
const eslint = require('./loaders/eslint')

environment.loaders.prepend('typescript', typescript)
// environment.loaders.prepend('svg', svg);
// environment.loaders.append('eslint', eslint)

module.exports = environment
