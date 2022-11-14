<template>
  <div class="home">
    <board-list></board-list>
  </div>
</template>

<script>
import BoardList from "@/components/board/BoardList.vue";
export default {
  name: "BoardView",
  components: {
    BoardList,
  },
};
</script>
