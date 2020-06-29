# Map Offline (GPS)

Shows map image around current position. Aimed to give navigation ability for watches without maps and courses.

* As memory is limited, best to use 2 colors image.
* For 2 colors and 16 KB memory - max size is: 2000 x 2000 px.
* As an example, shows world map (based on [STyx](https://commons.wikimedia.org/wiki/File:World_location_map.svg)'s map).
* Refreshes only when is visible (auto call `onUpdate()` function), to reduce calculations.
* Shows static image, no zoom.

![logo](img/Map.png)


## Usage

* Copy compiled `Map.prg` to the `APPS\` directory.
* Select: `Activity Settings` → `Data Screens` → `Screen #` → `Field #` → `Connect IQ` → `Map`.


## Compile

### Prepare map.png
* Image should be black-and-white, 2000 x 2000 px.
* Look for printable/simple/bw/outline maps online, or use [map viewer](map/map_viewer.md) with editable style, or decrease color depth in graphic program.
* Suggestion: you can mark on map some paths and points.

### Download
* [ImageMagick](https://imagemagick.org/script/download.php) zip. You can use `portable-Q16` version, `x86` or `x64` as your system.
* [OpenSSL](https://bintray.com/vszakats/generic/openssl) zip. Choose latest version like `1.1.1b`, click `Files` and download `win32` or `64` zip.
* The [dev-kit](https://developer.garmin.com/connect-iq/sdk/) zip, choose the first `Direct Download`.

### resources\m
* You can use bat scripts from temp dir `map\`.
* Add path to ImageMagick dir (where unpacked). Example: `C:\ImageMagick\`
* Use ImageMagick to crop prepared map: `convert map.png -crop 250x250 m\%%01d.png`
* Check if map is correctly cropped and copy it to: `resources\m` dir.
* 2000 x 2000 px cropped to 250 x 250 gives 64 parts (from `0.png` to `63.png`).

### resources\r.xml
* This file has all images ids. For 2000 x 2000 px / 64 parts it should looks like below and you don't need to edit it.
* If map is smaller, then comment unused lines by adding `<!--` `-->` around them.
* Later using full 2000 x 2000 px map, uncomment them.
* If device has more then 16 KB memory, you can generate more ids using `gen_res_ids.bat` and make map larger.

```
<drawables>
<bitmap id="i" filename="i.png"/>
<bitmap id="m0" filename="m\0.png"><palette disableTransparency="true"><color>000000</color><color>FFFFFF</color></palette></bitmap>
<bitmap id="m1" filename="m\1.png"><palette disableTransparency="true"><color>000000</color><color>FFFFFF</color></palette></bitmap>
[...]
<bitmap id="m63" filename="m\63.png"><palette disableTransparency="true"><color>000000</color><color>FFFFFF</color></palette></bitmap>
</drawables>
```

### map.mc
* Check where your map starts (left upper corner) and ends (right down corner).
* And enter those coordinates here (latitude and longitude).
* Edit full map size if is smaller then 2000 px.

```
const ut=83.64, un=-180.0,  // left upper corner
      dt=-66.20, dn=180.0,  // right down corner
      imgs=250, rx=2000/imgs, ry=2000/imgs,  // size of cropped part, width and height of full map
```

* Check references to images ids. This is copy from `resources\r.xml`.
* Below there are ids for 2000 x 2000 px / 64 parts.
* If map is smaller then comment unused ids adding `/*` `*/` around them.
```
var r = [ :m0, :m1, :m2, :m3, :m4, :m5, :m6, :m7,
          :m8, :m9,:m10,:m11,:m12,:m13,:m14,:m15,
         :m16,:m17,:m18,:m19,:m20,:m21,:m22,:m23,
         :m24,:m25,:m26,:m27,:m28,:m29,:m30,:m31,
         :m32,:m33,:m34,:m35,:m36,:m37,:m38,:m39,
         :m40,:m41,:m42,:m43,:m44,:m45,:m46,:m47,
         :m48,:m49,:m50,:m51,:m52,:m53,:m54,:m55,
         :m56,:m57,:m58,:m59,:m60,:m61,:m62,:m63];
```

### dev_key.der
Generate key using OpenSSL (add path where unpacked).
```
openssl genrsa -out dev_key.pem 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in dev_key.pem -out dev_key.der -nocrypt
```

### Map.prg
* Add path to dev-kit `bin` dir. Example: `C:\ciq\bin\`
* Replace `DEVICE` by your device id (check `manifest.xml` or `bin\devices.xml` at dev-kit).
```
monkeyc -y dev_key.der -f MapOfflineGPS\monkey.jungle -r -o Map.prg -d DEVICE
```