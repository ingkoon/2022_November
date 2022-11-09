<template>
  <div class="hello">
    <h1>철원군 게시글</h1>
    <div v-if="users.length">
      <table id="book-list">
        <colgroup>
          <col style="width: 5%" />
          <col style="width: 15%" />
          <col style="width: 25%" />
          <col style="width: 25%" />
          <col style="width: 10%" />
        </colgroup>
        <thead>
          <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일아이디</th>
            <th>도메인</th>
            <th>가입일</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(user, index) in users" :key="user.userId">
            <td v-text="index + 1"></td>
            <td v-text="user.userId"></td>
            <td v-text="user.userName"></td>
            <td v-text="user.emailId"></td>
            <td v-text="user.emailDomain"></td>
            <td v-text="user.joinDate"></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import http from "@/api/httpmember.js";
export default {
  name: "MemberList",
  data() {
    return {
      users: [],
    };
  },
  created() {
    http
      .get("/")
      .then(({ data }) => {
        console.log(data);
        this.users = data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    MemberList() {
      http
        .get("/")
        .then(({ data }) => {
          console.log(data);
          this.users = data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  filters: {
    showDate(value) {
      return value.substr(0, 10);
    },
  },
};
</script>
<style scoped></style>
