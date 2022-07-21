const deserializeHTML = require('./scripts/actions/deserialize-html');
const fs = require('fs');
const path = require('path');

const translatedHtml = fs.readFileSync(
  path.join(process.cwd(), 'html-to-deserialize.html'),
  'utf-8'
);

const deserializeToMdx = async (translatedHtml) => {
  const mdx = await deserializeHTML(translatedHtml);
  return mdx;
};

deserializeToMdx(translatedHtml).then((res) =>
  fs.writeFileSync(
    path.join(process.cwd(), 'deserialized-html.mdx'),
    res,
    'utf-8'
  )
);
