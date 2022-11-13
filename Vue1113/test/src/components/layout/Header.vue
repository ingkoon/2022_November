<template>
  <div>
    <!-- 상단 navbar start -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
      <div class="container">
        <router-link
          to="/"
          class="navbar-brand text-primary fw-bold"
          id="btn-mv-index"
        >
          <img src="@/assets/img/ssafy_logo.png" alt="" width="60" />
          Where Is My Home
        </router-link>
        <!-- <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button> -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-lg-0">
            <li class="nav-item">
              <a
                class="nav-link"
                aria-current="page"
                href="${root}/board/list?pgno=1&key=&word="
                >공지사항</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                aria-current="page"
                href="${root}/house/mvaptapi"
                >아파트 매매정보</a
              >
            </li>

            <c:if test="${userinfo.userRole eq 'admin' }">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="${root}/user/list"
                  >회원 관리</a
                >
              </li>
            </c:if>
          </ul>
          <!-- 로그인 전 -->
          <c:if test="${empty userinfo}">
            <ul class="navbar-nav me-2 mb-lg-0">
              <li class="nav-item">
                <a
                  class="nav-link"
                  id="btn-mv-join"
                  aria-current="page"
                  href="${root}/user/join"
                  >회원가입</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  id="btn-mv-login"
                  aria-current="page"
                  href="${root}/user/login"
                  >로그인</a
                >
              </li>
            </ul>
          </c:if>
          <!-- 로그인 후 -->
          <c:if test="${!empty userinfo}">
            <ul class="navbar-nav me-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link"
                  ><strong>${userinfo.userName}</strong>
                  (${userinfo.userId})님</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  aria-current="page"
                  href="${root}/user/logout"
                  >로그아웃</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  id="btn-info"
                  aria-current="page"
                  href="${root}/user/info"
                  >회원정보</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  aria-current="page"
                  href="${root}/star/liststar"
                  >관심지역</a
                >
              </li>
            </ul>
          </c:if>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "header",
};
</script>

<style></style>
