const puppeteer = require("puppeteer");
const mermaidConfig = require("./mermaid.config.js");

module.exports = {
  extends: "marp-core",
  html: {
    enabled: true,
    mermaid: {
      width: 800,
      config: mermaidConfig,
      puppeteerInstance: puppeteer,
    },
  },
};

const markdownItAdmon = require('markdown-it-admon')
const markdownItMermaid = require('markdown-it-mermaid')

module.exports = ({ marp }) => marp.use(markdownItMermaid).use(markdownItAdmon)
