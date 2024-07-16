var queryString = new URLSearchParams(window.location.search);
let tei_xml = queryString.get('process');
let author_arr = tei_xml.split("_", 1);
let author = author_arr.join("")
let writer = author.concat("/");
let extension = ".xml";
let folder_xml = "../xml/";
let process_xml = folder_xml.concat(writer,tei_xml,extension);

var a = 0; 
var count = 0;


// function to transform the text encoded in TEI with the xsl stylesheet "Frankenstein_text.xsl", this will apply the templates and output the text in the html <div id="text">
function documentLoader() {

    Promise.all([
      fetch(process_xml).then(response => response.text()),
      fetch("../xsl/1_make-changelist.xsl").then(response => response.text()),
      fetch("../xsl/2_add-n-attribute.xsl").then(response => response.text()),
      fetch("../xsl/to_html_english.xsl").then(response => response.text())
    ])
    .then(function ([xmlString, xslString1, xslString2, xslString3]) {
      var parser = new DOMParser();
      var xml_doc = parser.parseFromString(xmlString, "text/xml");
      var xsl1_doc = parser.parseFromString(xslString1, "text/xml");
      var xsl2_doc = parser.parseFromString(xslString2, "text/xml");
      var xsl3_doc = parser.parseFromString(xslString3, "text/xml");

      var xsltProcessor = new XSLTProcessor();
      xsltProcessor.importStylesheet(xsl1_doc);
      var resultDocument1 = xsltProcessor.transformToFragment(xml_doc, document);
      xsltProcessor.importStylesheet(xsl2_doc);
      var resultDocument2 = xsltProcessor.transformToFragment(resultDocument1, document);
      xsltProcessor.importStylesheet(xsl3_doc);
      var resultDocument3 = xsltProcessor.transformToFragment(resultDocument2, document);
      var criticalElement = document.getElementById("text");
      criticalElement.innerHTML = ''; // Clear existing content
      criticalElement.appendChild(resultDocument3);
    })
    .catch(function (error) {
      console.error("Error loading documents:", error);
    });
  }
  


  // Initial document load
  documentLoader();


// EXTRA: write a function that will display the text as a reading text by clicking on a button or another dropdown list, meaning that all the deletions are removed and that the additions are shown inline (not in superscript)
function showhideimage() {
    // var y = document.getElementsByClassName("del context");
    
    $(".my_images").toggleClass('temporaryhide');
}
const elements = document.querySelectorAll('.add');
    const revs = elements.length;
    console.log(revs); 
$(document).ready(function(){
        
        /*  var add = document.getElementsByClassName("add").length;
        var del = document.getElementsByClassName("del").length;
        var con = document.getElementsByClassName("cont").length;
        var chap = document.getElementsByClassName("chap").length;*/
        
        
        console.log(rev);
           //     var countButton = document.getElementById("countButton");
                        
        $('body')
             .on("click", ".start_btn", function () {
                start();
             })
             .on("click",".refresh_btn", function(){
                refresh();
             })
             .on("click", "#countButton",function(e){
                 e.preventDefault();
                 count++;
                 switch (count) {
                     case 1:
                     previous();
                     break;
                     default:
                     decrease();
                 }})
              .on("click",".increase_btn", function(){
                  increase();
                  console.log(a);
              })
              ;


});



function increase() {
    
    a = a+1;
    console.log(a);
    count = 0;
    var elmnt = document.getElementById(a);
    elmnt.scrollIntoView({
        behavior: "smooth", block: "center"
    });
    document.getElementById("demo").innerHTML = "Stap: " + a + "/" + rev;
    if (elmnt.classList.contains('del')) {
        document.getElementById(a).classList.add('thick-del');
        document.getElementById(a).style.textDecoration = "line-through";
        setTimeout(function () {
            document.getElementById(a).style.display = "none";
        },
        950);
    } else if (elmnt.classList.contains('mod')) {
        document.getElementById(a).style.color = "#ff9900";
        document.getElementById(a).classList.add('thick');
        setTimeout(function () {
            document.getElementById(a).classList.remove('thick');
        },
        950);
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center"
        });
    } else {
        document.getElementById(a).style.display = "inline";
        document.getElementById(a).classList.add('thick');
        setTimeout(function () {
            document.getElementById(a).classList.remove('thick');
        },
        950);
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center"
        });
    }
}


