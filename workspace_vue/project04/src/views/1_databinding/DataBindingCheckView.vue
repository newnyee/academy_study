<template>
  <div>
    <h3>checkbox 바인딩</h3>
    <div>
      <input type="checkbox" id="html" value="HTML" v-model="favoriteLang">
      <label for="html">HTML</label>
    </div>
    <div>
      <input type="checkbox" id="css" value="CSS" v-model="favoriteLang">
      <label for="css">CSS</label>
    </div>
    <div>
      <input type="checkbox" id="js" value="JavaScript" v-model="favoriteLang">
      <label for="js">JavaScript</label>
    </div>
    <div>선택한 과목 : {{ favoriteLang }}</div>
  </div>
  <hr>

  <div>
    <h3>radio 바인딩</h3>
    <div>
      <input type="radio" id="java" value="JAVA" v-model="favoriteLang1">
      <label for="java">JAVA</label>
    </div>
    <div>
      <input type="radio" id="python" value="PYTHON" v-model="favoriteLang1">
      <label for="python">PYTHON</label>
    </div>
    <div>
      <input type="radio" id="kotlin" value="KOTLIN" v-model="favoriteLang1">
      <label for="kotlin">KOTLIN</label>
    </div>
    <div>선택한 과목 : {{ favoriteLang1 }}</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      favoriteLang: ['JavaScript'], // 여러개 선택이 가능한 값은 반드시 배열로 선언한다
      favoriteLang1: '' // radio속성은 하나만 선택되기 때문에 문자열로 선언한다.
    }
  }
}
</script>
