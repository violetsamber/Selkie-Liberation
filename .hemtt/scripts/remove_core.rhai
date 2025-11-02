let items = HEMTT_OUT.join("addons").list();
for item in items {
    print(item.file_name());
}

let core = HEMTT_OUT.join("addons").join("slklib_core.pbo"); 
print(`Deleting: ${core}`);
core.remove_file();