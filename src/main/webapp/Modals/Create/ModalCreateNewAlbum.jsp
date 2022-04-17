<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="CreateAlbumModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateAlbumModalTitle">Добавить альбом</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createAlbumForm" action="${pageContext.request.contextPath}/addAlbum" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="CreateAlbumTitle"
                               placeholder="Введите название альбома">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="CreateAlbumDescription"
                               placeholder="Введите описание альбома">
                    </div>
                </form>
                <button type="submit" form="createAlbumForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;"
                        onclick="sessionStorage.setItem('tab', 'albumsTab')">
                    Добавить
                </button>

            </div>

        </div>
    </div>
</div>