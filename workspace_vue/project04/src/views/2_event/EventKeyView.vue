<template>
  <div>
    <!-- click 이벤트 / 키보드 Enter + keyup 이벤트-->
    <input type="search" name="" id="" @keyup.enter="doSearch" v-model="searchText">
    <button @click="doSearch">조회</button>
    <hr>

    <!-- 이벤트 객체를 이용한 keyup 이벤트 -->
    <input type="search" name="" id="" @keyup="checkEnter($event)" v-model="searchText">

    <!-- keyup이벤트의 세부 속성들
    .enter
    .tab
    .delete
    .space
    .ctrl.enter
    -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchText: ''
    }
  },
  methods: {
    doSearch() {
      alert(this.searchText)
    },
    checkEnter(event) {
      // alert(event)
      if (event.keyCode === 13) {
        this.doSearch()
      }
    }
  }
}
</script>
