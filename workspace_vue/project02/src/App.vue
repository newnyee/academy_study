<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <img alt="JS logo" width="187" src="./assets/js.png"><br><br>
  <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->

  <!-- 1) 데이터, 스타일 바인딩 -->
  <div>
    <h3>1) 데이터, 스타일 바인딩</h3>
    <h4>{{ title }}</h4>
    <div>
      <span :style="style1">딸기</span>: {{ price1 }}만원 <!-- :style -> 문법(콜론, 띄어쓰기) 주의 -->
    </div>
    <br>
    <div>
      <span :style="style2">멜론</span>: {{ price2 }}만원
    </div>
  </div>
  <hr>

  <!-- 2) 데이터 바인딩(배열) -->
  <div>
    <h3>2) 데이터 바인딩(배열)</h3>
    <div>
      <h4>{{ products[0] }}</h4>
      <p>70 만원</p>
    </div>
    <div>
      <h4>{{ products[1] }}</h4>
      <p>80 만원</p>
    </div>
    <div>
      <h4>{{ products[2] }}</h4>
      <p>90 만원</p>
    </div>
  </div>
  <hr>

  <!-- 3) 반복문 + 스타일 추가 -->
  <div>
    <h3>3) 반복문</h3>
    <div class="menu" v-for="m in 3" :key="m"> <!-- key값을 꼭 넣어줘야함 -->
      <a>Home</a>
      <a>Products</a>
      <a>About</a>
      <hr>
    </div>
    <br>
    <div class="menu">
      <a v-for="m in 3" :key="m">Home{{ m }}</a> <!-- m: 현재 인덱스 -->
    </div>
    <br>
    <div class="menu">
      <a v-for="menu in menus" :key="menu">{{ menu }}</a> <!-- m: 현재 회전 인덱스 -->
    </div>
    <br>
    <div class="menu">
      <a v-for="(menu1, i) in menus" :key="i">{{ menu1 }}{{ i }}</a>
    </div>
  </div>
  <hr>

  <!-- 4) 이벤트 핸들러 -->
  <div>
    <h3>4) 이벤트 핸들러</h3>
    <div>
      <h4>{{ kindOfEvent[0] }}</h4>
      <p>
        <!-- <button v-on:click="">이벤트:클릭</button> 형식으로도 사용가능 -->
        <button @click="counts[0]++">이벤트:클릭</button> 
        <span> 클릭 횟수: {{ counts[0] }}</span>
      </p>
    </div>
    <br>
    
    <div>
      <h4>{{ kindOfEvent[1] }}</h4>
      <p>
        <button @mouseover="counts[1]++">이벤트:마우스오버</button> 
        <span> 마우스오버 횟수: {{ counts[1] }}</span>
      </p>
    </div>
  </div>
  <hr>

  <!-- 5) 이벤트와 함수 -->
  <div>
    <h3>5) 이벤트와 함수</h3>
    <h4>{{ kindOfEvent[2] }}</h4>
    <p>
      <button @click="increase()">이벤트+함수호출</button> 
      <span> 클릭 + 함수호출 횟수: {{ counts[2] }}</span>
    </p>
  </div>
  <hr>

  <!-- 6) 모달창 만들기(조건문)  -->
  <div>
    <h3>6) 모달창 만들기(조건문)</h3>
    <div>
      <h4 @click="modalWin=true">모달창 open</h4>
    </div>
    
    <div class="black-bg" v-if="modalWin==true">
      <div class="white-bg">
        <h4>상세페이지</h4>
        <p>상세페이지 내용</p>
        <button @click="modalWin=false">닫기</button>
      </div>
    </div>
  </div>
  <hr>

  <!-- 7) import/export -->
  <div>
    <h3>7) import/export</h3>
    <div>
      apple: {{ a }}<br>
      apple1: {{ b }}
    </div>
  </div>
  <hr>
</template>

<script>
// import 변수명 from 파일경로
// 주의사항 : export 해놓은 변수를 사용하지 않으면 에러발생
// import HelloWorld from './components/HelloWorld.vue'

import {apple, apple1} from './assets/jsfile.js'

export default {
  name: 'App',
  components: {
    // HelloWorld
  },
  data() { //바인딩할 데이터 보관용(변수 등)
    return {
      title: '과일종류: 가격',
      style1: 'color: red', //스타일속성
      style2: 'color: green', //스타일속성
      price1: 2,
      price2: 3,
      products: ['신사동 원룸', '논현동 원룸', '강남동 원룸'], //배열
      menus: ['HOME', 'SHOP', 'ABOUT'],
      kindOfEvent: ['click event', 'mouseover event', 'click event and function'],
      counts: [0, 0, 0],
      modalWin: false,
      a: apple,
      b: apple1,
    }
  },
  methods: {
    increase() {
      this.counts[2]++ //변수 가져올 때 this 붙여줘야함
    }
  },
}
</script>

<style>
#app {
  font-family: Consolas ,Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.menu{
  background: rgb(139, 61, 84);
  padding: 15px;
  border-radius: 5px;
}

.menu a {
  color: antiquewhite;
  padding: 10px;
}

.black-bg {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 200px;
  background: #e0e0e0;
}

.white-bg {
  width: 80%;
  background: white;
  border-radius: 8px;
  padding: 20px;
}
</style>
