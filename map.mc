using Toybox.Application;
using Toybox.Activity;
using Toybox.WatchUi;

class Map extends Application.AppBase
{ function getInitialView() {return [new DataField()];} }

class DataField extends WatchUi.DataField
{ function initialize() { DataField.initialize(); }

    const ut=83.64, un=-180.0,
          dt=-66.20, dn=180.0,
          imgs=250, rx=2000/imgs, ry=2000/imgs,
          tt=ut-dt, nn=dn-un;

    var x,y, ar=new[9], pos, mx,my;


    function find(t,n)
    {
        var ayy = ((ut-t)*ry/tt),
            axx = (rx-(dn-n)*rx/nn),
             yy = ayy.toNumber(),
             xx = axx.toNumber();

        my = (ayy-yy)*imgs;
        mx = (axx-xx)*imgs;

        var npos = yy*rx+xx;
        if (pos != npos)
        {
            var r = [ :m0, :m1, :m2, :m3, :m4, :m5, :m6, :m7,
                      :m8, :m9,:m10,:m11,:m12,:m13,:m14,:m15,
                     :m16,:m17,:m18,:m19,:m20,:m21,:m22,:m23,
                     :m24,:m25,:m26,:m27,:m28,:m29,:m30,:m31,
                     :m32,:m33,:m34,:m35,:m36,:m37,:m38,:m39,
                     :m40,:m41,:m42,:m43,:m44,:m45,:m46,:m47,
                     :m48,:m49,:m50,:m51,:m52,:m53,:m54,:m55,
                     :m56,:m57,:m58,:m59,:m60,:m61,:m62,:m63];

            pos = npos;
            for(var i=0, iy=yy-1; iy<=yy+1; iy++) {
                for(var ix=xx-1; ix<=xx+1; i++, ix++) {
                    if(iy>=0 && iy<ry && ix>=0 && ix<rx) {
                        ar[i] = Rez.Drawables[r[iy*rx+ix]];}
                    else {ar[i]=null;} }}
        }
    }


    function onUpdate(dc)
    { var g = Activity.getActivityInfo().currentLocation;

        if (g!=null)
        {
            g = g.toDegrees();
            find(g[0], g[1]);
            g = null;

            for(var i=0, yy=y-imgs-my; yy<y+imgs; yy+=imgs) {
                for(var xx=x-imgs-mx; xx<x+imgs; xx+=imgs, i++) {
                    if(ar[i]!=null){
                        dc.drawBitmap(xx, yy, WatchUi.loadResource(ar[i]));}}}
        }

        dc.setColor(0xFF0000,-1);
        dc.fillRectangle(x-2, y-2, 4,4);
    }


    function onLayout(dc) {
        x = dc.getWidth()/2;
        y = dc.getHeight()/2; }
}