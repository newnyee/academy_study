<template>
  <div>
    <h2>다양한 속성 바인딩</h2>
    <hr>
    <h3>v-bind 바인딩</h3>
    <!-- v-model이면 양방향 바인딩이 됨(request, response 둘 다 가능) -->
    <input type="text" v-model="userId">

    <!-- value 속성에 단방향 데이터 바인딩할 수 있음(response만 받음) -->
    <input type="text" v-bind:value="userId">

    <!-- v-bind 생략할 수 있음 -->
    <input type="text" :value="userId">
    <hr>

    <!-- 이미지 속성도 데이터 바인딩 할 수 있음 -->
    <h3>src 속성</h3>
    <img :src="imgSrc" alt="" style="width: 100px; height: auto;">
    <hr>

    <!-- disabled 속성 -->
    <h3>disabled 속성 바인딩 - 검색어를 입력하지 않으면 조회버튼 비활성화</h3>
    <input type="search" name="" id="" v-model="txt1">
    <button :disabled="txt1 === ''">조회</button> <!-- 빈 문자열일경우 버튼 비활성화 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      userId: 'korea',
      imgSrc: 'https://www.itwill.co.kr/css/wvtex/img/wvUser/logo.png',
      txt1: ''
    }
  }
}
</script>
