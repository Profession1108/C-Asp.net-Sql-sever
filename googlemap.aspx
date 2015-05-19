<%@ Page Title="" Language="C#" MasterPageFile="~/handler.master" AutoEventWireup="true" CodeFile="googlemap.aspx.cs" Inherits="googlemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Handler" Runat="Server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<script type ="text/javascript">
</script>
<style type="text/css">
    .RemoveLine {
           top:50px;
           left:253px;
    }
     .map {
           top:20px;
           left:10px;
           width:1300px;
           height:400px;
     }    
</style>
</head>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=en"></script>
<script type="text/javascript">     
    var map, i, marker, flightPath, infowindow = new google.maps.InfoWindow();
    var coordinate = [];
    var coordinate2 = [null, null];
    var coordinate3 = [[null, null], [null, null]];
    var lat = -34.397;
    var lng = 150.644;

    var templat,templng,templat2,templng2;
    var Line = new Array();

    function SnsEws(Sns, Ews) {
        coordinate.push([Sns, Ews]);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

    var evenOdd = 0;
    function curved_line_generate(Options) {

        var Options = Options || {};
        var LatStart = Options.latStart || null;
        var LngStart = Options.lngStart || null;
        var LatEnd = Options.latEnd || null;
        var LngEnd = Options.lngEnd || null;
        var Color = Options.strokeColor || "#FF0000";
        var Opacity = Options.strokeOpacity || 1;
        var Weight = Options.strokeWeight || 3;
        var GapWidth = Options.gapWidth || 0;
        var Horizontal = Options.horizontal;
        var Multiplier = Options.multiplier || 1;
        var Resolution = Options.resolution || 0.1;
        var Map = map; //Options.Map || null;
        var reset = Options.reset;

        if (Horizontal == undefined) {

            Horizontal = true;

        }

        var LastLat = LatStart;
        var LastLng = LngStart;

        var PartLat;
        var PartLng;

        var Points = new Array();
        var PointsOffset = new Array();

        for (point = 0; point <= 1; point += Resolution) {
            Points.push(point);
            offset = (0.6 * Math.sin((Math.PI * point / 1)));
            PointsOffset.push(offset);
        }

        var OffsetMultiplier = 0;

        if (Horizontal == 1) {
            var OffsetLenght = (LngEnd - LngStart) * 0.1;
        } else {
            var OffsetLenght = (LatEnd - LatStart) * 0.1;
        }

        for (var i = 0; i < Points.length; i++) {
            if (i == 4) {
                OffsetMultiplier = 1.5 * Multiplier;
            }

            if (i >= 5) {
                OffsetMultiplier = (OffsetLenght * PointsOffset[i]) * Multiplier;
            } else {
                OffsetMultiplier = (OffsetLenght * PointsOffset[i]) * Multiplier;
            }

            if (Horizontal == 1) {
                PartLat = (LatStart + ((LatEnd - LatStart) * Points[i])) + OffsetMultiplier;
                PartLng = (LngStart + ((LngEnd - LngStart) * Points[i]));
            } else {
                PartLat = (LatStart + ((LatEnd - LatStart) * Points[i]));
                PartLng = (LngStart + ((LngEnd - LngStart) * Points[i])) + OffsetMultiplier;
            }
            curved_line_create_segment(LastLat, LastLng, PartLat, PartLng, Color, Opacity, Weight, GapWidth, Map, reset);

            LastLat = PartLat;
            LastLng = PartLng;
        }
        curved_line_create_segment(LastLat, LastLng, LatEnd, LngEnd, Color, Opacity, Weight, GapWidth, Map, reset);
    }

    function curved_line_create_segment(LatStart, LngStart, LatEnd, LngEnd, Color, Opacity, Weight, GapWidth, Map, reset) {
       
            
            evenOdd++;

            if (evenOdd % (GapWidth + 1))
                return;

            var LineCordinates = new Array();

            LineCordinates[0] = new google.maps.LatLng(LatStart, LngStart);
            LineCordinates[1] = new google.maps.LatLng(LatEnd, LngEnd);
            
            Line[evenOdd] = new google.maps.Polyline({
                path: LineCordinates,
                geodesic: false,
                strokeColor: Color,
                strokeOpacity: Opacity,
                strokeWeight: Weight
            });
            Line[evenOdd].setMap(map);
            google.maps.event.addListener(Line[evenOdd], 'click', function () {
                alert('you clicked polyline');
            });
        //document.writeln(evenOdd);
    }

    function initialize() {
        /*
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.beginPath();
        ctx.moveTo(20, 20);
        ctx.bezierCurveTo(20, 100, 200, 100, 200, 20);
        ctx.lineWidth = 5;
        ctx.strokeStyle = 'blue';
        ctx.stroke();
        ctx.closePath();
        */
        var temp = 0;
        var myOptions = {
            zoom: 6,
            center: new google.maps.LatLng(lat, lng),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById('map'), myOptions);
        
        for (i = 0; i < coordinate.length ; i++) {
            marker = new google.maps.Marker
            (
                {
                    position: new google.maps.LatLng(coordinate[i][0], coordinate[i][1]),
                    map: map,
                    content: 'Location info:<br/>Country Name:<br/>LatLng:<br/>(' + coordinate[i][0] + ',' + coordinate[i][1] + ')'
                }
            );
            (function (marker, i) {
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.setContent(this.content);
                    infowindow.open(map, marker);
                });
                google.maps.event.addListener(marker, 'dblclick', function () {
                    if (coordinate3[0][0] == null && coordinate3[0][1] == null) {
                        coordinate3[0][0] = coordinate[i][0];
                        coordinate3[0][1] = coordinate[i][1];
                        //alert(coordinate3[0][0] + ',' + coordinate3[0][1]);
                    } else if (coordinate3[1][0] == null && coordinate3[1][1] == null) {
                        coordinate3[1][0] = coordinate[i][0];
                        coordinate3[1][1] = coordinate[i][1];
                        //alert(coordinate3[0][0]+','+ coordinate3[0][1] +','+ coordinate3[1][0] + ',' + coordinate3[1][1]);
                        templat = parseFloat(coordinate3[0][0]);
                        templng = parseFloat(coordinate3[0][1]);
                        templat2 = parseFloat(coordinate3[1][0]);
                        templng2 = parseFloat(coordinate3[1][1]);
                        curved_line_generate({
                            latStart: templat,
                            lngStart: templng,
                            latEnd: templat2,
                            lngEnd: templng2,
                            resolution: 0.04,
                            strokeColor: "#00F",
                        });
                    } else if (coordinate3[0][0] == coordinate[i][0] && coordinate3[0][1] == coordinate[i][1]) {
                        for (temp = 1; temp < Line.length; temp++) {
                            Line[temp].setMap(null);
                        }
                        coordinate3[0][0] = null;
                        coordinate3[0][1] = null;
                        coordinate3[1][0] = null;
                        coordinate3[1][1] = null;
                    } else {
                        for (temp = 1; temp < Line.length; temp++) {
                            Line[temp].setMap(null);
                        }
                        coordinate3[1][0] = coordinate[i][0];
                        coordinate3[1][1] = coordinate[i][1];
                        //alert(coordinate3[1][0] + ',' + coordinate3[1][1]);
                        templat = parseFloat(coordinate3[0][0]);
                        templng = parseFloat(coordinate3[0][1]);
                        templat2 = parseFloat(coordinate3[1][0]);
                        templng2 = parseFloat(coordinate3[1][1]);
                        curved_line_generate({
                            latStart: templat,
                            lngStart: templng,
                            latEnd: templat2,
                            lngEnd: templng2,
                            resolution: 0.04,
                            strokeColor: "#00F",
                        });  
                    }
                    alert("Double Click");
                });
            })(marker, i);            
        }
    }

    function removeLine() {
        for (temp = 1; temp < Line.length; temp++) {
            Line[temp].setMap(null);
        }
        coordinate3[0][0] = null;
        coordinate3[0][1] = null;
        coordinate3[1][0] = null;
        coordinate3[1][1] = null;
    }
</script>
<body>
    <div>
        <input class ="RemoveLine" onclick="removeLine();" type="button" value="Remove line"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="1">
        </asp:Timer>
    </div> 
       <div class = "map" id="map"></div>
</body>
</html>
</asp:Content>

