<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditTrackModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditTrackModalTitle">Изменить трек</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editTrackForm" action="${pageContext.request.contextPath}/editTrack" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="EditTrackTitle"
                               placeholder="Введите название трека">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="EditTrackDescription"
                               placeholder="Введите описание трека">
                        <input type="hidden" id="trackEditInput" name="track_id">
                    </div>
                </form>
                <button type="submit" form="editTrackForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;"
                        onclick="sessionStorage.setItem('tab', 'tracksTab')">
                    Сохранить
                </button>

            </div>

        </div>
    </div>
</div>