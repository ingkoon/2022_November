<template>
  <div class="hello">
    <h1>인재군 글</h1>
    <div>
      <table id="book-list">
        <colgroup>
          <col style="width: 25%" />
          <col style="width: 55%" />
        </colgroup>
        <tbody>
          <tr>
            <th>글번호</th>
            <td v-text="article.articleNo"></td>
          </tr>
          <tr>
            <th>작성자</th>
            <td v-text="article.userId"></td>
          </tr>
          <tr>
            <th>제목</th>
            <td v-text="article.subject"></td>
          </tr>
          <tr>
            <th>내용</th>
            <textarea v-text="article.content" rows="5"></textarea>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import http from "@/api/http.js";
export default {
  name: "BoardDetail",
  data() {
    return {
      articleNo: "",
      userId: "",
      subject: "",
      content: "",
      registerTime: "",
      hit: 0,
    };
  },
  created() {
    let no = this.$route.params.articleNo;
    //this.$route.query.articleNo;
    http
      .get(`/${no}`)
      .then(({ data }) => {
        console.log(data);
        this.article = data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {},
};
</script>
<style scoped></style>
