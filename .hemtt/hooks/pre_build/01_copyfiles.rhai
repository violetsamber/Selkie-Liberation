let input = HEMTT_VFS.join("src");
let output = HEMTT_VFS.join("addons");

let items = input.list();
let outputItems = output.list();

for outputItem in outputItems {
    print(`Copying files from: ${input} to ${outputItem}`);
    for item in items {
        if(item.file_name().contains(`PBOPREFIX`)){
            continue;
        }
        let itemName = item.file_name();
        let outputFile = outputItem.join(itemName);
        debug(outputFile);
        item.copy(outputFile);
    }
}