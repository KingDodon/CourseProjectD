<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditGenreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateGenreModalTitle">Изменить жанр</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editGenreForm" action="${pageContext.request.contextPath}/editGenre" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="EditGenreTitle"
                               placeholder="Введите название жанра">
                        <input type="hidden" id="genreEditInput" name="genre_id">
                    </div>
                </form>
                <button type="submit" form="editGenreForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;"
                        onclick="sessionStorage.setItem('tab', 'genresTab')">
                    Сохранить
                </button>

            </div>

        </div>
    </div>
</div>