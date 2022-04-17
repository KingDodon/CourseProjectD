<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-5">
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
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Duration</th>
                    <th scope="col">Artists</th>
                    <th scope="col">Album</th>
                    <th scope="col">Genre</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="track" items="${listTrack}">
                    <tr>
                        <td id="trackId">${track.getTrack_id()}</td>
                        <td>${track.getTitle()}</td>
                        <td>${track.getDuration()}</td>
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
                                    data-artist="${track.getArtist()}"
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
    console.log(document.getElementById("trackEditInput").value)
    console.log(document.getElementById("EditTrackTitle").value)
    console.log(document.getElementById("EditTrackGenre").value)
    console.log(document.getElementById("EditTrackAlbum").value)
    console.log(document.getElementById("EditTrackDuration").value)
  }
</script>