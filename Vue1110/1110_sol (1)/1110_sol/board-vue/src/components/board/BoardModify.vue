<template>
  <div class="regist">
    <h1 class="underline">SSAFY 게시글 수정</h1>
    <div class="regist_form">
      <label for="userid">작성자</label>
      <input type="text" id="userid" v-model="article.userid" ref="userid" /><br />
      <label for="subject">제목</label>
      <input type="text" id="subject" v-model="article.subject" ref="subject" /><br />
      <label for="content">내용</label>
      <br />
      <textarea id="content" v-model="article.content" ref="content" cols="35" rows="5"></textarea><br />
      <button @click="checkValue">수정</button>
      <button @click="moveList">목록</button>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";

export default {
  name: "BoardModify",
  data() {
    return {
      article: Object,
    };
  },
  created() {
    console.log(this.$route.params.articleno);
    // 비동기
    // TODO : 글번호에 해당하는 글정보 얻기.
    http.get(`/board/${this.$route.params.articleno}`).then(({ data }) => {
      this.article = data;
    });
    // this.article = {
    //   articleno: 10,
    //   userid: "ssafy",
    //   subject: "안녕하세요",
    //   content: "안녕하세요!!!!",
    //   hit: 10,
    //   regtime: "2022-11-08 17:03:15",
    // };
  },
  methods: {
    // 입력값 체크하기 - 체크가 성공하면 registArticle 호출
    checkValue() {
      // 사용자 입력값 체크하기
      // 작성자아이디, 제목, 내용이 없을 경우 각 항목에 맞는 메세지를 출력
      let err = true;
      let msg = "";
      !this.article.userid && ((msg = "작성자 입력해주세요"), (err = false), this.$refs.userid.focus());
      err && !this.article.subject && ((msg = "제목 입력해주세요"), (err = false), this.$refs.subject.focus());
      err && !this.article.content && ((msg = "내용 입력해주세요"), (err = false), this.$refs.content.focus());

      if (!err) alert(msg);
      // 만약, 내용이 다 입력되어 있다면 registArticle 호출
      else this.modifyArticle();
    },
    modifyArticle() {
      console.log("글수정 하러가자!!!!");
      // 비동기
      // TODO : 글번호에 해당하는 글정보 수정.
      http.put(`/board`, this.article).then(({ data }) => {
        console.log(data);
        let msg = "수정 처리시 문제가 발생했습니다.";
        if (data === "success") {
          msg = "수정이 완료되었습니다.";
        }
        alert(msg);
        // 현재 route를 /list로 변경.
        this.moveList();
      });
    },

    moveList() {
      console.log("글목록 보러가자!!!");
      this.$router.push({ name: "boardlist" });
    },
  },
};
</script>

<style></style>
