
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>

    <script type="text/javascript">
        <!--
        function Redirect() {
            window.location="http://www.vk.com";
        }
        //-->
    </script>

</head>
<body>

<div>
    <center>
        <style>
            body {
                background: url("http://www.slashdiabetes.com/wp-content/uploads/Winter-Snowman-1.jpg") no-repeat;
                background-size: 100%;
            }
        </style>
        </head>
        <%--<img src = "http://images.all-free-download.com/images/graphiclarge/christmas_bauble_and_green_branches_187535.jpg">--%>
    </center>
</div>

<div align="right">
    <p><a href="/login.jsp" style="color: rgb(125,20,10)"> <font color="##FF0000">Log out <%= (String)request.getAttribute("NAME") %></font>  </a> </p>\
    <%--<p>Welcome <%= (String)request.getAttribute("NAME") %>!</p>--%>
</div>
<img src="http://tester2.synthasite.com/resources/flashing%20christmas%20lights.gif" alt="" border="0">
<br>

<div>
    <%--<center>--%>
        <%--<%--%>
            <%--String name=(String)request.getAttribute("NAME");--%>
            <%--if(name!=null) {--%>
                <%--out.print("<font color=green size=8px>" + name + "</font>");--%>
            <%--}--%>

            <%--String password=(String)request.getAttribute("PASSWORD");--%>
            <%--if(password!=null) {--%>
                <%--out.println("<font color=green size=8px>" + "   "+password + "</font>");--%>
            <%--}--%>
        <%--%>--%>
    <%--</center>--%>
</div>
<div>
    <script type="text/javascript">

        function openwindow(){
            window.open("autumn_effect.htm","","width=350,height=500")
        }

        //Configure below to change URL path to the snow image
        var snowsrc="/snow.gif"
        // Configure below to change number of snow to render
        var no = 10;
        // Configure whether snow should disappear after x seconds (0=never):
        var hidesnowtime = 0;
        // Configure how much snow should drop down before fading ("windowheight" or "pageheight")
        var snowdistance = "pageheight";

        ///////////Stop Config//////////////////////////////////

        var ie4up = (document.all) ? 1 : 0;
        var ns6up = (document.getElementById&&!document.all) ? 1 : 0;

        function iecompattest(){
            return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
        }

        var dx, xp, yp;    // coordinate and position variables
        var am, stx, sty;  // amplitude and step variables
        var i, doc_width = 800, doc_height = 600;

        if (ns6up) {
            doc_width = self.innerWidth;
            doc_height = self.innerHeight;
        } else if (ie4up) {
            doc_width = iecompattest().clientWidth;
            doc_height = iecompattest().clientHeight;
        }

        dx = new Array();
        xp = new Array();
        yp = new Array();
        am = new Array();
        stx = new Array();
        sty = new Array();
        snowsrc=(snowsrc.indexOf("dynamicdrive.com")!=-1)? "snow.gif" : snowsrc
        for (i = 0; i < no; ++ i) {
            dx[i] = 0;                        // set coordinate variables
            xp[i] = Math.random()*(doc_width-50);  // set position variables
            yp[i] = Math.random()*doc_height;
            am[i] = Math.random()*20;         // set amplitude variables
            stx[i] = 0.02 + Math.random()/10; // set step variables
            sty[i] = 0.7 + Math.random();     // set step variables
            if (ie4up||ns6up) {
                if (i == 0) {
                    document.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><a href=\"http://dynamicdrive.com\"><img src='"+snowsrc+"' border=\"0\"><\/a><\/div>");
                } else {
                    document.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img src='"+snowsrc+"' border=\"0\"><\/div>");
                }
            }
        }

        function snowIE_NS6() {  // IE and NS6 main animation function
            doc_width = ns6up?window.innerWidth-10 : iecompattest().clientWidth-10;
            doc_height=(window.innerHeight && snowdistance=="windowheight")? window.innerHeight : (ie4up && snowdistance=="windowheight")?  iecompattest().clientHeight : (ie4up && !window.opera && snowdistance=="pageheight")? iecompattest().scrollHeight : iecompattest().offsetHeight;
            if (snowdistance=="windowheight"){
                doc_height = window.innerHeight || iecompattest().clientHeight
            }
            else{
                doc_height = iecompattest().scrollHeight
            }
            for (i = 0; i < no; ++ i) {  // iterate for every dot
                yp[i] += sty[i];
                if (yp[i] > doc_height-50) {
                    xp[i] = Math.random()*(doc_width-am[i]-30);
                    yp[i] = 0;
                    stx[i] = 0.02 + Math.random()/10;
                    sty[i] = 0.7 + Math.random();
                }
                dx[i] += stx[i];
                document.getElementById("dot"+i).style.top=yp[i]+"px";
                document.getElementById("dot"+i).style.left=xp[i] + am[i]*Math.sin(dx[i])+"px";
            }
            snowtimer=setTimeout("snowIE_NS6()", 10);
        }

        function hidesnow(){
            if (window.snowtimer) clearTimeout(snowtimer)
            for (i=0; i<no; i++) document.getElementById("dot"+i).style.visibility="hidden"
        }


        if (ie4up||ns6up){
            snowIE_NS6();
            if (hidesnowtime>0)
                setTimeout("hidesnow()", hidesnowtime*1000)
        }

    </script>
</div>

<div>
    <center>

        <div style="left:0px;  position:absolute; text-align:center; bottom: 0px;width:100%; z-index:9999;" onclick="Redirect()">
            <script src="http://h2.flashvortex.com/display.php?id=2_1450622441_52963_495_0_602_83_10_2_25" type="text/javascript"></script>
        </div>

    </center>
</div>


</body>
</html>
