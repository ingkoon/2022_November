<template>
  <div class="hello">
    <h1>인재군 글</h1>
    <div>
      <form
        action="#none"
        method="post"
        id="_frmForm"
        name="frmForm"
        @submit.prevent="updatemember"
      >
        <table id="book-list">
          <colgroup>
            <col style="width: 25%" />
            <col style="width: 55%" />
          </colgroup>
          <tbody>
            <tr>
              <th>아이디</th>
              <td>
                <input
                  readonly
                  type="text"
                  v-model="userId"
                  id="userId"
                  ref="userId"
                />
              </td>
            </tr>
            <tr>
              <th>이름</th>
              <td>
                <input
                  readonly
                  type="text"
                  v-model="userName"
                  id="userName"
                  ref="userName"
                />
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <input
                  readonly
                  type="text"
                  v-model="userPwd"
                  id="userPwd"
                  ref="userPwd"
                />
              </td>
            </tr>
            <tr>
              <th>이메일 아이디</th>
              <td>
                <input
                  readonly
                  type="text"
                  v-model="emailId"
                  id="emailId"
                  ref="emailId"
                />
              </td>
            </tr>
            <tr>
              <th>이메일 도메인</th>
              <td>
                <input
                  readonly
                  type="text"
                  v-model="emailDomain"
                  id="emailDomain"
                  ref="emailDomain"
                />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <input type="submit" value="회원정보 수정" />
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</template>

<script>
import http from "@/api/httpmember.js";
export default {
  name: "MemberDetail",
  data() {
    return {
      userId: "",
      userName: "",
      userPwd: "",
      emailId: "",
      emailDomain: "",
    };
  },
  created() {
    let id = this.$route.params.userId;
    //this.$route.query.articleNo;
    http
      .get(`/${id}`)
      .then(({ data }) => {
        //console.log(data);
        this.userId = data.userId;
        this.userName = data.userName;
        this.userPwd = data.userPwd;
        this.emailId = data.emailId;
        this.emailDomain = data.emailDomain;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    updateboard() {
      let myData = {
        userId: this.userId,
        userName: this.userName,
        userPwd: this.userPwd,
        emailId: this.emailId,
        emailDomain: this.emailDomain,
      };
      http
        .put(`/`, myData)
        .then(({ data }) => {
          if (data != null) alert("성공적으로 글을 수정하였습니다.");
          this.moveMember(this.userId);
        })
        .catch(() => {
          alert("글수정에 실패하였습니다.");
          this.moveList();
        });
    },
    moveList() {
      this.$router.push("/board/list");
    },
    moveMember(userId) {
      this.$router.go(`/board/detail/${userId}`);
    },
  },
};
</script>
<style scoped></style>
