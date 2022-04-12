<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="CreateGenreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-lg" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateGenreModalTitle">Добавить новый жанр</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createGenreForm" action="${pageContext.request.contextPath}/addGenre" method="post">
                    <!------------------------ФИО--------------------------->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="CreateGenreTitle"
                               placeholder="Введите название жанра">
                    </div>
                </form>
                <button type="submit" form="createGenreForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;"
                        onclick="sessionStorage.setItem('tab', 'genresTab')">
                    Добавить
                </button>

            </div>

        </div>
    </div>
</div>