<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-3">
  <ul class="nav nav-pills">
    <li class="nav-item">
      <a class="nav-link active" href="${root}/board/list">목록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="${root}/board/write">글쓰기</a>
    </li>
  </ul>
</div>
<div class="container mt-3">
  <h2>게시글 상세보기</h2>
  <form action="${root}/board/update" method='post'>
  <div class="mb-3 mt-3">
      <label for="articleNo">번호:</label>
      <input type="text" class="form-control" id="articleNo" 
      value="${board.articleNo}" readonly="readonly"
      placeholder="Enter articleNo" name="articleNo">
    </div>
    <div class="mb-3 mt-3">
      <label for="userId">아이디:</label>
      <input type="text" class="form-control" id="userId" 
      value="${board.userId}" readonly="readonly"
      placeholder="Enter userId" name="userId">
    </div>
    <div class="mb-3 mt-3">
      <label for="subject">제 목:</label>
      <input type="text" class="form-control" id="subject" 
       value="${board.subject}" 
      placeholder="Enter subject" name="subject">
    </div>
    <div class="mb-3 mt-3">
      <label for="hit">조회수:</label>
      <input type="text" class="form-control" id="hit" 
       value="${board.hit}" 
      placeholder="Enter hit" name="hit">
    </div>
    <div class="mb-3 mt-3">
      <label for="registerTime">작성일:</label>
      <input type="text" class="form-control" id="registerTime" 
       value="${board.registerTime}" 
      placeholder="Enter registerTime" name="registerTime">
    </div>
     <div class="mb-3 mt-3">
      <label for="content">내 용:</label>
      <textarea class="form-control" rows="5" id="content" 
      name="content">${board.content}</textarea>
     </div>
    <button type="submit" class="btn btn-primary">글수정</button>
  </form>
  <form action="${root}/board/delete/${board.articleNo}" method="post">
   	<button type="submit" class="btn btn-dark">글삭제</button>
  </form>
</div>
</body>
</html>