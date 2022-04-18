<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="CreateTrackModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateTrackModalTitle">Добавить трек</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createTrackForm" action = "${pageContext.request.contextPath}/addTrack" method="post" onsubmit="submit()">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="CreateTrackTitle"
                               placeholder="Введите название трека" required>
                    </div>
                    <div class="mb-3">
                        <input type="number" class="form-control" name="duration" id="CreateTrackDescription"
                               placeholder="Введите длительность трека" required min="1">
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="album_id" required>
                            <option value="" disabled selected hidden>Альбом</option>
                            <c:forEach var="album" items="${listAlbum}">
                                <option value="${album.getAlbum_id()}">${album.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="genre_id" required>
                            <option value="" disabled selected hidden>Жанр</option>
                            <c:forEach var="genre" items="${listGenre}">
                                <option value="${genre.getGenre_id()}">${genre.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="artist_id" multiple id="artists-select" required>
                            <c:forEach var="artist" items="${listArtist}">
                                <option value="${artist.getArtist_id()}">${artist.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
                <button type="submit" form="createTrackForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Добавить
                </button>

            </div>

        </div>
    </div>
</div>
<script>
    /*function submit(){
      let form = document.getElementById("createAlbumForm");
      let select = document.getElementById('artists-select');
      let options = select.selectedOptions;
      let values = Array.from(options).map(({ value }) => value);
      select.value = values;
      console.log(select.value)
      sessionStorage.setItem('tab', 'tracksTab')
    }*/
    function submit(){
      let form = document.getElementById("createAlbumForm")
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
      }, false)
    }
</script>

