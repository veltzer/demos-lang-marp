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
