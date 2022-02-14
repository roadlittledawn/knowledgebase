const generateAbbreviatedName = (word) => {
  // TODO: checks for
  // * how many characters
  // * one word
  // * no special chars
  return `${word.charAt(0)}${word.length - 2}${word.charAt(word.length - 1)}`;
};

module.exports = generateAbbreviatedName;
