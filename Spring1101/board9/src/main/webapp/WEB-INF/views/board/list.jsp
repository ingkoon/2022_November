<!DOCTYPE html>
<html>
<head>
<title>boardlist</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous"
  />
</head>

<body>
<div class="container mt-3">
  <h2 class="text-center text-success">목록</h2>
            <table class="table table-hover">
            <colgroup>
              <col width="100" />
              <col width="200" />
              <col width="*" />
              <col width="100" />
            </colgroup>
            <thead class="table-success">
              <tr>
                <th class="text-center">번호</th>
                <th class="text-center">작성자</th>
                <th class="text-center">제목</th>
                <th class="text-center">조회수</th>
             
              </tr>
            </thead>
            <tbody id="userlist"></tbody>
          </table>
    
</div>

<!-- 회원 정보 모달 -->
    <div
      class="modal fade"
      id="userViewModal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><mark class="purple">목록 정보</mark></h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <table class="table table-bordered">
              <colgroup>
                <col width="120" />
                <col width="*" />
              </colgroup>
              <tbody>
                <tr>
                  <th class="text-center">작성자</th>
                  <td class="text-left" id="vid"></td>
                </tr>
                <tr>
                  <th class="text-center">ID</th>
                  <td class="text-left" id="vsubject"></td>
                </tr>
                <tr>
                  <th class="text-center">조회수</th>
                  <td class="text-left" id="vhit"></td>
                </tr>
               
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
 <!-- 회원 등록 Modal -->
  <div class="col-md-2 text-start">
              <button
                type="button"
                class="btn btn-outline-primary"
                data-bs-toggle="modal"
                data-bs-target="#registerModal"
              >
                글쓰기
              </button>
            </div>
    <div
      class="modal fade"
      id="registerModal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><mark class="purple">글쓰기</mark></h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="wuserId" class="form-label">아이디 : </label>
              <input type="text" class="form-control" id="wuserId" 
              placeholder="아이디..." />
            </div>
            <div class="mb-3">
              <label for="wsubject" class="form-label">주제 : </label>
              <input type="text" class="form-control" id="wsubject" 
              placeholder="주제..." />
            </div>
           <div class="mb-3 mt-3">
      <label for="wcontent">내 용:</label>
      <textarea class="form-control" rows="5" id="wcontent" ></textarea>
     </div>
    
          </div>
          <div class="modal-footer">
            <button
              type="button"
              id="btn-join"
              class="btn btn-outline-primary"
              data-bs-dismiss="modal"
            >
              글쓰기
            </button>
            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">
              닫기
            </button>
          </div>
        </div>
      </div>
    </div>
 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
<script>
      let root = "/board9";
      // 회원 목록.
      fetch(`${root}/aboard/list`)
        .then((response) => response.json())
        .then((data) => makeList(data));

      // 회원 목록 tbody
      function makeList(boards) {
        let tbody = ``;
        boards.forEach(function (board) {
          tbody += `
						<tr id="view_${board.articleNo}" class="view text-center"
						data-id="${board.articleNo}" ondblclick="userView(this);">
							<td>${board.articleNo}</td>
							<td>${board.userId}</td>
							<td>${board.subject}</td>
							<td>${board.hit}</td>
						</tr>
					`;
        });
        document.querySelector("#userlist").innerHTML = tbody;
      }
      
      
      //회원 정보 보기.
      function userView(el) {
        var modal = new bootstrap.Modal(document.getElementById("userViewModal"), {
          backdrop: true,
          keyboard: false,
        });
        let id = el.getAttribute("data-id");
        fetch(`${root}/aboard/list/${id}`)
          .then((response) => response.json())
          .then((data) => {
            document.querySelector("#vid").innerText = data.userId;
            document.querySelector("#vsubject").innerText = data.subject;
            document.querySelector("#vhit").innerText = data.hit;
            modal.show();
          });
      };
      
      document.querySelector("#btn-join").addEventListener("click", function () {
          if (!document.querySelector("#wuserId").value) {
            alert("아이디입력!!");
            return;
          } else if (!document.querySelector("#wsubject").value) {
            alert("제목입력!!");
            return;
          } else if (!document.querySelector("#wcontent").value) {
            alert("내용입력!!");
            return;
          } else {
            let form = document.querySelector("#form-join");
            form.setAttribute("action", `${root}/aboard/write`);
            form.submit();
          }
        });
      
    </script>
</body>
</html>