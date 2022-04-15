<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-5">
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="me-auto p-2 bd-highlight"><h2>Artists</h2></div>
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateArtistModal"
                        data-bs-toggle="modal"
                >
                    Добавить исполнителя
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="artist" items="${listArtist}">
                    <tr>
                        <td id="artistId">${artist.getArtist_id()}</td>
                        <td>${artist.getName()}</td>
                        <td>${artist.getDescription()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editArtist(this)"
                                    data-id="${artist.getArtist_id()}"
                                    data-name="${artist.getName()}"
                                    data-description="${artist.getDescription()}"
                                    data-bs-target="#EditArtistModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteArtist(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${artist.getArtist_id()}"
                                    data-bs-target="#DeleteArtistModal"
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
  function deleteArtist(but) {
    document.getElementById('artistRemoveInput').value = but.dataset.id;
  }

  function editArtist(but) {
    document.getElementById("artistEditInput").value = but.dataset.id;
    document.getElementById("EditArtistName").value = but.dataset.name;
    document.getElementById("EditArtistDescription").value = but.dataset.description;
  }
</script>