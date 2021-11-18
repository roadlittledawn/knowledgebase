const fs = require("fs");

fs.readFile("./data/old-files.txt", "utf-8", function (err, data) {
  if (err) throw err;
  let splitted = data.toString().split("\n").filter(Boolean);

  const arr = splitted.map((item) => ({
    date: item.split(" ")[0],
    filePath: item.split(" ")[1],
  }));
  console.log(arr);
});
