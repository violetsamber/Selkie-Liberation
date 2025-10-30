// Place this in .hemtt\hooks\post_build
if HEMTT.mode() != "release" {
    HEMTT.script("rename_pbos");
}