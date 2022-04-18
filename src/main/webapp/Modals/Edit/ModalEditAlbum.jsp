<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditAlbumModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditAlbumModalTitle">Изменить альбом</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editAlbumForm" action="${pageContext.request.contextPath}/editAlbum" method="post" onsubmit="submit()">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="EditAlbumTitle"
                               placeholder="Введите название альбома" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="EditAlbumDescription"
                               placeholder="Введите описание альбома" required>
                        <input type="hidden" id="albumEditInput" name="album_id">
                    </div>
                </form>
                <button type="submit" form="editAlbumForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;"
                        onclick="sessionStorage.setItem('tab', 'albumsTab')">
                    Сохранить
                </button>

            </div>

        </div>
    </div>
</div>

<script>
  function submit(){
    let form = document.getElementById("editAlbumForm")
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }
</script>