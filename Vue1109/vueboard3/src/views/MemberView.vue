<template>
  <div class="container">
    <h2 class="text-center">철원군 유저리스트</h2>
    <nav>
      <router-link to="/member/list">유저 목록</router-link> |
      <router-link to="/member/write">유저 등록</router-link>
    </nav>
    <router-view></router-view>
  </div>
</template>
<script>
export default {};
</script>
<style scoped></style>
