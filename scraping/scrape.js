const fs = require('fs');
const { parse } = require("csv-parse");
const {Key} = require('selenium-webdriver');
const {By, Builder, Browser} = require('selenium-webdriver');

(async () => {

    // Array to store names of strains for scraping
    const to_scrape = [];
    
    // Read the strain names
    fs.createReadStream("data.csv")
    .pipe(parse({ delimiter: ",", from_line: 2 }))
    .on("data", function (row) {
        to_scrape.push(row[0]);
    })
    .on("error", function (error) {
        console.log(error.message);
    });

    
    // Web driver initialization
    driver = new Builder().forBrowser('chrome').build();
    await driver.get('https://www.ncbi.nlm.nih.gov/nuccore');

    // Scraping...
    for (let id in to_scrape) {
        await new Promise(resolve => setTimeout(resolve, 500))

        // Find ncbi search term
        await driver.findElement(By.id("term")).sendKeys(Key.chord(to_scrape[id], Key.ENTER));
        await new Promise(resolve => setTimeout(resolve, 500))

        // Find "Fasta" component and click
        await driver.findElement(By.xpath('/html/body/div[1]/div[1]/form/div[1]/div[4]/div/div[5]/div[1]/p[2]/span/a[1]')).click();
        await new Promise(resolve => setTimeout(resolve, 500))

        // Find the web element that stores sequence content
        let element = await driver.findElement(By.xpath('/html/body/div[1]/div[1]/form/div[1]/div[4]/div/div[5]/div[2]/div[1]'));
        
        // 1s timeout for loading
        await new Promise(resolve => setTimeout(resolve, 1000))

        // Get sequence content by taking the text field
        let text = await element.getText();
        await new Promise(resolve => setTimeout(resolve, 500))
        
        // Output sequence content to Fasta file
        let filename = ("scrape_data/").concat(to_scrape[id].concat('.fa'))
        
        fs.writeFile(filename, text, (err) => {

            // In case of a error throw err.
            if (err) throw err;
        })
    }

})();   