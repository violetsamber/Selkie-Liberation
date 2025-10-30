// By Jonpas, CUP, Modified by DartRuffian
// Renames all the pbos from the build to be MAINPREFIX_PREFIX_...
// This is its own script to avoid issues with files being in use during different stages.
print("Running Rename...");

if HEMTT.mode() == "script" {
    fatal("rename_pbos can not be ran directly");
}

const mainprefix = HEMTT.project().mainprefix();
const prefix = HEMTT.project().prefix();

fn rename(file_path, folder_path) {
    let renamed_file = file_path.file_name();
    renamed_file.remove(`.pbo`);
    renamed_file.remove(`${global::prefix}_`);
    renamed_file = `${global::prefix}_${renamed_file}.${renamed_file}.pbo`;
    print(`File Name: ${renamed_file}`);
    print(`File Path: ${file_path}`);

    // Rename PREFIX_whatever.pbo -> MAINPREFIX_PREFIX_whatever.pbo
    if renamed_file.starts_with(global::prefix) {
        renamed_file = `${renamed_file}`;
        let renamed_file_path = folder_path.join(renamed_file);
        print(`Renamed to: ${renamed_file_path}`);

        if !file_path.move(renamed_file_path) {
            fatal(`Failed to rename '${file_path}' to '${renamed_file_path}'`);
        }
    }
}

// Rename addons in main mod
info("Renaming pbos in mod");
for folder in ["addons", "keys"] {
    let files = HEMTT_OUT.join(folder);
    for file_path in files.list() {
        rename(file_path, HEMTT_OUT.join(folder));
    }
}

const name = HEMTT.project().name();
const author = HEMTT.project().author();
const version = HEMTT.project().version().to_string();

const file_prefix_len = `${mainprefix}_${prefix}_`.len;

// Rename optionals
info("Renaming optional mods");
for old_folder_path in HEMTT_OUT.join("optionals").list() {
    if !(old_folder_path.file_name().starts_with("@")) {
        continue;
    }

    // Create new folder and move pbos, using move doesn't seem to work for folders
    let folder_name = old_folder_path.file_name();
    folder_name = `${mainprefix}_${folder_name[1..folder_name.len]}`; // Remove "@", add prefix

    // Docs say create_dir should create folders along the path, but it doesn't seem to
    create_dir(HEMTT_OUT.join("optionals").join(folder_name));
    create_dir(HEMTT_OUT.join("optionals").join(folder_name).join("addons"));
    create_dir(HEMTT_OUT.join("optionals").join(folder_name).join("keys"));
    let folder_path = HEMTT_OUT.join("optionals").join(folder_name);

    // Rename and move pbos
    for file_path in old_folder_path.join("addons").list() {
        rename(file_path, folder_path.join("addons"));
    }

    // Rename and move keys
    for file_path in old_folder_path.join("keys").list() {
        rename(file_path, folder_path.join("keys"));
    }

    // Same thing as create_dir, one folder at a time
    remove_dir(old_folder_path.join("addons"));
    remove_dir(old_folder_path.join("keys"));
    remove_dir(old_folder_path);

    // Add mod.cpp
    let component = folder_name[file_prefix_len..folder_name.len];
    let text = `author = "${author}";
name = "${name}: ${component}";
description = "${name} - Version ${version}";
overview = "";`;
    folder_path.join("mod.cpp").create_file().write(text);
}