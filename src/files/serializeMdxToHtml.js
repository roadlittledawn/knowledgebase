const fs = require('fs');
const serializeMDX = require('./scripts/actions/serialize-mdx');
const deserializeHTML = require('./scripts/actions/deserialize-html');
const path = require('path');

const filePath = path.join(
  process.cwd(),
  'src/content/docs/network-performance-monitoring/advanced/advanced-config.mdx'
);

const htmlFilePath = path.join(process.cwd(), 'serializedHtml.html');

const serializeMdxToHtml = async () => {
  const mdx = fs.readFileSync(filePath);
  const html = await serializeMDX(mdx);
  fs.writeFileSync(htmlFilePath, html, 'utf-8');
};

const deserializeHtmlToMdx = async () => {
  const html = fs.readFileSync(htmlFilePath, 'utf-8');
  const mdx = await deserializeHTML(html);
  fs.writeFileSync(path.join(process.cwd(), 'htmlToMdx.mdx'), mdx, 'utf-8');
};

module.exports = { serializeMdxToHtml, deserializeHtmlToMdx };

// const { serializeMdxToHtml } = require('./serializeMdxToHtml.js');
