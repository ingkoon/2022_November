<template>
  <b-tr>
    <b-td v-text="article.articleNo"></b-td>
    <b-td
      v-text="article.subject"
      @click="showArticle(article.articleNo)"
    ></b-td>
    <b-td v-text="article.userId"></b-td>
    <b-td v-text="article.hit"></b-td>
    <b-td v-text="article.registerTime"></b-td>
  </b-tr>
</template>
<script>
// import http from "@/api/http.js";
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
  },
};
</script>
<style scoped></style>
