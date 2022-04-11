<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<div class="col-3">
    <c:forEach var="genre" items="${listGenre}">
        <form id="${genre.getGenre_id()}"
              action="${pageContext.request.contextPath}/deleteGenre?genre_id=${genre.getGenre_id()}"
              method="post"
        >
            <h1>${genre.getTitle()}</h1>
        </form>
        <button type="submit"
                form="${genre.getGenre_id()}">
            Удалить
        </button>
    </c:forEach>
</div>
