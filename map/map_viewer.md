## Prepare map.png using map viewer
Map image can be created using program like [Maperitive](http://maperitive.net).

* Download OpenStreetMap data, use [BBBike](https://extract.bbbike.org) or similar.
* Copy `Wireframe.mrules` from temp dir `map\` to `Maperitive\Rules\` and apply by: `Map` → `Switch To Rules` → `2 wireframe`.
* Hide `Web map` and open map data: `File` → `Open Map Sources...`.
* Edit `mrules` as needed, add/remove elements, change font size, depending on zoom.
* When map is ready: `Tools` → `Export to SVG (For Inkscape)`.
* Use [Inkscape](https://inkscape.org/release/1.0/windows/) to convert `svg` to `pdf`. `Save as...` and select `Embed fonts`.
* Open in Adobe Reader with disabled anti-aliasing: `Edit` → `Preferences...` → `Page Display` / `Rendering`, turn off `Smooth` options. Make a screenshot.
* Last steps can be done in any programs which allow disabling anti-aliasing.