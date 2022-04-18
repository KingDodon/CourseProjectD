<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="me-auto p-2 bd-highlight"><h2>Genres</h2></div>
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateGenreModal"
                        data-bs-toggle="modal"
                >
                    Добавить жанр
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 5%">#</th>
                    <th scope="col" style="width: 80%">Title</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                    <c:forEach var="genre" items="${listGenre}">
                    <tr>
                        <td id="genreId">${genre.getGenre_id()}</td>
                        <td>${genre.getTitle()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editGenre(this)"
                                    data-id="${genre.getGenre_id()}"
                                    data-title="${genre.getTitle()}"
                                    data-bs-target="#EditGenreModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteGenre(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${genre.getGenre_id()}"
                                    data-bs-target="#DeleteGenreModal"
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
  function deleteGenre(but) {
    document.getElementById('genreRemoveInput').value = but.dataset.id;
    console.log(document.getElementById("genreRemoveInput").value)
  }

  function editGenre(but) {
    document.getElementById("genreEditInput").value = but.dataset.id;
    document.getElementById("EditGenreTitle").value = but.dataset.title;
  }
</script>