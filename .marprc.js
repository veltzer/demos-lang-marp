const { Marp } = require('@marp-team/marp-core');

module.exports = {
  engine: ({ marp }) => marp.use(require('markdown-it-mermaid'))
};