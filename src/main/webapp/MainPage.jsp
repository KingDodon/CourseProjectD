<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<button class="tablink" onclick="openPage('Albums', this, '#d3b49d')" id="albumsTab">Альбомы</button>
<button class="tablink" onclick="openPage('Artists', this, '#bfc3d2')" id="artistsTab">Исполнители</button>
<button class="tablink" onclick="openPage('Genres', this, '#abdcbd')" id="genresTab">Жанры</button>
<button class="tablink" onclick="openPage('Tracks', this, '#9ad0c9')" id="tracksTab">Треки</button>

<div id="Albums" class="tabcontent">
    <%@include file="TabAlbum.jsp" %>
</div>

<div id="Artists" class="tabcontent">
    <h3>News</h3>
    <p>Some news this fine day!</p>
</div>

<div id="Genres" class="tabcontent">
    <%@include file="TabGenre.jsp" %>
</div>

<div id="Tracks" class="tabcontent">
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
    sessionStorage.setItem('tab', elmnt.id);
  }

  window.onload = function () {
    if (sessionStorage.getItem("tab") == null)
      document.getElementById("albumsTab").click();
    else
      document.getElementById(sessionStorage.getItem("tab")).click();
  }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
</html>