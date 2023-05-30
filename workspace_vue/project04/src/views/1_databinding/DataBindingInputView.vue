<template>
  <div>
    <h3>input 바인딩 - 양방향</h3>
    <input type="text" v-model="userId"> <!-- request, response 역할을 한꺼번에 해줌 -->
    <hr>

    <h3>이벤트</h3>
    <button @click="myFunction">클릭</button> <!-- 파라미터가 없다면 괄호() 생략 가능 -->
    <button @click="changeData">변경</button>
    <hr>

    <h3>숫자 바인딩</h3>
    <span>문자열 연산</span>
    <input type="text" v-model="num1">
    <input type="text" v-model="num2">
    <span>{{ num1+num2 }}</span>
    <br>
    <span>숫자형 연산</span>
    <input type="text" v-model.number="num3">
    <input type="text" v-model.number="num4">
    <span>{{ num3+num4 }}</span>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userId: 'itwill.co.kr',
      num1: 0,
      num2: 0,
      num3: 0,
      num4: 0
    }
  },
  methods: {
    myFunction() { // function 키워드 생략, 주석 띄어쓰기 주의
      alert(this.userId)
    },
    changeData() {
      this.userId = 'KOREA'
    }
  }
}
</script>
