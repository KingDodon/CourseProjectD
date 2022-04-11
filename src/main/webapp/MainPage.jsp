<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {box-sizing: border-box}

        /* Set height of body and the document to 100% */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial;
        }

        /* Style tab links */
        .tablink {
            background-color: #555;
            color: white;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            font-size: 17px;
            width: 25%;
        }

        .tablink:hover {
            background-color: #777;
        }

        /* Style the tab content (and add height:100% for full page content) */
        .tabcontent {
            color: white;
            display: none;
            padding: 100px 20px;
            height: 100%;
        }

        #Home {background-color: red;}
        #News {background-color: green;}
        #Contact {background-color: blue;}
        #About {background-color: orange;}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<body>

<button class="tablink" onclick="openPage('Home', this, 'red')">Альбомы</button>
<button class="tablink" onclick="openPage('News', this, 'green')" id="defaultOpen">Исполнители</button>
<button class="tablink" onclick="openPage('Contact', this, 'blue')">Жанры</button>
<button class="tablink" onclick="openPage('About', this, 'orange')">Треки</button>

<div id="Home" class="tabcontent">
    <%@include file="TabAlbum.jsp" %>
</div>

<div id="News" class="tabcontent">
    <h3>News</h3>
    <p>Some news this fine day!</p>
</div>

<div id="Contact" class="tabcontent">
    <%@include file="TabGenre.jsp" %>
</div>

<div id="About" class="tabcontent">
    <h3>About</h3>
    <p>Who we are and what we do.</p>
</div>

<%@include file="Modals/Edit/ModalEditAlbum.jsp" %>
<%@include file="Modals/Edit/ModalEditTrack.jsp" %>
<%@include file="Modals/Edit/ModalEditArtist.jsp" %>
<%@include file="Modals/Edit/ModalEditGenre.jsp" %>

<%@include file="Modals/Create/ModalCreateNewArtist.jsp" %>
<%@include file="Modals/Create/ModalCreateNewGenre.jsp" %>
<%@include file="Modals/Create/ModalCreateNewTrack.jsp" %>
<%@include file="Modals/Create/ModalCreateNewAlbum.jsp" %>

<%@include file="Modals/Delete/ModalDeleteTrack.jsp" %>
<%@include file="Modals/Delete/ModalDeleteArtist.jsp" %>
<%@include file="Modals/Delete/ModalDeleteAlbum.jsp" %>
<%@include file="Modals/Delete/ModalDeleteGenre.jsp" %>

<script>
  function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;
  }

  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").click();
</script>

</body>
</html>