function previous() {
   // a;
    var elmnt = document.getElementById(a);
    elmnt.scrollIntoView({
        behavior: "smooth", block: "center", inline: "center"
    });
    
    if (elmnt.classList.contains('del')) {
        document.getElementById(a).style.display = "inline";
        document.getElementById(a).classList.remove('thick-del');
        document.getElementById(a).style.textDecoration = "none";
    } else if (elmnt.classList.contains('mod')) {
        document.getElementById(a).style.color = "white";
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center", inline: "center"
        });
    } else {
        document.getElementById(a).style.display = "none";
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center", inline: "center"
        });
    }
    a--;
    document.getElementById("demo").innerHTML = "Stap: " + a + "/" + revs;
}

function decrease() {
    
    var elmnt = document.getElementById(a);
    elmnt.scrollIntoView({
        behavior: "smooth", block: "center", inline: "center"
    });
    if (elmnt.classList.contains('del')) {
        document.getElementById(a).style.display = "inline";
        document.getElementById(a).classList.remove('thick-del');
        document.getElementById(a).style.textDecoration = "none";
    } else if (elmnt.classList.contains('mod')) {
        document.getElementById(a).style.color = "";
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center", inline: "center"
        });
    } else {
        document.getElementById(a).style.display = "none";
        elmnt.scrollIntoView({
            behavior: "smooth", block: "center", inline: "center"
        });
    }
    a--;
    document.getElementById("demo").innerHTML = "Stap: " + a + "/" + rev;
}







function loop() {
    if (a < rev) {
        if (! flag) {
            return
        };
        increase();
        setTimeout(loop, 950);
    } else {
        stop();
    }
}

function stop() {
    flag = false;
}
function start() {
    flag = true;
    loop();
}


function refresh() {
    a = 0;
    $(".del").removeClass("thick-del").css({"text-decoration": "none"}).show();
    $(".add, .mod, .cont").hide();
    document.getElementById("demo").innerHTML = "Stap: " + "0" + "/" + rev;
    $("div.word")[0].scrollIntoView({behavior: "smooth"});
    
    
    
    /*  do {
    
        task(a);
        a--;
    }
    while (a < 0);
    function task(a) {
        setTimeout(function () {
            
            
            if (elmnt.classList.contains('del')) {
                document.getElementById(a).style.display = "inline";
                document.getElementById(a).classList.remove('thick-del');
                document.getElementById(a).style.textDecoration = "none";
            } else {
                document.getElementById(a).style.display = "none";
            }
        });
    }*/
}



// When the user clicks on div, open the popup
function InfoFunction() {
    var popup = document.getElementById("Info");
    popup.classList.toggle("show");
}
function showhideimage() {
    // var y = document.getElementsByClassName("del context");
    
    $(".my_images").toggleClass('temporaryhide');
}

