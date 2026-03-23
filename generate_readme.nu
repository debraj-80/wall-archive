
# Generate README with all wallpapers

let images = ls wallpaper | where type == "file" | sort-by name

let img_tags = $images | each {|it|
    $"<img src=\"wallpaper/($it.name | path basename)\" width=\"300\">"
} | str join "\n"

let content = $"
# Wallpaper Archive

This repository is a personal archive of wallpapers.

---

## Wallpaper Previews

<p align=\"center\">

($img_tags)

</p>
"

$content | save README.md --force
