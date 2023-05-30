<template>
  <div>
    <h3>class 속성 바인딩</h3>
    <div style="color:red">클래스 바인딩1</div>
    <div class="text-red">클래스 바인딩2</div>

    <!-- 선택자명에 특수문자가 포함되어있지 않을 경우 ''기호 생략 가능 -->
    <div :class="{active:true}">클래스 바인딩3</div>
    <div :class="{'active':true}">클래스 바인딩4</div>

    <!-- 선택자명에 특수문자가 포함되어있을 경우 ''기호 생략 불가 -->
    <div :class="{'text-red':true}">클래스 바인딩5</div>
    <div :class="{'text-red':false}">클래스 바인딩6</div>

    <div :class="{'text-red':hasError, 'active':isActive}">클래스 바인딩7</div>

    <!-- class를 배열로 저장 후 적용. 실무에서 그렇게 많이 사용하지는 않음 -->
    <div :class="class2">클래스 바인딩8</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      hasError: true,
      isActive: true,
      class2: ['active', 'text-red']
    }
  }
}
</script>

<!-- scoped : 현재 문서에서만 스타일 적용 -->
<style scoped>
  .active {background-color: greenyellow; font-weight: bold;}
  .text-red {color: red;}
</style>
