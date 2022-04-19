<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="me-auto p-2 bd-highlight"><h2>Tracks</h2></div>
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateTrackModal"
                        data-bs-toggle="modal"
                >
                    Добавить трек
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 5%">#</th>
                    <th scope="col" style="width: 16%">Title</th>
                    <th scope="col" style="width: 16%">Duration</th>
                    <th scope="col" style="width: 16%">Artists</th>
                    <th scope="col" style="width: 16%">Album</th>
                    <th scope="col" style="width: 16%">Genre</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="track" items="${listTrack}">
                    <tr>
                        <td id="trackId">${track.getTrack_id()}</td>
                        <td>${track.getTitle()}</td>
                        <td>${track.getDuration()/ 60 % 60}:${track.getDuration()/ 1 % 60}</td>
                        <td>
                            <c:forEach var="artist" items="${track.getArtist()}">
                                <span>${artist.getName()}</span>
                            </c:forEach>
                        </td>
                        <td>${track.getAlbum().getTitle()}</td>
                        <td>${track.getGenre().getTitle()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editTrack(this)"
                                    data-id="${track.getTrack_id()}"
                                    data-title="${track.getTitle()}"
                                    data-duration="${track.getDuration()}"
                                    data-album="${track.getAlbum().getAlbum_id()}"
                                    data-genre="${track.getGenre().getGenre_id()}"
                                    data-artist="${track.getArrayId()}"
                                    data-bs-target="#EditTrackModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteTrack(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${track.getTrack_id()}"
                                    data-bs-target="#DeleteTrackModal"
                                    data-bs-toggle="modal"
                            >
                                Del
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
  function deleteTrack(but) {
    document.getElementById('trackRemoveInput').value = but.dataset.id;
  }

  function editTrack(but) {
    document.getElementById("trackEditInput").value = but.dataset.id;
    document.getElementById("EditTrackTitle").value = but.dataset.title;
    document.getElementById("EditTrackGenre").value = but.dataset.genre;
    document.getElementById("EditTrackAlbum").value = but.dataset.album;
    document.getElementById("EditTrackDuration").value = but.dataset.duration;
    let artists = but.dataset.artist;
    console.log(artists)
    let options = document.getElementsByClassName("artist");
    for(let option of options){
      if(artists.includes(option.value)){
        option.setAttribute("selected", "selected")
      }
    }
  }
</script>