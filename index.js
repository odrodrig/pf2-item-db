const cheerio = require('cheerio');
const got = require('got');
const Item = require('./classes/item');
const fs = require('fs');
const { map } = require('cheerio/lib/api/traversing');

const url = process.argv[2];

// Write to one file
// async function writeToFile(category, itemList) {
//     try {
//         await fs.promises.writeFile("./data/"+category+".json", JSON.stringify(itemList))
//     } catch(error) {
//         console.error("There was an error", error.message);
//     } 
// }

// Write to multiple files
async function writeToFile(category, item) {

    fs.promises.writeFile("./data/"+category+"/"+formatName(item.name)+".json", JSON.stringify(item))
    .catch((error) => {
        console.error("There was an error", error.message);
    })
}

function formatName(name) {
    return name
    .toLocaleLowerCase()
    .replace(/ /g, '_')
    .replace(/\(/g, '')
    .replace(/\)/g, '');
}

(async () => {

    try {
        const response = await got(url);
        const $ = cheerio.load(response.body);
        var itemProps = [];

        var category = $('span[id=ctl00_RadDrawer1_Content_MainContent_Header]').find('h1[class=title]').text();

        fs.mkdir("./data/"+formatName(category), (error) => {
            if (error) {
                console.log(error.message);
            } else{
                console.log("Directory created");
            }
        });

        $('table.rgMasterTable').find('thead > tr > th > a').each((i, header) => {
            itemProps[i] = formatName($(header).text());
        });
    
        $('table.rgMasterTable').find('tbody > tr').each((i, item) => {
            var itemMap = new Map();
            
            $(item).find('td').each((x, td) => {

                itemMap.set(itemProps[x], $(td).find('span').text());

                if (x == 0) { 
                    itemMap.set("link", "https://2e.aonprd.com/"+$(td).find('span > u > a').attr('href'))
                }
                
            });

            var newItem = Object.fromEntries(itemMap);

            writeToFile(formatName(category), newItem);

        });

    } catch(error) {
        console.error("There was an error", error.message);
    }
})();
