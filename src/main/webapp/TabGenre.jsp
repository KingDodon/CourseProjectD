<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<div class="col-5">
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
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                    <c:forEach var="genre" items="${listGenre}">
                    <tr>
                        <td id="genreId">${genre.getGenre_id()}</td>
                        <td>${genre.getTitle()}</td>
                        <td>
                            <button type="button" class="btn btn-outline-secondary">Edit</button>
                            <button type="button"
                                    id="deleteGenre"
                                    class="btn btn-outline-danger"
                                    data-id="${genre.getGenre_id()}"
                                    data-bs-target="#DeleteGenreModal"
                                    data-bs-toggle="modal"
                            >
                                Del
                            </button>
                        </td>
                        <%--
                        <button type="submit"
                                form="${genre.getGenre_id()}">
                            Удалить
                        </button>--%>

                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
