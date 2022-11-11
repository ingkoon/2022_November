<template>
  <b-tr>
    <b-td v-text="index + 1"></b-td>
    <b-td
      v-text="article.subject"
      @click="showArticle(article.articleNo)"
    ></b-td>
    <b-td v-text="article.userId"></b-td>
    <b-td> {{ article.registerTime }}</b-td>
    <b-td @click="deleteId(article.articleNo)"><button>삭제</button></b-td>
  </b-tr>
</template>
<script>
import http from "@/api/http.js";
export default {
  name: "ArticleItem",
  props: {
    article: {},
    index: Number,
  },
  methods: {
    showArticle(no) {
      console.log(no);
      this.$router.push(`/board/detail/${no}`);
    },
    deleteId(no) {
      http
        .delete(`/${no}`)
        .then(({ data }) => {
          if (data != null) alert("글을 삭제했습니다.");
          this.boardList();
        })
        .catch((error) => {
          console.log(error);
          alert("글 삭제에 실패했습니다.");
          this.boardList();
        });
    },
  },
};
</script>

<style></style>