function showhidedeletions() {
    // var y = document.getElementsByClassName("del context");
    
    $(".del").toggleClass('temporaryhide');
    
    /* var check = document.getElementById("checkdel");
    if (check.style.visibility === 'visible') {
    
    } else {
    $(".del").show();
    }*/
    
    
    
    /*var y = document.querySelectorAll(".del");
    
    
    
    var i;
    
    for (i = 0; i < y.length; i++) {
    //console.log(y[i]);
    if (y[i].style.display === "none") {
    y[i].style.display = "inline";
    } else {
    y[i].style.display = "none";
    }
    
    
    }
    var delprecontext = document.getElementsByClassName("del pre-context");
    var i;
    for (i = 0; i < delprecontext.length; i++) {
    if (delprecontext[i].style.display === "none") {
    delprecontext[i].style.display = "inline";
    } else {
    delprecontext[i].style.display = "none";
    }
    }
    var deltypo = document.getElementsByClassName("del typo");
    var i;
    for (i = 0; i < deltypo.length; i++) {
    if (deltypo[i].style.display === "none") {
    deltypo[i].style.display = "inline";
    } else {
    deltypo[i].style.display = "none";
    }
    }
    var deltrans = document.getElementsByClassName("del trans");
    var i;
    for (i = 0; i < deltrans.length; i++) {
    if (deltrans[i].style.display === "none") {
    deltrans[i].style.display = "inline";
    } else {
    deltrans[i].style.display = "none";
    }
    }
    
     */
    
    
    
    checkDel();
    checktypo();
}
function checknotes() {
    $(".checkNotes").toggleClass('colornotes');
}
function showhidenotes() {
    
    $(".notes").toggleClass('colornotes');
    
    checknotes();
}

