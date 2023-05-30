<template>
  <div class="container">
    <h3>방명록</h3>
    <!-- 목록 버튼 클릭시 리스트 가져옴 -->
    <p><button class="btn btn-success" @click="getList">목록</button></p>
    <ul class="list-group">
        <li v-if="memoList.length == 0" class="list-group-item">게시물이 없습니다</li>
        <li v-for="memo in memoList" v-bind:key="memo.memono" class="list-group-item">{{ memo.subject }}<span class="badge">{{ memo.readcnt }}</span></li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      memoList: []
    }
  },
  methods: {
    getList() {
      // fetch() AJAX 통신 역할
      // Promise 객체는 비동기 작업이 맞이할 미래의 완료 또는 실패와 그 결과 값을 나타낸다
      fetch('http://localhost:9095/memolist')
        .then((response) => {
          if (response.ok) {
            return response.json()
          }
        })
        .then((json) => {
          this.memoList = json
        })
    }
  }
}
</script>

<style>
  @import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'
</style>
