<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="me-auto p-2 bd-highlight"><h2>Albums</h2></div>
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateAlbumModal"
                        data-bs-toggle="modal"
                >
                    Добавить альбом
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 5%">#</th>
                    <th scope="col" style="width: 30%">Title</th>
                    <th scope="col" style="width: 50%">Description</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="album" items="${listAlbum}">
                    <tr>
                        <td id="albumId">${album.getAlbum_id()}</td>
                        <td>${album.getTitle()}</td>
                        <td>${album.getDescription()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editAlbum(this)"
                                    data-id="${album.getAlbum_id()}"
                                    data-title="${album.getTitle()}"
                                    data-description="${album.getDescription()}"
                                    data-bs-target="#EditAlbumModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteAlbum(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${album.getAlbum_id()}"
                                    data-bs-target="#DeleteAlbumModal"
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
  function deleteAlbum(but) {
    document.getElementById('albumRemoveInput').value = but.dataset.id;
  }

  function editAlbum(but) {
    document.getElementById("albumEditInput").value = but.dataset.id;
    document.getElementById("EditAlbumTitle").value = but.dataset.title;
    document.getElementById("EditAlbumDescription").value = but.dataset.description;
  }
</script>