function colordeletions() {
    var y = document.getElementsByClassName("del context");
    var i;
    for (i = 0; i < y.length; i++) {
        if (y[i].style.color === "#B20D30", y[i].style.textDecoration === "line-through") {
            y[i].style.color = "";
            y[i].style.textDecoration = "";
        } else {
            y[i].style.color = "#B20D30";
            y[i].style.textDecoration = "line-through";
        }
    }
    var delprecontext = document.getElementsByClassName("del pre-context");
    var i;
    for (i = 0; i < delprecontext.length; i++) {
        if (delprecontext[i].style.color === "#F35376", delprecontext[i].style.textDecoration === "line-through") {
            delprecontext[i].style.color = "";
            delprecontext[i].style.textDecoration = "";
        } else {
            delprecontext[i].style.color = "#F35376";
            delprecontext[i].style.textDecoration = "line-through";
        }
    }
    var deltypo = document.getElementsByClassName("del typo");
    var i;
    for (i = 0; i < deltypo.length; i++) {
        if (deltypo[i].style.color === "#875531", deltypo[i].style.textDecoration === "line-through") {
            deltypo[i].style.color = "";
            deltypo[i].style.textDecoration = "";
        } else {
            deltypo[i].style.color = "#875531";
            deltypo[i].style.textDecoration = "line-through";
        }
    }
    var deltrans = document.getElementsByClassName("del trans");
    var i;
    for (i = 0; i < deltrans.length; i++) {
        if (deltrans[i].style.color === "#377495", deltrans[i].style.textDecoration === "line-through") {
            deltrans[i].style.color = "";
            deltrans[i].style.textDecoration = "";
        } else {
            deltrans[i].style.color = "#377495";
            deltrans[i].style.textDecoration = "line-through";
        }
    }
    checkDel();
    checktypo();
}
function checkDel() {
    var check = document.getElementById("checkdel");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function showhideadditions() {
    var z = document.getElementsByClassName("add");
    var i;
    for (i = 0; i < z.length; i++) {
        if (z[i].style.display === "inline") {
            z[i].style.display = "none";
        } else {
            z[i].style.display = "inline";
        }
    }
    var a = document.getElementsByClassName("cont");
    var i;
    for (i = 0; i < a.length; i++) {
        if (a[i].style.display === "inline") {
            a[i].style.display = "none";
        } else {
            a[i].style.display = "inline";
        }
    }
    var p = document.getElementsByClassName("mod");
    var i;
    for (i = 0; i < p.length; i++) {
        if (p[i].style.color === "") {
            p[i].style.color = "#F7B801";
        } else {
            p[i].style.color = "";
        }
    }
    checkAdd();
}

function showhidenotes() {
    var z = document.getElementsByClassName("notes");
    var i;
    for (i = 0; i < z.length; i++) {
        if (z[i].style.display === "inline") {
            z[i].style.display = "none";
        } else {
            z[i].style.display = "inline";
        }
    }
    
    checknotes();
}

function checkAdd() {
    var check = document.getElementById("checkadd");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function showhiderevisions() {
    var check = document.getElementById("checkrevisions");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
    
    showhideadditions();
    colordeletions();
}


function showhidetypo() {
    var x = document.getElementsByClassName("del typo");
    var i;
    for (i = 0; i < x.length; i++) {
        if (x[i].style.display === "none") {
            x[i].style.display = "inline";
        } else {
            x[i].style.display = "none";
        }
    }
    checktypo();
}

function checktypo() {
    var check = document.getElementById("checktypo");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function checknotes() {
    var check = document.getElementById("checknotes");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function numbers() {
    var u = document.getElementsByClassName("n");
    var i;
    for (i = 0; i < u.length; i++) {
        if (u[i].style.display === "inline") {
            u[i].style.display = "none";
        } else {
            u[i].style.display = "inline";
        }
    }
    var check = document.getElementById("checknumbers");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function BIGnumbers() {
    var u = document.getElementsByClassName("n");
    var i;
    for (i = 0; i < u.length; i++) {
        if (u[i].style.fontSize === "100%") {
            u[i].style.fontSize = "60%";
        } else {
            u[i].style.fontSize = "100%";
        }
    }
    var check = document.getElementById("checkmark");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}

function symbols() {
    var symb = document.getElementsByClassName("symbol");
    var i;
    for (i = 0; i < symb.length; i++) {
        if (symb[i].style.display === "inline") {
            symb[i].style.display = "none";
        } else {
            symb[i].style.display = "inline";
        }
    }
    var check = document.getElementById("checksymbol");
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
}




function createLine() {
    
    var txt = document.getElementsByClassName('transcription');
    
    for (var i = 0; i < txt.length; i++) {
        if (txt[i].style.color === 'rgba(0, 0, 0, 0.5)') {
            txt[i].style.color = '';
        } else {
            txt[i].style.color = 'rgba(0, 0, 0, 0.5)';
        }
    }
    
    var txtdel = document.getElementsByClassName('del');
    for (var i = 0; i < txtdel.length; i++) {
        if (txtdel[i].style.color === 'rgba(0, 0, 0, 0.5)') {
            txtdel[i].style.color = '';
        } else {
            txtdel[i].style.color = 'rgba(0, 0, 0, 0.5)';
        }
    }
    colordeletions();
    var txtadd = document.getElementsByClassName('add');
    for (var i = 0; i < txtadd.length; i++) {
        if (txtadd[i].style.color === 'rgba(0, 0, 0, 0.5)') {
            txtadd[i].style.color = '';
        } else {
            txtadd[i].style.color = 'rgba(0, 0, 0, 0.5)';
        }
    }
    
    var txtcont = document.getElementsByClassName('cont');
    for (var i = 0; i < txtcont.length; i++) {
        if (txtcont[i].style.color === 'rgba(0, 0, 0, 0.5)') {
            txtcont[i].style.color = '';
        } else {
            txtcont[i].style.color = 'rgba(0, 0, 0, 0.5)';
        }
    }
    
    var txtchap = document.getElementsByClassName('chap');
    for (var i = 0; i < txtchap.length; i++) {
        if (txtchap[i].style.color === 'rgba(0, 0, 0, 0.5)') {
            txtchap[i].style.color = '';
        } else {
            txtchap[i].style.color = 'rgba(0, 0, 0, 0.5)';
        }
    }
    
   // var a;
    var check = document.getElementById("checkpath");
    
    if (check.style.visibility === 'visible') {
        check.style.visibility = 'hidden';
    } else {
        check.style.visibility = 'visible';
    }
    
    for (a = 1; a <= rev; a++) {
        var first = document.getElementById(a);
        var second = document.getElementById(a + 1);
        var x1 = first.offsetLeft;
        var y1 = first.offsetTop;
        var x2 = second.offsetLeft;
        var y2 = second.offsetTop;
        
        distance = Math.sqrt (((x1 - x2) *(x1 - x2)) + ((y1 - y2) *(y1 - y2)));
        
        
        xMid = (x1 + x2) / 2;
        yMid = (y1 + y2) / 2;
        
        slopeInRadian = Math.atan2(y1 - y2, x1 - x2)
        slopeInDegrees = (slopeInRadian * 180) / Math.PI;
        
        line = document.getElementById("line" + a)
        
        line.style.top = yMid
        line.style.left = xMid - (distance / 2)
        line.style.transform = "rotate(" + slopeInDegrees + "deg)";
        line.style.width = distance
        
        var x = document.getElementById("line" + a);
        if (x.style.display === "block") {
            x.style.display = "none";
        } else {
            x.style.display = "block";
        }
        
        if (a < (rev/10)) {
            document.getElementById("line" + a).style.backgroundColor = "#FEB685";
        }
        else if (a < ((rev/10))*2) {
            document.getElementById("line" + a).style.backgroundColor = "#FE9D5D";
        }
        else if (a < ((rev/10))*4) {
            document.getElementById("line" + a).style.backgroundColor = "#FE8534";
        }
        else if (a < ((rev/10))*6) {
            document.getElementById("line" + a).style.backgroundColor = "#FE6C0B";
        }
        else if (a < ((rev/10))*8) {
            document.getElementById("line" + a).style.backgroundColor = "#DF5A01";
        }
        else {
            document.getElementById("line" + a).style.backgroundColor = "#B74A01";
        }
        if (y2 < y1) {
            if (a < (rev/10)) {
            document.getElementById("line" + a).style.backgroundColor = "#4E9BF9";
            }
            else if (a < ((rev/10))*2) {
                document.getElementById("line" + a).style.backgroundColor = "#2684F7";
            }
            else if (a < ((rev/10))*4) {
                document.getElementById("line" + a).style.backgroundColor = "#096FEC";
            }
            else if (a < ((rev/10))*6) {
                document.getElementById("line" + a).style.backgroundColor = "#075DC5";
            }
            else if (a < ((rev/10))*8) {
                document.getElementById("line" + a).style.backgroundColor = "#064A9D";
            }
            else {
                document.getElementById("line" + a).style.backgroundColor = "#043876";
            }
        }
       document.getElementById("line1").style.backgroundColor = "green";
    }
}

function hoverByClass(classname,colorover,colorout="transparent"){
	var elms=document.getElementsByClassName(classname);
	for(var i=0;i<elms.length;i++){
		elms[i].onmouseover = function(){
			for(var k=0;k<elms.length;k++){
				elms[k].style.backgroundColor=colorover;
				elms[k].scrollIntoView({
            behavior: "smooth", block: "center"
        });
			}
		};
		elms[i].onmouseout = function(){
			for(var k=0;k<elms.length;k++){
				elms[k].style.backgroundColor=colorout;
			}
		};
	}
}
hoverByClass("note1","#C4F1BE");
hoverByClass("note2","#C4F1BE");
hoverByClass("note3","#C4F1BE");
hoverByClass("note4","#C4F1BE");
hoverByClass("note5","#C4F1BE");
hoverByClass("note6","#C4F1BE");
hoverByClass("note7","#C4F1BE");
hoverByClass("note8","#C4F1BE");
hoverByClass("note9","#C4F1BE");
hoverByClass("note10","#C4F1BE");
hoverByClass("note11","#C4F1BE");
hoverByClass("note12","#C4F1BE");
hoverByClass("note13","#C4F1BE");
hoverByClass("note14","#C4F1BE");
hoverByClass("note15","#C4F1BE");
hoverByClass("note16","#C4F1BE");
hoverByClass("note17","#C4F1BE");
hoverByClass("note18","#C4F1BE");
hoverByClass("note19","#C4F1BE");
hoverByClass("note20","#C4F1BE");
