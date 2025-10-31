let input = HEMTT_VFS.join("addons").join("core");
let output = HEMTT_VFS.join("addons").join("mehland");
let items = input.list();

debug(`Copying files from: ${input} to ${output}`);
for item in items {
    if(item.file_name().contains(`PBOPREFIX`)){
        continue;
    }
    let itemName = item.file_name();
    let outputFile = output.join(itemName);
    debug(outputFile);
    item.copy(outputFile);
}