<template>
  <div class="regist">
    <h1>SSAFY 글 삭제</h1>
    <div>삭제중....</div>
  </div>
</template>

<script>
import http from "@/util/http-common";

export default {
  name: "BoardDelete",
  created() {
    console.log(this.$route.params.articleno);
    // 비동기
    // TODO : 글번호에 해당하는 글을 삭제.
    http.delete(`/board/${this.$route.params.articleno}`).then(({ data }) => {
      let msg = "삭제 처리시 문제가 발생했습니다.";
      if (data === "success") {
        msg = "삭제가 완료되었습니다.";
      }
      alert(msg);
      // 현재 route를 /list로 변경.
      this.$router.push({ name: "boardlist" });
    });
  },
};
</script>

<style></style>
