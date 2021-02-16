## Edit size

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
* Edit full map size if is different then 2000 px.
```
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